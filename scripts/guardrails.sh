#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

echo "[guardrails] Running markdown lint..."
bash scripts/md_lint.sh

echo "[guardrails] Checking file sizes..."
bash scripts/check_file_sizes.sh

echo "[guardrails] Complexity guidance (stub)..."
bash scripts/check_complexity_stub.sh

echo "[guardrails] Checking dependencies..."
bash scripts/check_deps.sh

echo "[guardrails] All guardrails passed."
