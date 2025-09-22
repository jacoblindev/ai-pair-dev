# Agents Guide (Codex/Copilot)

Purpose: Keep the PRD → architecture → tasks → delivery loop lightweight while preserving the guardrails that keep big efforts sane.

## Multi-Agent Workflow

- **Roles** — Default to three hats even if one person wears multiple: Planner (Codex) curates scope, Implementer (Copilot) ships sub-tasks, Reviewer (human or automated) validates gates and closes loops.
- **Scope Anchor** — The PRD is the single source of truth. Keep clarifications, assumptions, and scope shifts live there so any agent can pick up with confidence.
- **Status Metadata** — Each shared doc starts with `Owner`, `Active Agent`, `Last touch`, and `Next decision needed`. Update these headers whenever the baton changes hands; omit only when working solo end-to-end.
- **Handoff Pack** — Capture the current state, open questions, and next steps in `docs/handoff/<slug>-vN.md` (copy `docs/handoff/TEMPLATE.md`) before agents switch roles. Link the handoff from the PRD and tasks file headers.
- **Solo Mode** — When a single agent does all phases, keep metadata current anyway; it keeps context ready for surprise collaborators.

## Start Here

- Read once per project: `rules/create-prd.md`, `rules/generate-tasks.md`, `rules/process-task-list.md`.
- Skim `README.md` for current repo context.

## Core Artefacts

- PRD: `docs/prd/<feature-slug>-vN.md`
- Architecture: `docs/arch/<product>/ARCH-vN.md` (plus shared entries like `docs/arch/foundation/ARCH-vN.md`)
- Architecture index: `docs/arch/index.md` (portfolio map + owners)
- ADRs: `docs/adr/ADR-00xx-<short-title>.md`
- Tasks: `docs/tasks/<feature-slug>-vN.md`
- Portfolio log: `docs/portfolio/log.md` (milestones, cross-product decisions)

## Gates (each sub-task)

- Tests: Public behavior covered; update/retire obsolete tests in the same change; keep runtime reasonable.
- Boundaries: Respect the latest relevant `ARCH-v*` file and declared public APIs; log deviations via ADR or updated ARCH.
- Dependencies: Any new runtime dependency requires a short ADR and human approval.

Optional extras: size/complexity heuristics, architecture lint, light dep/license checks.

## Rhythm

1) **Clarify & Scope** — Capture questions/answers in the PRD; only escalate when still ambiguous.
2) **Draft** — Produce PRD → ARCH → first ADR in one pass; skip sections with `n/a` if not needed. Set metadata headers and link any active handoff doc.
3) **Plan** — Sketch task parents (0.0 Scaffolding, X.0 Align & prune tests, plus feature slices); approvals are opt-in. Mark when the tasks file is “Implementer-ready” so another agent can start.
4) **Build** — Expand into 1–4h sub-tasks. Work one slice at a time; batching tiny tweaks in the same slice is OK. Update the handoff snapshot when switching agents.
5) **Decide & Log** — Record structural/dep changes with an ADR and add a one-line note to the portfolio log. Refresh metadata so the next agent inherits a stable state.

## Checklist (condensed)

- Clarify: Ask 3–8 essential questions; confirm feature slug, target product (for ARCH), version.
- Draft PRD: `docs/prd/<slug>-vN.md` with acceptance criteria, module plan, test & dep stance.
- Draft ARCH + ADR: `docs/arch/<product>/ARCH-vN.md` + first ADR capturing key choices.
- Plan: `docs/tasks/<slug>-vN.md` with 0.0 Scaffolding, feature parents, X.0 Align & prune tests. Pause only if the owner requests it.
- Sub-tasks: Expand parents into 1–4h slices with acceptance criteria tied to the three gates.
- Implement: Ship sub-task, update tests/docs, tick task list, log ADR/portfolio note if needed, then check in before the next slice with a metadata refresh or handoff snapshot.
- Dependencies: Runtime deps always need an ADR and owner approval.
- Versioning: Bump `vN` when scope or boundaries change; link superseded docs in the new version header.

## Human Touchpoints (default opt-in)

- PRD sign-off (optional unless requested)
- ARCH/ADR review when boundaries or deps shift
- Parent task review (optional)
- Before starting each sub-task if the owner asked to be looped in
- Any ADR introducing a runtime dependency or cross-product impact (must confirm)

## Prompt Seeds

- “Follow `AGENTS.md`. Draft `docs/prd/<slug>-v1.md`, then `docs/arch/<product>/ARCH-v1.md` and an ADR. Share parent tasks in `docs/tasks/<slug>-v1.md`.”
- “Use `rules/generate-tasks.md` with `docs/arch/<product>/ARCH-v*.md` as boundaries. Include 0.0 Scaffolding and X.0 Align & prune tests.”
- “Process `docs/tasks/<slug>-v1.md` sub-task {{id}}. Ensure tests/architecture/dependency gates pass; log ADR + portfolio note if applicable.”
- “Prepare handoff for {{slug}}: update PRD/task metadata, refresh `docs/handoff/<slug>-vN.md`, and tag the next agent.”

Keep it simple, stay within the guardrails, and escalate only when decisions need a human.
