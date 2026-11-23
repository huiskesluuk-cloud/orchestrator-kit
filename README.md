# orchestrator-kit

A Claude Code plugin for an orchestrator-and-workers setup:

- `orchestrator:builder` (Haiku): writes code to a brief, runs the check, reports what it ran.
- `orchestrator:reviewer` (Haiku): reads a diff against a brief, lists what fails it.
- `/orchestrator:reflect`: end-of-session review; proposes edits and waits for your OK.
- `/orchestrator:init-project`: creates CLAUDE.md and docs/ in a new project.
- A SessionStart hook that loads `rules.md` at every session start, resume, /clear and compaction.

## Use it in a project

Add this to the project's `.claude/settings.json`, then run `/orchestrator:init-project` in that project:

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

On your own computer you can also install it for all projects:

    /plugin marketplace add huiskesluuk-cloud/orchestrator-kit
    /plugin install orchestrator@orchestrator-kit

## Changing it

Edit `rules.md`, `agents/` or `skills/`, push, and raise `version` in `.claude-plugin/plugin.json` so local installs pick up the change. Cloud sessions start fresh, so they always get the latest version.
