# Agents Guide (Codex/Copilot)

Purpose: One entrypoint for AI agents (and humans) to follow the PRD → SD/SA → Tasks → Process workflow with lean guardrails and a versioned docs layout.

## Start Here

- Read: `rules/create-prd.md`, `rules/generate-tasks.md`, `rules/process-task-list.md`.
- Store artifacts in versioned folders under `docs/`:
  - PRD: `docs/prd/<feature-slug>/vN/prd.md`
  - SD/SA (project-wide): `docs/architecture/ARCH-vN.md`
  - ADRs: `docs/adr/ADR-00xx-<short-title>.md`
  - Tasks: `docs/tasks/<feature-slug>/vN/tasks.md`

## Gates (must pass for each sub-task)

- Tests: Public behavior covered; obsolete tests updated/removed in the same PR; local runtime reasonable.
- Boundaries: Imports respect latest `docs/architecture/ARCH-v*.md` and public APIs; deviations documented (ADR/update ARCH).
- Dependencies: New runtime deps require a short ADR and approval under `docs/adr/`.

Optional extras: size/complexity heuristics, architecture lint (ArchUnit/eslint-boundaries), simple dep/license checks.

## Task Rhythm

1) PRD: Write or revise PRD with Module Plan, Test Strategy, Dep Policy in `docs/prd/<slug>/vN/prd.md`.
2) SD/SA: From the PRD, write `docs/architecture/ARCH-vN.md` (1–2 pages) + first ADR under `docs/adr/` with key choices.
3) Parents: Include “0.0 Scaffolding” and “X.0 Align & prune tests” in `docs/tasks/<slug>/vN/tasks.md`. Pause/confirm before sub-tasks.
4) Sub-tasks: 1–4h each; implement minimal code; run tests; conventional commits.
5) PR: Ensure gates pass locally.

## First Prompts (examples)

- “Follow AGENTS.md. Start with `rules/create-prd.md`. Save PRD to `docs/prd/<slug>/v1/prd.md`. Produce `docs/architecture/ARCH-v1.md` + an ADR in `docs/adr/`. Propose parent tasks in `docs/tasks/<slug>/v1/tasks.md`; pause for confirmation.”
- “Generate tasks per `rules/generate-tasks.md` using latest `docs/architecture/ARCH-v*.md` as boundaries. Include X.0 Align & prune tests.”
