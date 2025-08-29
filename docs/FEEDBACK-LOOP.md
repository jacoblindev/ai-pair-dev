# PRD Feedback Loop

Scope changes happen. Keep the PRD, tasks, tests, and ADRs in sync.

## When scope changes

- Bump the PRD version and annotate deltas (what changed and why).
- Update `ARCH.md` and add or update an ADR if architecture or dependencies change.
- Trigger the parent task: `X.0 Align & prune tests`.

## Update tasks

- Revise parent tasks to reflect new scope and ordering.
- Pause/confirm before expanding sub-tasks (preserve the handshake).

## Tests and CI

- Retire tests that no longer match the PRD in the same PR.
- Keep test runtime within the budget; avoid brittle tests.

## Communication

- Use conventional commits with clear scopes when PRD changes affect code.
- Summarize PRD deltas in the PR description.
