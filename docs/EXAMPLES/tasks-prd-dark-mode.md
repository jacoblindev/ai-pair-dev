# Tasks: Dark Mode

## Parent Tasks

- [ ] 0.0 Establish architecture scaffolding and guards
  - [ ] 0.1 Create directory layout & stubs from PRD plan
  - [ ] 0.2 Add ARCH.md + ADR-0001 recording the architecture
  - [ ] 0.3 Add linters/complexity/file-size checks + pre-commit
  - [ ] 0.4 Add architecture lint notes (eslint-boundaries)
  - [ ] 0.5 Dependency hygiene baseline (allowlist/blocklist + license scan)

- [ ] 1.0 Domain/theme
- [ ] 2.0 Infra/storage adapter
- [ ] 3.0 App/preferences service
- [ ] 4.0 UI/theme toggle

- [ ] X.0 Align & prune tests
  - [ ] X.1 Retire tests mismatching updated requirements (same PR)
  - [ ] X.2 Add/adjust tests for new public behavior only
  - [ ] X.3 Keep test runtime within agreed budget

Pause/confirm before expanding sub-tasks.

---

## Example Sub-Tasks

- [ ] 1.1 Add `resolveInitialTheme(osPref, savedPref)`
  - Acceptance: handles `null` savedPref; respects OS pref; returns `light|dark`.
  - Gates: files/functions within limits; no new deps.

- [ ] 2.1 Implement storage port and LocalStorage adapter
  - Acceptance: read/write round-trip; key stable; errors handled.

- [ ] 3.1 Implement `getInitialTheme()` and `setTheme(theme)`
  - Acceptance: orchestrates domain + storage; idempotent writes.

- [ ] 4.1 UI toggle and CSS variables
  - Acceptance: keyboard accessible; applies class/variables; persists on change.
