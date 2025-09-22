# Generate Tasks (lean v3)

Goal: Turn the PRD + architecture into a minimal, ordered task list that builds scaffolding first, then iterates safely with high-value gates.

Keep artefacts simple. One markdown file per feature version: `docs/tasks/<feature-slug>-vN.md`.

Start the file with:

```md
Owner: {{name}}
Active Agent: {{role or agent id}}
Last touch: {{ISO timestamp}}
Next decision needed: {{short phrase or `n/a`}}
Planner status: Drafting | Implementer-ready | In-flight | Blocked
Handoff: docs/handoff/{{feature-slug}}-vN.md (optional)
```

Update the metadata when a different agent takes over or the task list changes meaningfully.

---

## 0. Prerequisites

- Latest PRD exists at `docs/prd/<feature-slug>-vN.md`.
- Architecture entry exists at `docs/arch/<product>/ARCH-vN.md` and is listed in `docs/arch/index.md`.
- At least one ADR under `docs/adr/` covers key decisions.
- PRD metadata is current and links to any active handoff snapshot.

Treat the relevant `ARCH-v*` file as the source of truth for boundaries and allowed dependencies.

---

## 1. Assess Current State

Capture a quick snapshot at the top of the tasks file (or link an `ASSESSMENT.md`). Note who is planning versus implementing so the next agent understands ownership:

- Code layout / modules touched
- Tech stack and main commands (build/test)
- Known risks, debt, or blockers
- Pointers to relevant ADRs or portfolio notes

---

## 2. Confirm Guardrails

- Ensure the PRD lists the module plan, test strategy, dependency policy, and reference architecture.
- Confirm the architecture entry still matches the intended boundaries; update PRD/ARCH if out-of-sync before planning tasks.

---

## 3. Parents First

Start the tasks file with parent-level bullets (checkbox lists recommended). Use status tags such as `(planner)` or `(implementer)` when ownership splits:

- [ ] **0.0 Establish architecture scaffolding** (planner -> implementer)
  - Covers creating the layout/stubs from the module plan, aligning code with the current ARCH, and agreeing on dependency expectations.
- [ ] **Feature parents** — add one line per vertical slice or layer you plan to deliver; tag expected agent if known.
- [ ] **X.0 Align & prune tests** (planner outlines expectations; implementer executes)
  - Retire mismatched tests, add/adjust coverage for new public behavior, and keep runtime within budget.

Pause for human review only if the owner requests it.

---

## 4. Expand into Sub-Tasks

After parents are acceptable:

- Break each parent into sub-tasks sized for ~1–4h of focused work.
- Include acceptance criteria referencing the three gates (tests, boundaries, dependencies).
- Point to relevant PRD sections, ARCH clauses, or ADR IDs for traceability.
- Note any expected ADR or portfolio log updates.
- Mark when a sub-task becomes “Implementer-ready” so downstream agents know they can begin without re-planning.

Prefer vertical slices that demonstrate real behavior end-to-end. It’s acceptable to batch tiny fixes if they touch the same slice and pass all gates together.

---

## Output of this Step

- Updated tasks file at `docs/tasks/<feature-slug>-vN.md` with:
  - Assessment snapshot
  - Parent tasks (including 0.0 and X.0 entries)
  - Sub-tasks with acceptance criteria and traceability notes
- Planner status updated to reflect whether the implementer can start.
- Optional link to the latest handoff snapshot for quick onboarding.
- Optional link to the latest portfolio log entry for cross-team visibility.

If scope or boundaries change mid-flight, bump to `vN+1`, copy the relevant sections, and note the supersession at the top of the new file.
