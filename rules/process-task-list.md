# Process Task List (lean v3)

Purpose: Ship one sub-task at a time with crisp done gates so structure, tests, and dependency hygiene stay intact.

Before starting, read the metadata at the top of the PRD, tasks file, and handoff snapshot. If anything is stale, update it with your agent id and timestamp so the next person knows who is active.

---

## Working Protocol

- Focus on one sub-task (or a tightly related batch within the same slice) at a time.
- Start with scaffolding tasks if they are still open.
- Keep changes small, independently testable, and aligned with the current architecture entry.
- Use conventional commits (e.g., `feat(domain): add price rounding policy`).
- When handing off mid-slice, capture the current state in `docs/handoff/<feature-slug>-vN.md` and update metadata to release ownership.

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

If a gate fails, either fix it immediately or split the work into a new sub-task. Flag blockers in the metadata so planners or reviewers can respond.

---

## Suggested Loops by Agent

### **Implementer**

1. Claim an “Implementer-ready” sub-task and mark yourself as Active Agent.
2. Implement the minimal change to meet acceptance criteria.
3. Write/update tests that exercise public behavior.
4. Run tests and quick checks; update docs, ARCH, or ADRs as needed.
5. Add a one-liner to `docs/portfolio/log.md` if the change impacts cross-product planning.
6. Commit with a conventional message.
7. Update the tasks file (check the box, link commits/ADRs, note follow-ups) and refresh metadata or handoff snapshot.

### **Reviewer / Planner-on-Call**

1. Spot-check completed sub-tasks against the three gates.
2. Record feedback or approvals in the tasks file and handoff doc.
3. If scope shifts, update the PRD, ARCH, or ADRs and bump metadata timestamps.
4. Confirm blockers are resolved or escalate when human decisions are required.

---

## Output of this Step

- A series of small, documented commits that satisfy the gates.
- Tasks file reflects progress and links to supporting ADRs/log entries.
- Portfolio log captures noteworthy decisions or milestones.
- Metadata headers and handoff snapshot show the latest owner, timestamp, and outstanding decisions.
