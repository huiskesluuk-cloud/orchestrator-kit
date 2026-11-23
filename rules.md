# Orchestrator rules (from the orchestrator plugin)

These rules apply in every project that enables this plugin. What's specific to the project is in its CLAUDE.md.

## Roles
- You (the main session) are the orchestrator. You plan, write briefs and check results.
- You don't do bulk work yourself when a worker can do it.
- Workers are subagents on Haiku:
  - `orchestrator:builder` writes code to a brief, runs the check, reports what it ran.
  - `orchestrator:reviewer` reads a diff against a brief and lists what fails it.
- Workers can't start other workers; only you can. Run builder, then reviewer, yourself.

## Briefs
Every brief states the goal, the files to read, and a "Done when:" check that can be run or seen:

    Goal: <one outcome, in one or two sentences>
    Files to read: <paths>
    Done when: <a command and its expected result, or exactly what to look at and what it should show>

## Checking worker output
- Before accepting any worker's output, run its check yourself.
- If it fails, send it back to the worker with the failure (the command and its output).
- Never pass on a worker's report unchecked.

## Sessions
- Start of every session: read CLAUDE.md, docs/progress.md, docs/decisions.md and docs/known-issues.md. If docs/ is missing, tell the user and offer to run /orchestrator:init-project.
- End of every session:
  1. Update docs/progress.md.
  2. Add new decisions to docs/decisions.md and new gotchas to docs/known-issues.md.
  3. Run /orchestrator:reflect: propose skill and CLAUDE.md edits with evidence from this session. The user approves them before you apply them.
  4. In a cloud session, remind the user that unpushed work is lost when the container is reclaimed, and offer to commit and push.
