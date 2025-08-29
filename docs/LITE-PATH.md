# Lite Path (≤ 50 LOC, no new public API)

Use this when the change is tiny and doesn’t introduce a new public API.

## 1) Write a Mini-PRD Inline

Paste the template at the top of your task or PR description:

```markdown
<!-- MINI-PRD -->
Context: {{what exists today}}
Change: {{what will change}}
Risks: {{what could go wrong}}
Rollback: {{how to revert safely}}
Tests impacted: {{none | list}}
```

See `templates/MINI-PRD.md`.

## 2) Honor the Gates

- Structure: No file/function exceeds limits.
- Tests: Only public behavior; prune obsolete tests in the same PR.
- Deps: No new runtime deps without ADR.

## 3) Validate and Commit

Run:

```bash
bash scripts/check_file_sizes.sh
bash scripts/check_deps.sh
bash scripts/md_lint.sh
```

Commit with a conventional message and open a PR.
