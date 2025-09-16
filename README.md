# AI Pair Dev

Lean workflow for agents + humans to iterate from PRD → architecture → tasks → sub-tasks with just enough guardrails.

## Start Here

- Read `AGENTS.md` for the overview, artefacts, and rhythm.
- Reference the detailed guardrails in:
  - `rules/create-prd.md`
  - `rules/generate-tasks.md`
  - `rules/process-task-list.md`

## Docs Layout (flattened)

- PRD: `docs/prd/<feature-slug>-vN.md`
- Architecture: `docs/arch/<product>/ARCH-vN.md`
- Architecture index: `docs/arch/index.md`
- ADRs: `docs/adr/ADR-00xx-<short-title>.md`
- Tasks: `docs/tasks/<feature-slug>-vN.md`
- Portfolio log: `docs/portfolio/log.md`

Sample templates live under `docs/templates/`.

## Workflow Snapshot

1. **Clarify** — Ask only what you need; capture answers inside the PRD.
2. **Draft** — Produce PRD → Architecture → ADR in one pass (skip sections with `n/a` if irrelevant).
3. **Plan** — Create tasks with 0.0 Scaffolding, feature parents, and X.0 Align & prune tests. Approvals are opt-in.
4. **Implement** — Work one sub-task (1–4h slice) at a time; follow the three gates: tests, boundaries, dependencies.
5. **Log** — Record structural or dependency decisions in an ADR plus a one-liner in the portfolio log.
6. **Version** — Bump `vN` when scope or boundaries change; link superseded docs in the new version header.

## Roles

- **User** — Sets goals/constraints, answers clarification, chooses when to review or approve, signs off on ADRs that add runtime dependencies or cross-product impact.
- **Agent** — Drafts artefacts, proposes tasks, implements sub-tasks, runs checks, keeps docs/logs updated, escalates only when decisions need humans.

## License

Apache-2.0. See `LICENSE`.
