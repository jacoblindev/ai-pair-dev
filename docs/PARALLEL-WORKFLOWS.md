# Parallel Workflows (multiple PRDs)

When you run several PRDs concurrently, isolate work and preserve the “one sub-task at a time” rhythm per branch.

## Branching

- Branch names: `feat/<short-prd-name>-<seq>` (e.g., `feat/dark-mode-1`).
- One active sub-task per branch. If you need two in parallel, use separate branches.

## Labels and Task Files

- Label PRs with the PRD name (e.g., `PRD: Dark Mode`).
- Maintain separate task files per PRD. Each keeps parents and sub-tasks.

## Alternating Work

- Switch branches to alternate sub-tasks, but keep each branch focused.
- Ensure each branch passes the gates independently before merge.

## Coordination

- If shared modules are touched by multiple PRDs, agree on public APIs in `ARCH.md` first.
- Use ADRs for cross-PRD architectural decisions.
