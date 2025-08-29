# Quickstart (10 minutes)

This guide gets you from PRD to PR safely with the v2 guardrails.

## 1) Write/Revise the PRD

- Include: Reference Architecture, Module Decomposition Plan, File/Function Size Limits, Shared Conventions, Test Strategy, Dependency Policy.
- Populate `templates/ARCH.md` and create `docs/adr/ADR-0001.md` (copy `templates/ADR-0001-template.md`).

## 2) Assess the Repo

Run:

```bash
bash scripts/scan_repo.sh
```

This generates `ASSESSMENT.md` with a repo tree, stack detection, and a guessed test command.

## 3) Generate Tasks

Draft a task list (parent tasks first) including:

- [ ] 0.0 Establish architecture scaffolding and guards
  - [ ] 0.1 Create directory layout & stubs from PRD plan
  - [ ] 0.2 Add ARCH.md + ADR-0001 recording the architecture
  - [ ] 0.3 Add linters/complexity/file-size checks + pre-commit
  - [ ] 0.4 Add architecture lint notes (ArchUnit/eslint-boundaries)
  - [ ] 0.5 Dependency hygiene baseline (allowlist/blocklist + license scan)
- [ ] X.0 Align & prune tests

Pause and confirm parents before expanding sub-tasks.

## 4) Process Sub-Tasks with Gates

For each sub-task:

- Implement minimal changes.
- Run: `scripts/check_file_sizes.sh`, `scripts/check_complexity_stub.sh`, `scripts/check_deps.sh`, plus tests.
- Ensure: No file > 500 lines; functions within limits; deps approved; tests aligned to PRD.
- Commit with a conventional message.

## 5) Open PR and Check CI

The CI runs file-size, basic MD lint, and dependency checks. Stack-specific lints can be added as noted in `docs/STACK-INTEGRATIONS.md`.
