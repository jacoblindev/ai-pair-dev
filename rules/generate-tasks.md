# Generate Tasks (v2)

Goal: Turn the PRD into a minimal, ordered task list that establishes architecture scaffolding first, then iterates safely with explicit gates.

The original rhythm is preserved: assess → plan → parent tasks → confirm → sub-tasks.

---

## 1. Assess Current State

- Capture a quick repo snapshot (tree, stack, test command, notable risks) in `ASSESSMENT.md` or task notes.
- Summarize any major risks or refactors in the parent tasks.

## 2. Confirm PRD & Guardrails

- Ensure the PRD includes: Module Decomposition Plan, Test Strategy, Dependency Policy, and Reference Architecture.
- Ensure `ARCH.md` and an initial `ADR-0001` exist or will be created in scaffolding.

## 3. Baseline Settings

- Agree thresholds: file size, function size, cyclomatic complexity, test budget, dependency budgets.
- Decide on allowlist/blocklist approach and how to enforce it (tooling optional).

## 3b. Architecture & Scaffolding First

- Create the directory layout + empty stubs per PRD’s Module Plan.
- Add `ARCH.md` (from template) and `ADR-0001` capturing the architecture.
- Expose only public APIs; keep stubs thin. No heavy logic yet.

## 3c. Guardrails

- Wire file-size and complexity checks; add optional pre-commit hooks.
- Add dependency checks (allowlist/blocklist; license check).

---

## Phase 1: Generate Parent Tasks

Always include the scaffolding and guardrail tasks first:

- [ ] 0.0 Establish architecture scaffolding and guards
  - [ ] 0.1 Create directory layout & stubs from PRD plan
  - [ ] 0.2 Add ARCH.md + ADR-0001 recording the architecture
  - [ ] 0.3 Add linters/complexity/file-size checks + pre-commit
  - [ ] 0.4 Add architecture lint notes (ArchUnit/eslint-boundaries)
  - [ ] 0.5 Dependency hygiene baseline (allowlist/blocklist + license scan)

Then include feature slices or layers as parents (one line each). Keep them small and cohesive.

Add a test alignment parent task:

- [ ] X.0 Align & prune tests
  - [ ] X.1 Retire tests mismatching updated requirements (same PR)
  - [ ] X.2 Add/adjust tests for new public behavior only
  - [ ] X.3 Keep test runtime within agreed budget

Pause/confirm: Share the parent list for confirmation before generating sub-tasks.

---

## Phase 2: Generate Sub-Tasks

- After confirmation, expand each parent into sub-tasks (1–4 hours each).
- Include acceptance criteria and explicit gates per `/rules/process-task-list.md`.
- Prefer vertical slices that demonstrate real behavior end-to-end.

Example sub-task shape:

- [ ] Implement Domain Policy A
  - Acceptance: Pure function coverage ≥ 90%; no file > 500 lines; public API unchanged; negative tests included.
  - Notes: Any ADR or trade-offs captured.

---

## Output of this step

- A task list with parents (including 0.0 Scaffolding & Guards and X.0 Align & Prune Tests) and scoped sub-tasks ready for `/rules/process-task-list.md`.
