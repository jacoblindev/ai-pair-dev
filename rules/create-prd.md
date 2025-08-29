# Create PRD (v2)

Purpose: Produce a PRD clear enough for a junior developer to implement, while also steering structure and sustainability. Keep it concise, testable, and specific.

This is the v2 of the original guidance; the flow and intent are preserved: clarify → specify the product → constrain the solution. New in v2 are required sections to encode architecture and guardrails.

---

## Clarifying Questions (baseline)

Ask only what’s necessary to remove ambiguity. Examples:

- Users: Who are the primary users? Any key personas or access roles?
- Scope: What must be included vs explicitly out-of-scope in this iteration?
- Success: What observable outcomes define success? What metrics/telemetry matter?
- Constraints: Performance, privacy, compliance, budget, time, or platform limits?
- Dependencies: Must integrate with existing systems, libraries, or services?

Document answers briefly in the PRD.

## PRD Sections (baseline)

- Context: Why we’re doing this; short background.
- Goals: The outcomes we want, in business or user terms.
- Non-Goals: What we specifically won’t do now.
- User Stories / Scenarios: “As a {{role}}, I want {{capability}} so {{benefit}}.”
- Acceptance Criteria: Concrete, testable conditions; include edge cases.
- UX Notes: Key interactions, states, and accessibility expectations.
- Risks & Assumptions: Unknowns, external dependencies, fallbacks.
- Telemetry & KPIs: Events, metrics, and success measurements.

Keep these sections brief but unambiguous. Favor examples over prose.

---

## Reference Architecture (Required)

Pick one and state why. Define module boundaries and allowed dependencies.

- Options: Hexagonal (Ports/Adapters), Clean Architecture, or Feature-Sliced.
- Dependencies: Declare allowed vs forbidden cross-module imports.
- Data flow: One high-level call-flow, e.g.:
  - UI → Application Service → Domain → Port (Outbound) → Adapter (Infra)
  - Public API → Feature module → Shared utils (read-only)

Include 3–5 bullets that describe the intended call paths and where state lives.

## Module Decomposition Plan (Required)

Target directory layout and modules. For each module, specify:

- Responsibility: What this module owns.
- Public API: Types/functions/classes exposed to other modules.
- Internal Notes: Hidden implementation details, state, and patterns used.
- Estimated File Counts: Expected file sizes and how they’ll split.

Example target layout:

```sh
src/
  app/            # orchestration/services
  domain/         # pure logic, entities, policies
  infra/          # adapters (db/http/files)
  ui/             # web/mobile/cli layers
```

## File & Function Size Limits (Required)

- max_file_lines: 500
- max_func_lines: 70
- max_cyclomatic: 10

If any exceed the limit, split or refactor before merging. Capture intentional exceptions with an ADR.

## Shared Conventions (Required)

- Folder strategy: Choose one — feature-first or layer-first. Stick to it.
- Cross-module access: Only through public interfaces defined in the Module Plan.
- Naming: Consistent, descriptive names; avoid abbreviations. Keep modules small.

## Test Strategy (Required)

- Prefer unit tests and contract/API tests; minimize brittle snapshots.
- If requirements change, obsolete tests are removed or updated in the same PR.
- Coverage targets: 70% overall; 90% for pure logic modules (domain/util).
- Local test runtime budget: < 5 minutes (configurable).
- Focus on public behavior; avoid testing internals directly.

## Dependency Policy (Required)

- Maintain an allowlist/blocklist (see `configs/`); justify new runtime deps via ADR.
- ADR justification includes: size, license, security posture, alternatives considered.
- Targets: Keep prod deps below 30; dev deps below 40 (configurable).

---

## Output of this step

- A PRD file including the sections above, plus a concise glossary if needed.
- Draft `templates/ARCH.md` populated for this project and an `ADR-0001` capturing the chosen architecture.

Use this PRD to drive the task list in `/rules/generate-tasks.md`.
