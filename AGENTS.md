# Agents Guide (Codex/Copilot)

Purpose: One entrypoint for AI agents (and humans) to follow the PRD → Tasks → Process workflow with v2 guardrails.

## Start Here

- Read: `rules/create-prd.md`, `rules/generate-tasks.md`, `rules/process-task-list.md`.
- Use thresholds in `configs/.aidev.yml` (limits, tests, deps, stack).
- Run guardrails with `bash scripts/guardrails.sh`.

## Gates (must pass for each sub-task)

- Structure: No file > `max_file_lines`; no function > `max_func_lines` or `max_cyclomatic`; imports respect `ARCH.md`.
- Tests: Focus on public behavior; prune/update obsolete tests in the same PR; keep runtime within `tests.local_time_budget_min`.
- Deps: New runtime deps require an ADR and approval; respect allowlist/blocklist; run license/security checks per stack.
- Architecture lint: Prefer ArchUnit (Java) or eslint-plugin-boundaries (JS/TS) if applicable.

## Commands

- Assess repo: `bash scripts/scan_repo.sh` (writes `ASSESSMENT.md`).
- Run all guardrails: `bash scripts/guardrails.sh`.
- Individually: `bash scripts/check_file_sizes.sh`, `bash scripts/check_complexity_stub.sh`, `bash scripts/check_deps.sh`, `bash scripts/md_lint.sh`.

## Task Rhythm

1) PRD: Write or revise PRD with Module Plan, Test Strategy, Dep Policy.
2) Parents: Include “0.0 Scaffolding & Guards” and “X.0 Align & prune tests”. Pause/confirm before sub-tasks.
3) Sub-tasks: 1–4h each; implement minimal code; run guardrails and tests; conventional commits.
4) PR: Ensure gates pass locally and in CI.

## First Prompts (examples)

- “Follow AGENTS.md. Start with `rules/create-prd.md`. Use `configs/.aidev.yml`. Propose parent tasks including 0.0 scaffolding; pause for confirmation. Before completing any sub-task, run `bash scripts/guardrails.sh`.”
- “Generate tasks per `rules/generate-tasks.md`. Enforce size/complexity and dependency gates. Include X.0 Align & prune tests.”

## Docs and Templates

- Quickstart: `docs/QUICKSTART.md`
- Lite Path: `docs/LITE-PATH.md`
- Feedback Loop: `docs/FEEDBACK-LOOP.md`
- Parallel Work: `docs/PARALLEL-WORKFLOWS.md`
- Stack Integrations: `docs/STACK-INTEGRATIONS.md`
- Templates: `templates/ARCH.md`, `templates/ADR-0001-template.md`, `templates/MINI-PRD.md`
