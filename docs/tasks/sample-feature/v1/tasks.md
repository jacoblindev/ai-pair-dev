---
version: v1
status: draft
slug: sample-feature
prd: ../../prd/sample-feature/v1/prd.md
---

# Tasks — Sample Feature

## Parents

- [ ] 0.0 Establish architecture scaffolding
  - [ ] 0.1 Create directory layout & stubs from PRD Module Plan
  - [ ] 0.2 Align code with ARCH boundaries; add/update ADR if deviating
  - [ ] 0.3 Agree simple dependency rule (ADR required for new runtime deps)

- [ ] X.0 Align & prune tests
  - [ ] X.1 Retire tests mismatching updated requirements (same PR)
  - [ ] X.2 Add/adjust tests for new public behavior only
  - [ ] X.3 Keep test runtime within agreed budget

## Sub‑Tasks (expand after parent confirmation)

- [ ] Implement Domain Policy A
  - Acceptance: Public behavior covered by tests; boundaries respected per latest ARCH; ADR updated if a new runtime dep is introduced.
  - Notes: Trade‑offs/ADRs linked here.
