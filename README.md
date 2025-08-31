# AI Dev Tasks (Lean)

Builds upon snarktank/ai-dev-tasks (Apache-2.0).

A minimal, junior-friendly workflow for shipping with a Product Requirements Document (PRD) → Task generation → Task processing. The core rules live in three markdown files.

## Start Here

- Read `AGENTS.md` for the overview and rhythm.
- Follow the rules in:
  - `rules/create-prd.md`
  - `rules/generate-tasks.md`
  - `rules/process-task-list.md`

## Docs Layout

- PRD: `docs/prd/<feature-slug>/vN/prd.md`
- SD/SA (project-wide): `docs/architecture/ARCH-vN.md`
- ADRs: `docs/adr/ADR-00xx-<short-title>.md`
- Tasks: `docs/tasks/<feature-slug>/vN/tasks.md`

## User Manual (Step‑by‑Step)

1) Define Your Feature

    - Feature slug: short, kebab‑case (e.g., `dark-mode-toggle`).
    - Version: start at `v1` per feature; bump to `v2`, `v3` as scope evolves.

2) Create the PRD

    - Path: `docs/prd/<feature-slug>/vN/prd.md`
    - Use `rules/create-prd.md`. Keep it brief and testable.
    - Include: context, goals, non‑goals, user stories, acceptance criteria, UX notes, risks, telemetry.
    - Add a lean Reference Architecture choice and a Module Decomposition Plan.

3) Write SD/SA (Architecture) + First ADR

    - ARCH: `docs/architecture/ARCH-vN.md` (1–2 pages). Boundaries, contracts, one data flow, budgets, risks.
    - ADR: `docs/adr/ADR-00xx-<short-title>.md` for key decisions (e.g., architecture style, new runtime dep).
    - ADRs are short: context → decision → consequences → alternatives.

4) Generate Parent Tasks

    - Path: `docs/tasks/<feature-slug>/vN/tasks.md`
    - Always include:
      - 0.0 Establish architecture scaffolding (layout, stubs, align to ARCH; ADR if deviating)
      - X.0 Align & prune tests (retire obsolete tests; add for new public behavior)
    - Add feature‑specific parent tasks. Share this list for confirmation before expanding.

5) Expand Into Sub‑Tasks

    - After confirmation, write sub‑tasks (1–4h each) with clear acceptance criteria.
    - Prefer vertical slices that show end‑to‑end behavior.

6) Work Loop For Each Sub‑Task

    - Implement minimal code to meet acceptance criteria.
    - Tests: cover public behavior; update/remove obsolete tests.
    - Boundaries: respect latest `docs/architecture/ARCH-v*.md`; document deviations (update ARCH or add ADR).
    - Dependencies: if adding a runtime dep, write an ADR under `docs/adr/`.
    - Commit: conventional style, e.g., `feat(domain): add price rounding policy`.
    - Update the tasks file (check off sub‑task; add notes/links to ADRs).

7) Versioning Rules

    - PRD/Tasks: when scope meaningfully changes, copy to a new `vN+1/` folder and set previous to `status: superseded`.
    - ARCH: when boundaries change, add `ARCH-vN+1.md` and link to ADRs that motivated the change.
    - ADRs: never edit accepted ADRs; write a new one and mark supersession via links.

8) Review & PR

    - Ensure the sub‑task meets core gates (tests/behavior, boundaries, ADRs for runtime deps).
    - Open/Update PR and get approval (if applicable).

## Roles: User vs Agent

At a glance

- User: Defines outcomes/constraints, answers clarifying questions, approves PRD/ARCH/tasks, prioritizes and approves sub‑tasks, approves new runtime deps (via ADR), signs off on version bumps and merges.
- Agent: Asks targeted questions, drafts PRD/ARCH/ADRs, proposes tasks/sub‑tasks, implements sub‑tasks, runs checks/tests, updates docs/tasks, pauses at approval checkpoints.

Step‑by‑step responsibilities

- PRD
  - User: Provide initial goal; answer clarifying questions; approve `docs/prd/<slug>/v1/prd.md`.
  - Agent: Ask focused Qs (5–8 max); draft PRD with testable acceptance criteria and Module Plan.
- SD/SA + ADR
  - User: Confirm architecture style and boundaries; approve first ADR.
  - Agent: Draft `docs/architecture/ARCH-v1.md` and `docs/adr/ADR-0001-<title>.md` (context → decision → consequences → alternatives).
- Parent tasks
  - User: Review/adjust priorities; approve parent list.
  - Agent: Create `docs/tasks/<slug>/v1/tasks.md` with 0.0 Scaffolding and X.0 Align & prune tests.
- Sub‑tasks
  - User: Approve the next sub‑task to implement.
  - Agent: Expand parents into 1–4h sub‑tasks with acceptance criteria (tests, boundaries, ADR if new dep).
- Implement loop
  - User: Approve any new runtime dependency ADR; review outputs.
  - Agent: Implement minimal code; write/update tests; validate gates; update tasks (check off items, link ADRs); pause before the next sub‑task.
- Versioning
  - User: Decide when to bump to `vN+1`; approve superseding docs.
  - Agent: Copy to new version folder/file, set previous status to superseded, and link ADRs/supersedes.

Prompt checklist by step

- PRD (user → agent): “Follow `rules/create-prd.md` for {{slug}}. Save to `docs/prd/<slug>/v1/prd.md`. Ask clarifying questions now.”
- SD/SA (user → agent): “Draft `docs/architecture/ARCH-v1.md` + `docs/adr/ADR-0001-<title>.md` from the PRD. Highlight boundaries, contracts, risks.”
- Parents (user → agent): “Generate parents in `docs/tasks/<slug>/v1/tasks.md` (include 0.0 and X.0). Pause before sub‑tasks.”
- Sub‑tasks (user → agent): “Expand parent {{id}} into 1–4h sub‑tasks with acceptance criteria.”
- Implement (user → agent): “Proceed with sub‑task {{id}}.”
- New dep (agent → user): “Proposing ADR for {{dep}}. OK to add? Here’s the trade‑off summary.”

## User Prompts (Examples)

- Start Flow: "Follow `AGENTS.md`. Use `rules/create-prd.md`. Save the PRD to `docs/prd/<feature-slug>/v1/prd.md`. Produce `docs/architecture/ARCH-v1.md` and an ADR in `docs/adr/`. Propose parent tasks in `docs/tasks/<feature-slug>/v1/tasks.md` and pause for confirmation."
- Generate Tasks: "Use `rules/generate-tasks.md` with the latest `docs/architecture/ARCH-v*.md` as boundaries. Include 0.0 Scaffolding and X.0 Align & prune tests. Keep sub‑tasks 1–4h each."
- Process Sub‑task: "Use `rules/process-task-list.md`. Work on sub‑task {{id}}. Ensure tests cover public behavior, imports respect ARCH, and add an ADR if a new runtime dependency is introduced."

## License

Apache-2.0. See [LICENSE](LICENSE).
