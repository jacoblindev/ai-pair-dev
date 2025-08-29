# Process Task List (v2)

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

Before marking a sub-task complete, pass all gates:

1) Structure gate

    - No file exceeds `max_file_lines`.
    - No function exceeds `max_func_lines` or `max_cyclomatic`.
    - Imports respect `ARCH.md` boundaries and declared public APIs.

2) Test policy gate

    - Remove or update tests that conflict with current PRD (do this in the same PR).
    - Avoid testing internals; focus on public behavior and contracts.
    - Keep local runtime within the configured time budget.

3) Dependency gate

    - Any new runtime dependency requires an ADR and approval.
    - Run license/security checks (stack-specific guidance in `docs/STACK-INTEGRATIONS.md`).
    - Respect allowlist/blocklist baselines.

4) Architecture lint

    - Where applicable, run ArchUnit (Java) or eslint-boundaries (JS/TS) to check import boundaries.

If any gate fails, fix or split the work before proceeding.

---

## Suggested Loop per Sub-Task

1. Implement minimal code to meet acceptance criteria.
2. Write/update tests aligned to public behavior.
3. Run: file-size, complexity stub, deps check, and tests.
4. Commit with a conventional message.
5. Open/Update PR, ensure CI passes.

---

## Output of this step

- A series of small, well-documented commits that pass structure/test/dep gates, ready to merge.
