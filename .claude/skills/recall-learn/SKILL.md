---
name: recall-learn
description: >
  The learning half of the memory-recall system: distill the recall
  playbook's accumulated observations into improved routing rules, in the
  open, where Dave can watch. Use when Dave invokes /recall-learn, asks to
  "run the learner", "ralph the recall skill", or asks how retrieval has
  been performing lately. Run it in its own dedicated session — a terminal
  Dave opens to watch, or a session spawned for the purpose — never inline
  in a retrieval and never as narration inside an unrelated chat. Overseer
  sessions flag a backlog (5+ unprocessed Log entries) but don't run the
  learner themselves.
---

# Recall Learn

`memory-recall` captures; this skill learns. The split is deliberate: Dave
wants to *watch* the system get better, and learning that happens inline
during retrievals is invisible drift. Every run of this skill is a visible
event — narrated while it happens, and committed to git so the evolution
of the rulebook is a diffable history.

## The loop (narrate each step as you do it)

1. **Read the playbook** — `notes/recall-playbook.md` in the `AI-et-al/hq`
   repo (the CANONICAL copy): the **Rules** section (current compounded
   wisdom) and the **Log** section (raw observations committed by
   retrievals since the last learning pass). Also scan recent retrieval
   answers or inbox notes for stray `PLAYBOOK-PENDING:` lines — those are
   lessons from surfaces that couldn't commit; fold them in as Log
   entries.

2. **Judge the evidence, out loud.** For each Log entry, say what it
   suggests: does it confirm an existing Rule (strengthens it), contradict
   one (candidate for revision), or reveal a gap (candidate new Rule)?
   Patterns need 2+ observations before they become Rules — a single
   surprise is an anecdote, and Rules built on anecdotes thrash. Say which
   entries you're deliberately NOT acting on and why.

3. **Rewrite the Rules section** — small diffs, not rewrites. Add earned
   Rules, revise contradicted ones, and *retire* Rules that recent Log
   evidence shows misrouting (say so when you do). Keep Rules under ~20
   lines: a rulebook nobody can hold in context routes nothing.

4. **Prune the Log** — delete the entries you just processed (they live on
   in the Rules and in the git record below). Leave unprocessed or
   still-ambiguous entries for the next pass.

5. **Commit the visible record.** Commit the updated
   `notes/recall-playbook.md` plus a short dated learning report
   `notes/recall-learning/YYYY-MM-DD.md`: entries processed, rules
   added/revised/retired, entries held over, and one honest line on
   whether retrieval is actually improving. Commit both to `main` with
   message `recall-learn: <summary>`. The git history of these two files
   IS the watchable learning curve. Then, ONLY if this run is in the HQ
   session or a session Dave is attending (where a stray prompt costs
   nothing), refresh the read-only Basic Memory mirror
   (`memory/recall-playbook`); otherwise skip the mirror and say so — an
   unattended MCP write that raises a permission prompt on Dave's screen
   is worse than a stale mirror.

6. **Report.** End with a compact before/after of the Rules diff and where
   Dave can watch: the commit, and the live note in Basic Memory.

## Guardrails

- The git file is canonical; the Basic Memory note is a read-only mirror
  for repo-less surfaces, refreshed only from attended sessions (see step
  5). Never treat the mirror as the source of truth.
- This skill edits ONLY the playbook (and its git mirror). It never edits
  `memory-recall/SKILL.md` itself; if the evidence says the skill's own
  routing table or recipes are wrong, put a proposal in the learning
  report for Dave instead — the skill's text changes with a human's eyes
  on it.
- No secrets in the playbook or reports, ever. Log entries that quote
  retrieved content get summarized, not pasted.
- If the Log is empty or all-anecdotes, say so and stop — a learning pass
  with nothing to learn should cost thirty seconds, not invent rules.
