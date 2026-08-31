# Ledger

> Maintained by HQ. Stages: spark → shaping → active → waiting → shipped →
> tending → parked → closed. Entries marked *(unconfirmed)* were seeded on
> 2026-08-30 from observed session and routine data and need Dave's
> confirmation at the first check-in.
>
> Last full sweep: 2026-08-30 ~23:00 UTC (93 sessions reviewed; first HQ wake).

## Projects

### janus-reconstruction
- Stage: active *(unconfirmed)*
- Repo: AI-et-al/Janus
- Last signals: "AI agent goal skill from PDF system" session (updated
  2026-08-28) — skill usage documented, ready for experiment, review_ready;
  "Siri setup loop" session (2026-08-16) delivered a diagnosis plus 6-step
  fix guide — review_ready
- Next: confirm whether the Siri fix guide was applied; decide whether to run
  the goal-skill experiment
- Connects to: agentic-ai-infrastructure

### agentic-ai-infrastructure
- Stage: active *(unconfirmed)*
- Last signals: "Review loop engineering documentation" session (2026-08-28,
  now archived) ended need_input — loop implementation complete, awaiting a
  mission for LOOP.md and a git remote decision (repo AI-et-al/loop-engineering
  exists); obsidibrain "kimi swarms" branch mapped a paper to the council
  ledger plus 3 implementation sketches (2026-08-27)
- Also open, from older archived sessions: "Motion 2 go" (front-elevation
  program) ended with 21 commits staged, awaiting Dave's README review and
  go-ahead (2026-08-18); symposium multi-model setup stalled on
  DeepSeek/OpenRouter config — needs `/mcp` reconnect and DEEPSEEK_API_KEY
  (2026-08-15)
- Next: give the review-loop its mission and remote, or park it explicitly
- Connects to: janus-reconstruction, obsidibrain, and HQ itself — this
  overseer system is part of the same program

### personal-dashboard
- Stage: tending
- Pieces: **Zendo** artifact (formerly "Zazen Station"); widgy-icons
  (Supabase, ACTIVE_HEALTHY); weather widgets in AI-et-al/ios-projects —
  PR #1, v3 delivered and review_ready (2026-08-30)
- Incident 2026-08-30: the "Refresh Zazen Station dashboard" routine had
  never completed a run (created in-session → fired sessions carried no
  connector grants; data frozen at Aug 28). Builder session, at Dave's
  direction, paused the routine and manually refreshed the artifact
  ("manual-refresh-fix"). Dave is recreating the routine from the claude.ai
  Routines UI with connectors attached; the old paused trigger gets deleted
  after its first successful fire is confirmed. Routine remains off-limits
  to HQ.
- Next: Dave reviews weather widget v3; confirm the new Zendo routine's
  first fire landed
- Connects to: home-lab

### bookclub-cli
- Stage: unknown *(unconfirmed — no recent session signal)*

### ai-et-al-substack
- Stage: unknown *(unconfirmed — no recent session signal)*

### home-lab
- Stage: tending *(unconfirmed)*
- Last signal: luna theming shipped across Ghostty, tmux, starship, herdr,
  and Zed (2026-08-27, confirmed in sweep — session archived)

### ai-hardware-robotics
- Stage: unknown *(unconfirmed — no recent session signal)*

### obsidibrain
- Stage: tending *(per its maintainer session's 2026-08-31 self-report —
  unverified by HQ; verify against the vault when repo access clears)*
- Repo: AI-et-al/obsidibrain (private). Live branch:
  `claude/kimi-swarms-deployment-7f26gd` — main is weeks behind until Dave
  merges. Entry points: index.md → _CLAUDE.md → CRITICAL_FACTS.md; log.md
  is the append-only activity log; wiki/reviews/ has weekly lint reports.
  Source piles (raw/, Pile/) are local-only to Dave's machine.
- Last signal: maintainer session introduced itself to HQ 2026-08-31
  (cross-session message; filed as inbox/processed/2026-08-31-obsidibrain-
  intro.md). Five weekly maintenance runs since 2026-08-06, all green.
  Division of labor it proposes: HQ = working memory, obsidibrain =
  long-term memory.
- Waiting-on-Dave flags it reports (see Waiting on Dave below): 2 security
  items, a locked worktree, warp-walps path-alias decision,
  Recuris/SwarmWorld decision. Pending proposal (Dave's call): weekly runs
  drop a user-action-flags note into HQ's inbox/. Also claims Dave wants an
  Obsidibrain panel on Zendo, maintained by that session (publish pending
  Dave's approval); HQ only watches for the panel disappearing on rebuilds.
- Connects to: agentic-ai-infrastructure, hq

### hq (this system)
- Stage: active
- Built 2026-08-30 by the "Personal Claude session overview" session
- First sweep done 2026-08-30: 93 sessions reviewed, check-in routine
  adopted, intro digest sent
- Basic Memory adopted 2026-08-31: Dave resubscribed (verified live —
  workspace "AI-et-al", cloud projects "getting-started" and "main");
  ledger now mirrored as notes in project "main", folder `hq/`, tagged
  `hq-ledger`. Repo stays canonical.
- 2026-08-31: Dave (live, in-session) — he is still reviewing whether HQ is
  set up as he intended; a fuller explanation of HQ's purpose is coming.
  The system is not intended *only* as ADHD machinery (that's a big part,
  not the whole). Treat the charter's framing as provisional until that
  sync; expect possible charter edits after it.
- Next: Dave's sync-up conversation (purpose + setup review); then validate
  the *(unconfirmed)* stages; Dave's remaining feeding steps: claude.ai
  memory instruction, local CLAUDE.md snippet

## Waiting on Dave (updated 2026-08-30 sweep)

- Review loop engineering documentation — needs: mission for LOOP.md + git
  remote decision (session now archived; work is parked in place)
- Weather widget 3D icons — v3 is review_ready in AI-et-al/ios-projects PR #1
- "Review steipete repos and openclaw documentation" session is blocked on
  need_input ("What's your preference?") and has a repo-access init error on
  AI-et-al/steipete.me — idle since 2026-07-30; candidate to answer or archive
- Older archived threads that ended on an ask (surface only if still
  relevant): Motion 2 go-ahead; symposium DeepSeek/OpenRouter reconnect
- From obsidibrain's 2026-08-31 self-report *(unverified by HQ)*:
  **security** — two plaintext API-key notes awaiting Keychain relocation
  (flagged 08-17, 08-24) and a Google API key in git history to rotate or
  scrub; plus locked worktree hungry-elion-ce4d37 (`git worktree remove`),
  warp-walps path-alias decision, Recuris/SwarmWorld selection + ingest
  decision, and a yes/no on its proposal to drop weekly user-action-flags
  notes into HQ's inbox/

## Open questions for the first check-in

1. Which unknown-stage projects (bookclub-cli, ai-et-al-substack,
   ai-hardware-robotics) are truly active vs. parked?
2. Is the review-loop work on agentic-ai-infrastructure's critical path, or
   parkable?
3. Is personal-dashboard in tending mode now, or is there a next build phase?
