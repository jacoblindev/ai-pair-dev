# Agents Guide (Codex/Copilot)

Purpose: One entrypoint for AI agents (and humans) to follow the PRD → Tasks → Process workflow with lean guardrails.

## Start Here

- Read: `rules/create-prd.md`, `rules/generate-tasks.md`, `rules/process-task-list.md`.

## Gates (must pass for each sub-task)

- Structure: No file > `max_file_lines`; no function > `max_func_lines` or `max_cyclomatic`; imports respect `ARCH.md`.
- Tests: Focus on public behavior; prune/update obsolete tests in the same PR; keep runtime within the agreed local budget.
- Deps: New runtime deps require an ADR and approval; respect an allowlist/blocklist; run license/security checks appropriate to the stack.
- Architecture lint: Prefer ArchUnit (Java) or eslint-plugin-boundaries (JS/TS) if applicable.

## Task Rhythm

1) PRD: Write or revise PRD with Module Plan, Test Strategy, Dep Policy.
2) Parents: Include “0.0 Scaffolding & Guards” and “X.0 Align & prune tests”. Pause/confirm before sub-tasks.
3) Sub-tasks: 1–4h each; implement minimal code; run tests; conventional commits.
4) PR: Ensure gates pass locally and in CI.

## First Prompts (examples)

- “Follow AGENTS.md. Start with `rules/create-prd.md`. Propose parent tasks including 0.0 scaffolding; pause for confirmation.”
- “Generate tasks per `rules/generate-tasks.md`. Enforce size/complexity and dependency gates. Include X.0 Align & prune tests.”
