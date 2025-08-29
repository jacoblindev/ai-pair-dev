# Stack Integrations

Use these notes to plug the gates into common stacks. Configure defaults in `configs/.aidev.yml`.

## Config-driven Gates

From `.aidev.yml`:

- limits: `max_file_lines`, `max_func_lines`, `max_cyclomatic`
- tests: `local_time_budget_min`
- deps: `max_prod`, `max_dev`
- stack: `language: auto | java | js-ts | python`

`scripts/` read these where applicable and print wiring suggestions.

## Java / Spring Boot

- Structure gate: keep files and methods small; wire Checkstyle/PMD rules.
- Complexity: Checkstyle + PMD; consider `cyclomatic` caps per package.
- Tests: `mvn test`; add contract tests with RestAssured; budget under 5 min.
- Dependency check: `mvn dependency:tree`, license via `license-maven-plugin` or OWASP dependency-check.
- Architecture lint: ArchUnit with rules enforcing allowed imports per `ARCH.md`.

## JS / TS

- Structure gate: eslint rules for max-lines and complexity; TypeScript for types.
- Tests: `npm test` / `pnpm test` / `yarn test`; focus on unit + contract/API.
- Dependency check: `npm ls --prod` + license via `license-checker`.
- Architecture lint: `eslint-plugin-boundaries` to limit cross-feature imports.

## Python

- Structure gate: enforce file-length and optional cognitive complexity with `ruff`/`flake8` plugins.
- Tests: `pytest -q`; use unit and contract tests; aim under 5 minutes.
- Dependency check: `pipdeptree --warn silence`; license via `pip-licenses`.
- Architecture lint: optional import graph checks (e.g., `grimp`, `flake8-tidy-imports`).

## Notes

- Keep gates fast locally. Heavy scans can run in scheduled CI.
- Capture exceptions with ADRs and clear justification.
