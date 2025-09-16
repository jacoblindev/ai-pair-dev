---
version: v1
status: draft
slug: <feature-slug>
prd: ../prd/<feature-slug>-v1.md
arch: ../arch/<product>/ARCH-v1.md
portfolio_log: ../portfolio/log.md
---

# Tasks — {{Feature Name}}

## Assessment Snapshot

- Repo tree / modules touched
- Stack: build/test/lint commands
- Risks: known debt, blockers, dependency watch items
- Links: relevant ADRs, portfolio log entries

## Parents

- [ ] 0.0 Establish architecture scaffolding
  - [ ] 0.1 Create directory layout & stubs from PRD Module Plan
  - [ ] 0.2 Align code with ARCH boundaries; update ADR if deviating
  - [ ] 0.3 Reconfirm dependency expectations (ADR required for runtime deps)
- [ ] 1.0 {{Feature Slice or Layer}}
- [ ] X.0 Align & prune tests
  - [ ] X.1 Retire tests mismatching updated requirements (same change)
  - [ ] X.2 Add/adjust tests for new public behavior only
  - [ ] X.3 Keep test runtime within agreed budget

## Sub-Tasks

- [ ] {{Sub-task name}}
  - Acceptance: Tests cover public behavior; imports respect `<ARCH>`; ADR logged for runtime deps; portfolio log updated if cross-product impact.
  - Traceability: PRD §..., ARCH §..., ADR-00xx.
  - Notes: Follow-ups, TODOs, owners.

Add more sub-tasks per parent as needed. Keep each 1–4h and ensure the three gates are satisfied before completion.
