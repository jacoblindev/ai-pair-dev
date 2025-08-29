# AI Dev Tasks v2

Builds upon snarktank/ai-dev-tasks (Apache-2.0).

An opinionated, junior-friendly workflow for shipping with a Product Requirements Document (PRD) → Task generation → Task processing, now with stronger architecture, testing, file-size, and dependency guardrails. The original 3-file semantics remain: `create-prd.md`, `generate-tasks.md`, `process-task-list.md` (moved to `/rules`).

## Quick Start

If you have 10 minutes, follow docs/QUICKSTART.md for the complete flow:

1) Write/Revise PRD with Module Plan, Test Strategy, Dep Policy
2) Generate tasks with the “0.0 Scaffolding & Guards” parent task
3) Process one sub-task at a time with hard gates (structure, tests, deps)

See [QUICKSTART.md](docs/QUICKSTART.md).

## Lite Path (≤ 50 LOC)

For very small changes with no new public API, use the inline mini-PRD template and still honor the gates.

See [LITE-PATH.md](docs/LITE-PATH.md).

## Workflow (5 steps)

- Step 1: PRD — Write or revise a PRD that a junior dev could build from.
- Step 2: Assess — Use `scripts/scan_repo.sh` to build `ASSESSMENT.md`.
- Step 3: Tasks — Generate parent tasks, include “0.0 Scaffolding & Guards”. Pause/confirm before sub-tasks.
- Step 4: Implement — One sub-task at a time; run tests; commit.
- Step 5: Review — Ensure gates pass; PR ready.

The detailed rules live in `/rules`. Additional guides and examples are in `/docs`.

## What’s new in v2

- Architecture-first scaffolding and explicit module boundaries
- File/function size and complexity thresholds (configurable)
- Test strategy expectations and pruning guidance
- Dependency allowlist/blocklist baselines + ADR requirements
- Pre-commit and CI hooks to keep projects healthy

## License

Apache-2.0. See [LICENSE](LICENSE).
