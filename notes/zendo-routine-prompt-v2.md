# Zendo refresh routine — replacement prompt paragraph (2026-08-31)

Dave: paste this over the "Projects:" bullet in EACH of the four
"Refresh Zazen Station dashboard" routines (claude.ai → Routines → edit
prompt). Only this one bullet changes; the rest of the prompt stays as is.

---
- Projects: read user-memory files under /areas/ (janus-reconstruction,
agentic-ai-infrastructure, bookclub-cli, ai-et-al-substack, home-lab,
ai-hardware-robotics, personal-dashboard) for [stated] updates. If quick, also
check live infra: Vercel team team_AwfVMsN1GRBv8x4HHL5IMiIz → latest deployment
state of "eve-slack-agent" ONLY; Supabase → status of "widgy-icons".
TRACKING RULE (Dave, 2026-08-31): the dashboard tracks only projects whose
GitHub repos AI-et-al created — never repos forked for analysis. Do not track
or display "janus" (retired) or "steipete-me" (fork); if a tile or row for
either reappears on the page, remove it during the data update. Also preserve
the Obsidibrain panel (OBSIDIBRAIN comment markers) verbatim.
---

Why HQ can't do this: the four routines were created via the claude.ai UI,
which agents cannot update; and agent-created replacements can't carry
connector grants in this org (create_trigger connectors param unavailable),
so they'd be born broken like the original.
