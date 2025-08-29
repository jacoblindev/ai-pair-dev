#!/usr/bin/env bash
set -euo pipefail

issues=0

check_trailing_spaces() {
  local f="$1"
  if grep -nE ' +$' "$f" >/dev/null; then
    echo "MD lint: trailing spaces in $f" >&2
    issues=$((issues+1))
  fi
}

check_tabs() {
  local f="$1"
  if grep -n $'\t' "$f" >/dev/null; then
    echo "MD lint: tab characters in $f" >&2
    issues=$((issues+1))
  fi
}

check_line_length() {
  local f="$1"
  awk 'length($0) > 120 { print FILENAME":"NR" line exceeds 120 chars"; exit 1 }' "$f" 2>/dev/null || {
    echo "MD lint: long line (>120) in $f" >&2
    issues=$((issues+1))
  }
}

while IFS= read -r -d '' f; do
  check_trailing_spaces "$f"
  check_tabs "$f"
  # Be lenient: only warn (don’t fail) for long lines in examples
  if [[ "$f" != docs/EXAMPLES/* ]]; then
    if awk 'length($0) > 200 { exit 1 }' "$f"; then :; else
      echo "MD lint: line >200 chars in $f" >&2
      issues=$((issues+1))
    fi
  fi
done < <(find . -type f -name "*.md" -not -path "*/node_modules/*" -print0)

if [ "$issues" -gt 0 ]; then
  echo "Markdown lint found $issues issue(s)." >&2
  exit 1
else
  echo "Markdown lint passed."
fi
