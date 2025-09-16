# Process Task List (lean v3)

Purpose: Ship one sub-task at a time with crisp done gates so structure, tests, and dependency hygiene stay intact.

---

## Working Protocol

- Focus on one sub-task (or a tightly related batch within the same slice) at a time.
- Start with scaffolding tasks if they are still open.
- Keep changes small, independently testable, and aligned with the current architecture entry.
- Use conventional commits (e.g., `feat(domain): add price rounding policy`).

---

## Completion Gates (per sub-task)

1. **Test / Behavior**
   - Tests cover the new or changed public behavior.
   - Update or retire obsolete tests in the same change.
   - Keep local runtime within the agreed budget.

2. **Boundaries**
   - Imports respect the applicable `docs/arch/<product>/ARCH-v*.md` rules and declared public APIs.
   - Capture intentional deviations by updating the ARCH file or authoring a new ADR.

3. **Dependencies**
   - Any new runtime dependency has an ADR (alternatives, license, security posture) and human approval.

Optional extras (adopt if useful): size/complexity heuristics, architecture lint, simple dependency/license checks.

If a gate fails, either fix it immediately or split the work into a new sub-task.

---

## Suggested Loop

1. Implement the minimal change to meet acceptance criteria.
2. Write/update tests that exercise public behavior.
3. Run tests and quick checks; update docs, ARCH, or ADRs as needed.
4. Add a one-liner to `docs/portfolio/log.md` if the change impacts cross-product planning.
5. Commit with a conventional message.
6. Update the tasks file (check the box, link commits/ADRs, note follow-ups).
7. Pause for review only when the owner requested it or when an ADR needs approval.

---

## Output of this Step

- A series of small, documented commits that satisfy the gates.
- Tasks file reflects progress and links to supporting ADRs/log entries.
- Portfolio log captures noteworthy decisions or milestones.
