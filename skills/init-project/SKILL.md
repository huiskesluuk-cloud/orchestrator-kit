---
name: init-project
description: Sets up a project to work with the orchestrator plugin. Asks the user what the project is, then creates CLAUDE.md, docs/progress.md, docs/decisions.md and docs/known-issues.md, and enables the plugin in .claude/settings.json. Use when a project has no docs/ folder yet, or when the user says /orchestrator:init-project.
---

# Init project

1. Look at what's already here: list the files and read any README.
2. Ask the user both questions in one message. Don't guess the answers.
   - What does this project do, and who is it for? (one or two sentences)
   - Which stack, and which command is the standard check (tests, lint or build)? "Not decided yet" is a fine answer.
   If the files already answer a question clearly, say what you found and ask the user to confirm it.
3. Fill in the templates below. Show the user every file before writing it, and write only after they say OK.
4. Never overwrite an existing file. If one of these files already exists, show the user what you would add and ask first.
5. After writing, check: list the files you wrote and show the first 10 lines of CLAUDE.md.

## CLAUDE.md

```markdown
# CLAUDE.md

The orchestrator rules (roles, briefs, checks, sessions) come from the `orchestrator` plugin and are loaded at every session start. If you don't see "# Orchestrator rules" in your context, the plugin didn't load: tell the user. This file holds what's specific to this project.

## What this project is

<one or two sentences from the user: what it does, who it's for>

- Type: <web app, CLI, library, ...>
- Stack: <stack, or "not decided yet. When it is, record the choice in docs/decisions.md and update this line.">
- Standard check: <command, or "none yet. Until there is one, every brief names its own check.">

## Folder map

    CLAUDE.md                project info and folder map (this file)
    .claude/settings.json    enables the orchestrator plugin
    docs/
      progress.md            what's done, in progress, next; session log
      decisions.md           decisions and why
      known-issues.md        gotchas, bugs, workarounds
    <existing top-level folders, one line each>

When you add a top-level folder, add it to this map.
```

## docs/progress.md

```markdown
# Progress

Updated at the end of every session. Newest session at the top of the log.

## Current state
- Done: project set up for the orchestrator plugin.
- In progress: nothing.
- Next: <the next step the user named, or "ask the user">

## Session log

### <today's date>
- Set up the project for the orchestrator plugin.
```

## docs/decisions.md

If the user named a stack, add it as the first entry.

```markdown
# Decisions

One entry per decision, newest at the top. Don't edit old entries. If a decision changes, add a new entry and say which one it replaces.

Format:

    ## <date>: <title>
    - Decision:
    - Why:
    - Replaces: <entry title, or "nothing">

(no decisions yet)
```

## docs/known-issues.md

```markdown
# Known issues and gotchas

Things that went wrong or surprised us, so they don't happen twice. Newest at the top. When an entry no longer applies, delete it and note that in progress.md.

Format:

    ## <short title>
    - What happens:
    - Why:
    - Workaround:
    - Found: <date>

(none yet)
```

## .claude/settings.json

If the file exists, merge these keys in and keep everything else.
In cloud sessions this alone doesn't load the plugin: the environment's setup script must install it (see the plugin README).

```json
{
  "extraKnownMarketplaces": {
    "orchestrator-kit": {
      "source": { "source": "github", "repo": "huiskesluuk-cloud/orchestrator-kit" }
    }
  },
  "enabledPlugins": {
    "orchestrator@orchestrator-kit": true
  }
}
```
