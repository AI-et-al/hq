# Ledger

> Maintained by HQ. Stages: spark → shaping → active → waiting → shipped →
> tending → parked → closed. Entries marked *(unconfirmed)* were seeded on
> 2026-08-30 from observed session and routine data and need Dave's
> confirmation at the first check-in.

## Projects

### janus-reconstruction
- Stage: active *(unconfirmed)*
- Repo: AI-et-al/Janus
- Last signal: "Siri setup loop" session (2026-08-16) delivered a diagnosis
  plus 6-step fix guide — review_ready
- Next: confirm whether the Siri fix guide was applied
- Connects to: agentic-ai-infrastructure

### agentic-ai-infrastructure
- Stage: active *(unconfirmed)*
- Last signals: "Review loop engineering documentation" session (2026-08-28)
  ended need_input — loop implementation complete, awaiting a mission for
  LOOP.md and a git remote decision (repo AI-et-al/loop-engineering exists);
  obsidibrain "kimi swarms" branch mapped a paper to the council ledger plus
  3 implementation sketches (2026-08-27)
- Next: give the review-loop its mission and remote, or park it explicitly
- Connects to: janus-reconstruction, obsidibrain, and HQ itself — this
  overseer system is part of the same program

### personal-dashboard
- Stage: tending
- Pieces: Zazen Station artifact (auto-refreshes 4x/day via its own routine);
  widgy-icons (Supabase); weather widgets in AI-et-al/ios-projects — PR #1,
  v3 delivered and review_ready (2026-08-30)
- Next: Dave reviews weather widget v3; decide whether PR #1 merges
- Connects to: home-lab

### bookclub-cli
- Stage: unknown *(unconfirmed — no recent session signal)*

### ai-et-al-substack
- Stage: unknown *(unconfirmed — no recent session signal)*

### home-lab
- Stage: tending *(unconfirmed)*
- Last signal: luna theming shipped across Ghostty, tmux, starship, herdr,
  and Zed (2026-08-27)

### ai-hardware-robotics
- Stage: unknown *(unconfirmed — no recent session signal)*

### hq (this system)
- Stage: active
- Built 2026-08-30 by the "Personal Claude session overview" session
- Next: first sweep, introduce HQ to Dave, validate this ledger with him

## Waiting on Dave (as of seed)

- Review loop engineering documentation — needs: mission for LOOP.md + git
  remote decision
- Weather widget 3D icons — v3 is review_ready in AI-et-al/ios-projects PR #1

## Open questions for the first check-in

1. Which unknown-stage projects (bookclub-cli, ai-et-al-substack,
   ai-hardware-robotics) are truly active vs. parked?
2. Is the review-loop work on agentic-ai-infrastructure's critical path, or
   parkable?
3. Is personal-dashboard in tending mode now, or is there a next build phase?
