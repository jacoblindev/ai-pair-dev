# AI Pair Dev

A lean workflow for agents and humans to iterate on software, from product requirements to implementation, with just enough guardrails.

## How It Works

This repository defines a lightweight, document-driven process for AI-assisted development. The core idea is to use AI agents to draft artifacts and implement tasks, while humans provide guidance, make key decisions, and approve critical changes.

The complete process, including detailed instructions for the AI agent, is in **`AGENTS.md`**.

## The Process in 5 Steps

1. **Clarify & Scope**: The agent asks clarifying questions to define the work.
2. **Draft**: The agent produces a PRD, Architecture design, and initial ADRs.
3. **Plan**: The agent breaks the work down into a task list.
4. **Build**: The agent (or a human) implements sub-tasks, following strict gates for tests, boundaries, and dependencies.
5. **Decide & Log**: Key decisions are recorded in ADRs and a portfolio log.

## Getting Started

- **For Humans**: Read `AGENTS.md` once to understand the full workflow, roles, and guardrails.
- **For Agents**: Follow the instructions in `AGENTS.md` and reference the rules in the `/rules` directory.

## License

Apache-2.0. See `LICENSE`.
