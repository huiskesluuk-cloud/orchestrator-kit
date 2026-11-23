#!/bin/bash
# Loads the orchestrator rules, then the project's docs if it has them.
# Docs keep their newest entries at the top, so only the first lines are loaded.
max=100
cat "${CLAUDE_PLUGIN_ROOT}/rules.md"
dir="${CLAUDE_PROJECT_DIR:-$PWD}"
for f in docs/progress.md docs/decisions.md docs/known-issues.md; do
  if [ -f "$dir/$f" ]; then
    printf '\n\n# Project file: %s (loaded by the orchestrator plugin)\n\n' "$f"
    head -n "$max" "$dir/$f"
    lines=$(wc -l < "$dir/$f")
    if [ "$lines" -gt "$max" ]; then
      printf '\n[%s older lines not shown. Read %s for older entries.]\n' "$((lines - max))" "$f"
    fi
  fi
done
exit 0
