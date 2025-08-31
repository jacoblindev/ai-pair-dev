# Agents Guide (Codex/Copilot)

Purpose: One entrypoint for AI agents (and humans) to follow the PRD → SD/SA → Tasks → Process workflow with lean guardrails.

## Start Here

- Read: `rules/create-prd.md` (produce a lightweight SD/SA: `ARCH.md` + `ADR-0001`), `rules/generate-tasks.md`, `rules/process-task-list.md`.

## Gates (must pass for each sub-task)

- Tests: Public behavior covered; obsolete tests updated/removed in the same PR; local runtime reasonable.
- Boundaries: Imports respect `ARCH.md` and public APIs; deviations documented (ADR/update `ARCH.md`).
- Dependencies: New runtime deps require a short ADR and approval.

Optional extras: size/complexity heuristics, architecture lint (ArchUnit/eslint-boundaries), simple dep/license checks.

## Task Rhythm

1) PRD: Write or revise PRD with Module Plan, Test Strategy, Dep Policy.
2) SD/SA: From the PRD, write `ARCH.md` (1–2 pages) + `ADR-0001` with key choices.
3) Parents: Include “0.0 Scaffolding” and “X.0 Align & prune tests”. Pause/confirm before sub-tasks.
4) Sub-tasks: 1–4h each; implement minimal code; run tests; conventional commits.
5) PR: Ensure gates pass locally.

## First Prompts (examples)

- “Follow AGENTS.md. Start with `rules/create-prd.md`. Produce `ARCH.md` + `ADR-0001` from the PRD. Propose parent tasks including 0.0 scaffolding; pause for confirmation.”
- “Generate tasks per `rules/generate-tasks.md` using `ARCH.md` as boundaries. Include X.0 Align & prune tests.”
