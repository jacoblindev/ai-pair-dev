# AI PAIR DEV

Lean, agent-friendly workflow for PRD → SD/SA → Tasks → Sub‑tasks with simple guardrails and versioned docs.

Based on ideas from `snarktank/ai-dev-tasks` (Apache‑2.0) with tweaks for AI pair‑development.

## Start Here

- Read `AGENTS.md` for the overview and rhythm.
- Follow the rules in:
  - `rules/create-prd.md`
  - `rules/generate-tasks.md`
  - `rules/process-task-list.md`

Current state (preloaded in this repo):

- `docs/architecture/ARCH-v1.md` (draft) defines hexagonal boundaries.
- `docs/adr/ADR-0001-architecture-style.md` is accepted and anchors the style.
- `docs/prd/sample-feature/v1/prd.md` and `docs/tasks/sample-feature/v1/tasks.md` show the expected structure.

## Docs Layout

- PRD: `docs/prd/<feature-slug>/vN/prd.md`
- SD/SA (project‑wide): `docs/architecture/ARCH-vN.md`
- ADRs: `docs/adr/ADR-00xx-<short-title>.md`
- Tasks: `docs/tasks/<feature-slug>/vN/tasks.md`

## Workflow (Step‑by‑Step)

1) Define your feature

    - Pick a slug in kebab‑case (e.g., `dark-mode-toggle`).
    - Start at `v1` per feature; bump to `vN+1` as scope changes.

2) Create the PRD

    - Path: `docs/prd/<feature-slug>/vN/prd.md`.
    - Follow `rules/create-prd.md`; include acceptance criteria, Reference Architecture, and a Module Decomposition Plan.

3) SD/SA + first ADR

    - ARCH: `docs/architecture/ARCH-vN.md` (1–2 pages). Current baseline: see `docs/architecture/ARCH-v1.md`.
    - ADR: `docs/adr/ADR-00xx-<short-title>.md` for key decisions. Current baseline: `docs/adr/ADR-0001-architecture-style.md` (accepted).

4) Generate parent tasks

    - Path: `docs/tasks/<feature-slug>/vN/tasks.md`.
    - Always include: 0.0 Scaffolding and X.0 Align & prune tests.
    - Share parents for confirmation before expanding.

5) Expand into sub‑tasks

    - Keep each 1–4h with clear acceptance criteria; prefer vertical slices.

6) Implement loop per sub‑task

    - Implement minimal code; keep changes small.
    - Tests: cover public behavior; update/remove obsolete tests in the same PR.
    - Boundaries: respect latest `docs/architecture/ARCH-v*.md`; document deviations via ADR or update ARCH.
    - Dependencies: any new runtime dep requires an ADR under `docs/adr/`.
    - Commit: conventional style, e.g., `feat(domain): add price rounding policy`.
    - Update the tasks file (check off sub‑task; link ADRs/notes).

7) Versioning

    - PRD/Tasks: copy to `vN+1/` when scope/boundaries change; mark previous as `status: superseded`.
    - ARCH: add `ARCH-vN+1.md` when boundaries change; link motivating ADRs.
    - ADRs: don’t edit accepted ADRs; write a superseding ADR.

8) Review & PR

    - Ensure gates pass locally (tests/behavior, boundaries, ADRs for runtime deps) and open/update a PR.

## Roles: User vs Agent

At a glance

- User: Defines outcomes/constraints, answers clarifying questions, approves PRD/ARCH/tasks, prioritizes sub‑tasks, approves runtime deps (via ADR), signs off on version bumps and merges.
- Agent: Asks targeted questions, drafts PRD/ARCH/ADRs, proposes tasks/sub‑tasks, implements sub‑tasks, runs tests/checks, updates docs/tasks, pauses at approval checkpoints.

Step‑by‑step responsibilities

- PRD
  - User: Provide initial goal; answer clarifying questions; approve `docs/prd/<slug>/v1/prd.md`.
  - Agent: Ask focused Qs (5–8); draft PRD with testable acceptance criteria and Module Plan.
- SD/SA + ADR
  - User: Confirm architecture style/boundaries; approve first ADR.
  - Agent: Draft `docs/architecture/ARCH-v1.md` and `docs/adr/ADR-0001-<title>.md` (context → decision → consequences → alternatives).
- Parent tasks
  - User: Review/adjust priorities; approve parent list.
  - Agent: Create `docs/tasks/<slug>/v1/tasks.md` with 0.0 Scaffolding and X.0 Align & prune tests.
- Sub‑tasks
  - User: Approve the next sub‑task to implement.
  - Agent: Expand parents into 1–4h sub‑tasks with acceptance criteria (tests, boundaries, ADR if new dep).
- Implement loop
  - User: Approve any new runtime dependency ADR; review outputs.
  - Agent: Implement minimal code; write/update tests; validate gates; update tasks; pause before the next sub‑task.
- Versioning
  - User: Decide when to bump to `vN+1`; approve superseding docs.
  - Agent: Create new versioned docs, mark previous as superseded, link ADRs/supersedes.

Prompt checklist by step

- PRD (user → agent): “Follow `rules/create-prd.md` for {{slug}}. Save to `docs/prd/<slug>/v1/prd.md`. Ask clarifying questions now.”
- SD/SA (user → agent): “Draft `docs/architecture/ARCH-v1.md` + `docs/adr/ADR-0001-<title>.md` from the PRD. Highlight boundaries, contracts, risks.”
- Parents (user → agent): “Generate parents in `docs/tasks/<slug>/v1/tasks.md` (include 0.0 and X.0). Pause before sub‑tasks.”
- Sub‑tasks (user → agent): “Expand parent {{id}} into 1–4h sub‑tasks with acceptance criteria.”
- Implement (user → agent): “Proceed with sub‑task {{id}}.”
- New dep (agent → user): “Proposing ADR for {{dep}}. OK to add? Summary of trade‑offs attached.”

## User Prompts (Examples)

- Start Flow: "Follow `AGENTS.md`. Use `rules/create-prd.md`. Save the PRD to `docs/prd/<feature-slug>/v1/prd.md`. Produce `docs/architecture/ARCH-v1.md` and an ADR in `docs/adr/`. Propose parent tasks in `docs/tasks/<feature-slug>/v1/tasks.md` and pause for confirmation."
- Generate Tasks: "Use `rules/generate-tasks.md` with the latest `docs/architecture/ARCH-v*.md` as boundaries. Include 0.0 Scaffolding and X.0 Align & prune tests. Keep sub‑tasks 1–4h each."
- Process Sub‑task: "Use `rules/process-task-list.md`. Work on sub‑task {{id}}. Ensure tests cover public behavior, imports respect ARCH, and add an ADR if a new runtime dependency is introduced."

## License

Apache‑2.0. See `LICENSE`.
