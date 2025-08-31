# Process Task List (lean v2)

Purpose: Ship one sub-task at a time with crisp “done” gates to preserve structure, tests, and dependency hygiene. This builds directly on the original flow: implement → test → commit.

---

## Working Protocol

- One sub-task at a time. Don’t mix unrelated changes.
- Start from scaffolding if not already done (0.0 tasks).
- Keep changes small and independently testable.
- Prefer vertical slices; keep API changes deliberate and documented.

Commit style: conventional commits. Example: `feat(domain): add price rounding policy`.

---

## Task Implementation / Completion Protocol

Before marking a sub-task complete, pass these core gates:

1) Test/Behavior gate

    - Tests cover the new or changed public behavior.
    - Obsolete tests are updated/removed in the same PR.
    - Local runtime remains reasonable (agree within the team).

2) Boundaries gate

    - Imports respect `ARCH.md` boundaries and declared public APIs.
    - Any intentional deviation is documented (ADR/update `ARCH.md`).

3) Dependency gate

    - Any new runtime dependency has an ADR (alternatives, license, security posture) and approval.

Optional extras (adopt if useful):

    - Heuristics for file/function size and cyclomatic complexity.
    - Architecture lint (ArchUnit/eslint-boundaries) and simple dep/license checks.

If any required gate fails, fix or split the work before proceeding.

---

## Suggested Loop per Sub-Task

1. Implement minimal code to meet acceptance criteria.
2. Write/update tests aligned to public behavior.
3. Run tests and any quick checks you use; update ADRs if deps changed.
4. Commit with a conventional message.
5. Open/Update PR, ensure CI passes.

---

## Output of this step

- A series of small, well-documented commits that pass core gates, ready to merge.
