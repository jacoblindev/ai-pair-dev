#!/usr/bin/env bash
set -euo pipefail

echo "Complexity gate (stub):"
echo "- JS/TS: enable eslint rules: max-lines, complexity, max-lines-per-function, and eslint-plugin-boundaries."
echo "- Java: add Checkstyle/PMD with cyclomatic thresholds; consider ArchUnit rules."
echo "- Python: use ruff/flake8 with cognitive complexity plugin or radon."
echo "Configure thresholds via configs/.aidev.yml."
echo "(This stub reports guidance only and always passes.)"
