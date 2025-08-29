#!/usr/bin/env bash
set -euo pipefail

DETECT_ONLY=${1:-}

ROOT="$(pwd)"
OUT="${ROOT}/ASSESSMENT.md"

detect_stack() {
  if [ -f "pom.xml" ] || [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
    echo "java"
  elif [ -f "package.json" ]; then
    echo "js-ts"
  elif [ -f "pyproject.toml" ] || [ -f "requirements.txt" ] || [ -d ".venv" ]; then
    echo "python"
  else
    echo "unknown"
  fi
}

guess_test_cmd() {
  case "$1" in
    java) echo "mvn -q test || gradle test" ;;
    js-ts) echo "npm test || pnpm test || yarn test" ;;
    python) echo "pytest -q" ;;
    *) echo "{{add stack-specific test command}}" ;;
  esac
}

print_tree() {
  # Light-weight tree (max depth 3)
  find . -maxdepth 3 -not -path "*/\\.*" -not -path "*/node_modules/*" -not -path "*/.venv/*" | sed 's|^\./||' | sort
}

STACK=$(detect_stack)
TEST_CMD=$(guess_test_cmd "$STACK")

if [ "$DETECT_ONLY" = "--detect-only" ]; then
  echo "Detected stack: $STACK"
  echo "Suggested test command: $TEST_CMD"
  exit 0
fi

{
  echo "# Repository Assessment"
  echo
  echo "## Detected Stack"
  echo
  echo "- Stack: $STACK"
  echo "- Suggested test command: $TEST_CMD"
  echo
  echo "## Repo Tree (depth ≤ 3)"
  echo
  print_tree | sed 's/^/  /'
  echo
  echo "## Notes"
  echo "- Consider wiring complexity/lint based on stack (see docs/STACK-INTEGRATIONS.md)."
  echo "- Dependency allowlist/blocklist in configs/."
} > "$OUT"

echo "Wrote $OUT"
