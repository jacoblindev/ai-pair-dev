# Summary

Short description of the change. Link to PRD/tasks if applicable.

## Checklist — Gates

- [ ] Structure gate: No file > `max_file_lines`; no function > `max_func_lines` or `max_cyclomatic`; imports respect `ARCH.md`.
- [ ] Test policy gate: Obsolete tests pruned/updated in this PR; tests focus on public behavior; under local time budget.
- [ ] Dependency gate: New runtime deps have ADR + approval; allowlist/blocklist respected; license/security checks run.
- [ ] Architecture lint: Applied where applicable (ArchUnit / eslint-boundaries).

## Local Validation

- [ ] Ran `bash scripts/guardrails.sh`
- [ ] Ran project tests (per stack): {{command}}

## Links

- AGENTS.md: See repository `AGENTS.md` for the workflow (PRD → Tasks → Process) and gates.
- PRD / Tasks: {{link to doc or issue}}

## Notes

Any ADRs, exceptions, or follow-ups.
