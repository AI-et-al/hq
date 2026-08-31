# Recall playbook

CANONICAL copy (as of 2026-08-31, after the permission-prompt incident).
Retrievals read Rules first — they override the memory-recall skill's
default routing table — and append surprises to Log via a plain git
commit (`recall: <one-line lesson>`). The recall-learn skill, run as its
own watchable process, distills Log into Rules; git history of this file
is the learning curve. A read-only mirror lives in Basic Memory at
`memory/recall-playbook` for surfaces without the repo — updated only by
the HQ session, never by subagents (MCP writes from parallel agents
surface permission prompts on Dave's screen; git writes never do).

## Rules

- (seed, 2026-08-31) Current project state → HQ ledger (canonical) or its `hq/` mirror in Basic Memory; events/sessions → claude-mem; curated facts → Basic Memory; sourced knowledge/history → obsidibrain wiki, live branch `claude/kimi-swarms-deployment-7f26gd`, index-first.
- (seed, 2026-08-31) claude-mem tools are only reachable where its plugin/connector is live — on cloud surfaces check availability before promising session history.
- (seed, 2026-08-31) obsidibrain `log.md` is append-only with newest entries at the BOTTOM; its bottom ~50 lines beat any search for "what changed in the vault lately".

## Log

- 2026-08-31 · "which lint flags still wait on me?" → vault lint report alone OVERSTATES; reconcile against later log.md entries + HQ ledger before reporting
- 2026-08-31 · "what was the exact error last time?" → verbatim session details (e.g. a 402) live ONLY in claude-mem; ledger+vault give state, not event forensics
- 2026-08-31 · "did weather widget v3 ship?" → ledger answered (review_ready, PR #1); live GitHub verify of merge state blocked — HQ sessions only attach hq+obsidibrain repos, so ship/merge answers carry the ledger's sweep date as a caveat
- 2026-08-31 · (meta) MCP writes to Basic Memory from subagents/background contexts surface permission prompts on Dave's screen — connector identity flaps defeat allowlists. Writes moved to git; BM is read + HQ-mirrored only.
- 2026-08-31 · "did v3 ship?" (iter-2 baseline) → public AI-et-al repos (e.g. ios-projects) CAN be git-cloned read-only from cloud sessions even when unattached — try a clone/ls-remote before declaring live verification blocked; the live check found an unmerged PR #2 the ledger didn't know
