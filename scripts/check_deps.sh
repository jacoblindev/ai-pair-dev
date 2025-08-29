#!/usr/bin/env bash
set -euo pipefail

ALLOW="configs/deps-allowlist.json"
BLOCK="configs/deps-blocklist.json"

blocked_names=$(grep -Eo '"name"\s*:\s*"[^"]+"' "$BLOCK" 2>/dev/null | sed 's/.*:"\(.*\)"/\1/') || true

warns=0

scan_file_for_blocked() {
  local file="$1"
  local name
  for name in $blocked_names; do
    if grep -qi -- "$name" "$file"; then
      echo "Dependency gate: Blocklisted dependency referenced in $file: $name" >&2
      warns=$((warns+1))
    fi
  done
}

if [ -f package.json ]; then
  scan_file_for_blocked package.json
fi

if [ -f pom.xml ]; then
  scan_file_for_blocked pom.xml
fi

if ls requirements*.txt >/dev/null 2>&1; then
  for f in requirements*.txt; do scan_file_for_blocked "$f"; done
fi

echo "Allowlist/Blocklist loaded. This script is a lightweight guard; use stack tools for full checks."
echo "- JS/TS: npm ls --prod; license-checker"
echo "- Java: mvn dependency:tree; license-maven-plugin"
echo "- Python: pipdeptree; pip-licenses"

if [ "$warns" -gt 0 ]; then
  echo "Dependency check found $warns issue(s)." >&2
  exit 1
else
  echo "Dependency check passed."
fi
