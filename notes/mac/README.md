# Mac setup — two files, one paste

1. `mac-user-settings.json` → merge into `~/.claude/settings.json`
   (permissions block = both name spellings for every connector, destructive
   calls still ask; statusLine block = always-visible context meter).
2. `statusline.sh` → `~/.claude/statusline.sh`, then `chmod +x` it.

Then in any session: `/context` shows the full breakdown (system prompt,
tools, MCP tools per server, agents, memory files, messages, free);
`/mcp` toggles or disconnects MCP servers; `/plugin` does the same for
plugins. The status line shows `ctx ████░░░░░░ 41% of 200k · $cost · model`
persistently at the bottom of every session.
