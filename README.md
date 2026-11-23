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

## Cloud sessions (claude.ai/code)

Cloud sessions don't install plugins from a project's `.claude/settings.json`. Add this to the environment's setup script instead (environment menu → Edit → Setup script). This repo must stay public for it to work.

    export PATH="$PATH:/opt/node22/bin"
    if command -v claude >/dev/null 2>&1; then
      claude plugin marketplace add huiskesluuk-cloud/orchestrator-kit || true
      claude plugin marketplace update orchestrator-kit || true
      claude plugin install orchestrator@orchestrator-kit || true
      claude plugin update orchestrator@orchestrator-kit || true
    fi

## Changing it

Edit `rules.md`, `agents/` or `skills/`, raise `version` in `.claude-plugin/plugin.json`, and push. Installs only pick up a change when the version goes up.
