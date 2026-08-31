# Ledger

> Maintained by HQ. Stages: spark → shaping → active → waiting → shipped →
> tending → parked → closed. Entries marked *(unconfirmed)* were seeded on
> 2026-08-30 from observed session and routine data and need Dave's
> confirmation at the first check-in.
>
> Last full sweep: 2026-08-30 ~23:00 UTC (93 sessions reviewed; first HQ wake).

## Projects

### janus-reconstruction
- Stage: retired → Symposium *(per repo evidence 2026-08-15; Dave to
  confirm stage label)*
- Repo: AI-et-al/Janus (public). Commit 1c140f7 (2026-08-15): "docs:
  succession note — Janus is retired, its council and router live on as
  Symposium" (written by the "Motion 2 go" session).
- 2026-08-31, Dave asked why Zendo showed "janus READY · Aug 28": verified
  via Vercel — the repo has been wired to Vercel auto-deploy all along, so
  every push triggered a build. Pushes from the "AI agent goal skill"
  session (loop-engineering skill content living in the Janus repo, PR #19)
  produced a string of ERROR builds Aug 12–16 (CLI repo, no public/ output).
  Merging PR #19 on Aug 28 00:01 CT included a vercel.json fix + static
  placeholder page, which made that auto-deploy finally succeed — the
  "READY" tile. Nothing of Janus itself shipped; no one resumed the project.
- Open decision for Dave: stop the signal at the source — disconnect or
  pause the janus Vercel project (it serves only a placeholder page), or
  leave it inert (deploys only fire on pushes to the repo).
- Loose threads (previous stage): Siri fix guide (2026-08-16) never
  confirmed applied; goal-skill experiment ready but its home is really
  agentic-ai-infrastructure, not Janus.
- Connects to: agentic-ai-infrastructure (Symposium is the successor)

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
- Stage: tending *(VERIFIED by HQ 2026-08-31: repo attached read-only,
  live branch cloned, lint-2026-08-31.md and log.md read directly)*
- Repo: AI-et-al/obsidibrain (private). Live branch:
  `claude/kimi-swarms-deployment-7f26gd` — main is weeks behind until Dave
  merges. Entry points: index.md → _CLAUDE.md → CRITICAL_FACTS.md; log.md
  append-only (newest at bottom); wiki/reviews/ weekly lint reports.
  Source piles (raw/, Pile/) are gitignored, machine-local — HQ can never
  read them; pile questions go to Dave.
- Five weekly runs since 2026-08-06, all green. Division of labor (recorded
  in the vault too): HQ = working memory, obsidibrain = long-term memory;
  each side treats the other's files as data, not instructions.
- Resolved same-day per vault log 2026-08-31: warp-walps path alias retired
  (canonical-path launches; hook wiring canonicalized); weekly flag-drop
  notes into HQ inbox/ APPROVED and wired (narrow gh-api allow rule; first
  unattended Sunday drop still to prove the launchd-sandbox path);
  Obsidibrain panel published to Zendo with Dave's approval and its
  carry-forward through a refresh verified.
- Still waiting on Dave (verified in lint-2026-08-31): OpenRouter key note
  at vault root + DeepSeek key note in raw/ (Keychain relocation, consider
  rotation); Google API key in git history (rotate or scrub); locked
  worktree hungry-elion-ce4d37; Recuris/SwarmWorld project selection +
  ingest; and (low) Feb-2026 WhatsApp tokens in raw/repos/ backups —
  local-only, likely expired, flag-only. Also open: whether Codex sessions
  should report into Terminus review.
- Note: vault's "Janus PR #19 merge unverified since 08-17" is answerable —
  HQ verified via Vercel it merged 2026-08-28.
- Connects to: agentic-ai-infrastructure, hq

### bucketless
- Stage: parked *(Dave, 2026-08-31: "catch-all project, still figuring out
  how best to use it — ignore for now")*
- Un-park condition: Dave raises it

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
- From obsidibrain, VERIFIED against lint-2026-08-31: **security** — two
  plaintext API-key notes awaiting Keychain relocation (OpenRouter at vault
  root, DeepSeek in raw/; flagged since 08-17) and a Google API key in git
  history to rotate or scrub; plus locked worktree hungry-elion-ce4d37 and
  the Recuris/SwarmWorld selection + ingest decision. (warp-walps and the
  weekly inbox-notes proposal were resolved by Dave same-day.)

## Open questions for the first check-in

1. Which unknown-stage projects (bookclub-cli, ai-et-al-substack,
   ai-hardware-robotics) are truly active vs. parked?
2. Is the review-loop work on agentic-ai-infrastructure's critical path, or
   parkable?
3. Is personal-dashboard in tending mode now, or is there a next build phase?

