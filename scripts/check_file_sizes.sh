#!/usr/bin/env bash
set -euo pipefail

CONFIG="configs/.aidev.yml"
if [ ! -f "$CONFIG" ]; then
  echo "Missing $CONFIG; using defaults." >&2
  MAX_FILE_LINES=500
else
  MAX_FILE_LINES=$(awk '/max_file_lines:/ {print $2; exit}' "$CONFIG")
  : "${MAX_FILE_LINES:=500}"
fi

echo "Max file lines: $MAX_FILE_LINES"

CODE_EXTS=".js .ts .tsx .jsx .java .kt .py .rb .go .rs .c .h .cpp .cs .sh"

violations=0

is_code_file() {
  local f="$1"
  for ext in $CODE_EXTS; do
    if [[ "$f" == *"$ext" ]]; then return 0; fi
  done
  return 1
}

while IFS= read -r -d '' file; do
  # Skip non-code files
  if ! is_code_file "$file"; then continue; fi
  lines=$(wc -l < "$file" | tr -d ' ')
  if [ "$lines" -gt "$MAX_FILE_LINES" ]; then
    echo "Size gate: $file has $lines lines (max $MAX_FILE_LINES)" >&2
    violations=$((violations+1))
  fi
done < <(find . \
  -type f \
  -not -path "*/.git/*" \
  -not -path "*/node_modules/*" \
  -not -path "*/.venv/*" \
  -not -path "*/dist/*" \
  -not -path "*/build/*" \
  -not -path "*/.cache/*" \
  -print0)

if [ "$violations" -gt 0 ]; then
  echo "File size check failed ($violations violation(s))." >&2
  exit 1
else
  echo "File size check passed."
fi
