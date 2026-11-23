---
name: reflect
description: End-of-session review. Lists what went wrong or took too long this session, proposes the smallest edit to the plugin (rules, an agent or a skill) or the project's CLAUDE.md that would have prevented each one, and waits for the user's OK before applying anything. Use at the end of every session, or when the user says /orchestrator:reflect.
---

# Reflect

Run this at the end of a session, after docs/progress.md, docs/decisions.md and docs/known-issues.md are updated.

## 1. List what went wrong or took too long
List each case from this session where:
- a worker's check failed and the work had to go back,
- a brief was missing something the worker needed,
- you or a worker guessed wrong, or had to ask something the docs should have answered,
- a task took clearly more steps or time than it should have,
- the user had to correct you.

For each one, give the evidence from this session: the command and its error, the worker's report, or the user's words. No evidence, no item.

## 2. Propose the smallest fix
For each item, propose one edit that would have prevented it:
- File: the project's CLAUDE.md, or a plugin file: rules.md, agents/<name>.md or skills/<name>/SKILL.md.
- Edit: the exact lines, as before and after.
- Why: one sentence on how this would have prevented it.

Smallest wins: one line over a paragraph, changing an existing rule over adding a new one. If two items share a cause, propose one edit. If no edit would have prevented it, say so and propose nothing.

## 3. Wait for the OK
Show the numbered list and the proposed edits. Ask the user which to apply. Don't edit any file until they answer. Apply only the edits they approve, exactly as approved.

Plugin files live in the huiskesluuk-cloud/orchestrator-kit repo, not in this project. If that repo isn't in this session, ask the user whether to add it. If they say no, write the approved plugin edits under "Plugin edits to apply" in docs/progress.md.

Then add one line to docs/progress.md saying which edits were applied.

If nothing went wrong, say "Nothing to fix this session" and stop.
