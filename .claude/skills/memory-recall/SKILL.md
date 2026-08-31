---
name: memory-recall
description: >
  Search Dave's four memory stores — claude-mem (automatic session history),
  Basic Memory (curated cloud notes), the obsidibrain vault (long-term
  knowledge wiki), and the HQ ledger (live project state) — and route any
  question about the past to the store most likely to hold the answer. Use
  this whenever the user asks what happened before, whether something was
  already done, solved, tried, or decided, how something was done last time,
  what the current state of a project is, "do you remember", "check the
  vault", "what did we say about" — and also when a task would clearly
  benefit from prior context even if the user names no store and doesn't say
  "memory". Reads and updates a shared routing playbook so retrieval gets
  better with every use.
---

# Memory Recall

Dave's environment has four memory stores, each holding a different kind of
truth. Answering "from memory" well means going to the right store first,
searching it the way it wants to be searched, and saying honestly which
stores you actually consulted. This skill also *learns*: a shared playbook
note accumulates routing lessons across every session on every surface, so
read it before you search and leave it smarter when you're done.

## Step 1 — Read the playbook (30 seconds, do this first)

Basic Memory note `memory/recall-playbook` in project `main`
(`read_note("ai-et-al/main/memory/recall-playbook")`). Its **Rules** section
overrides the defaults below — it is where past sessions have recorded what
actually works. If Basic Memory is unreachable, proceed with the defaults
and note the playbook was skipped.

## Step 2 — Route the question

| The question is about… | Go first to | Because |
|---|---|---|
| Current project state, next actions, who's waiting on whom | **HQ ledger** (`AI-et-al/hq` → `LEDGER.md`), or its Basic Memory mirror (`hq/` folder, tag `hq-ledger`) when the repo isn't attached | The ledger is canonical working memory, reconciled twice daily |
| Whether something was already done / tried / fixed, or how it was done in a past session | **claude-mem** | It captured every session automatically — nothing was too small to record |
| Curated facts, decisions, "what do we know about X" | **Basic Memory** search, then **obsidibrain wiki** for depth | Basic Memory is the cross-device recall layer; the vault holds provenance |
| History with sources, research, entities, "why did we decide" | **obsidibrain vault** | The LLM-wiki with provenance on every page |
| Anything in the last ~48h of this account's activity | **HQ ledger + log/** first | Fresher than any batch-processed store |

Start with the cheapest store likely to answer; escalate only if it misses.
For cross-cutting questions, two stores beat four — pick the two the table
suggests and stop when they agree. Thoroughness is not touring every store:
the playbook read is ONE note-read, and when the route is obvious a single
store plus the playbook is a complete, fast retrieval — measured overhead
of over-consulting is about a minute per question.

## Step 3 — Search each store the way it wants

Compact recipes below; full per-store mechanics, per-surface availability,
and fallbacks are in `references/stores.md` — read it the first time you use
a store in a session, or whenever a tool name doesn't resolve.

**HQ ledger** — read `LEDGER.md` top to bottom (it's short); `log/` has the
daily audit trail; `inbox/processed/` has raw session reports. Mirror in
Basic Memory: `search_notes` with tag `hq-ledger` or read `hq/<project>`.

**claude-mem** — three-step, never one-shot: `search` (query + `project` +
`limit: 20`) for an index → `timeline` around the best hit for context →
`get_observations` (batched IDs) for detail. Queries are FTS5 (`AND/OR/NOT`,
`"phrases"`, `title:x`/`content:x`); `project` = the git repo's directory
name; filter with `obs_type` (bugfix, feature, decision, discovery, change)
and dates when the question implies them. The `mem-search` skill wraps this
same flow.

**Basic Memory** — `search_notes` (full-text) with the `main` project;
`read_note` by permalink; `recent_activity` when the question is "what
changed lately"; `build_context` on a `memory://` URL to pull a note plus
its linked neighbors in one call.

**obsidibrain** — index-first navigation, per the vault's own manual: start
at `index.md`, follow wikilinks; `log.md` is append-only (newest at the
BOTTOM), entries parse as `## [YYYY-MM-DD] kind | title` — the fastest
what-changed scan. `wiki/reviews/` holds weekly lint reports and transcript
digests. Grep is fine for entity names; do not build embedding infra. Read
branch `claude/kimi-swarms-deployment-7f26gd`, NOT `main` (weeks behind).

## Step 4 — Answer, with honest sourcing

State which stores you consulted, which answered, and which were
unreachable — never imply a four-store search when one store was down.
When stores disagree, say so and rank: the ledger is canonical for *state*;
claude-mem is freshest for *events*; the vault is authoritative for
*knowledge with sources*. The diary being fresher than the wiki is normal,
not a contradiction.

## Step 5 — Capture the outcome (but never learn inline)

If the retrieval taught you anything — a store that surprisingly held (or
lacked) the answer, a query phrasing that worked after others failed, a
dead end worth warning about — append ONE dated line to the playbook's
**Log** section via `edit_note` (operation `append`):

```
- 2026-08-31 · "was X already fixed?" → claude-mem obs_type=bugfix won; ledger had only the open item
```

If the append is blocked — the Basic Memory tools can appear under two
server names (`basic_memory` or a connector UUID) and flap between them,
and some non-interactive contexts gate writes — retry once under the other
name, then give up gracefully: put the lesson as the LAST line of your
answer, prefixed exactly `PLAYBOOK-PENDING:`, so a parent session or the
next learner run can file it. A lost lesson costs the whole system; a
pending line costs one line.

Don't log routine hits that existing Rules already predict — only
surprises. **That single append is the whole of your job here.** Turning
Log entries into Rules is deliberately NOT done during retrieval — it is a
separate, human-watchable process (the `recall-learn` skill) that Dave can
invoke or observe. Never edit the Rules section, restructure the playbook,
or prune the Log from inside a retrieval; a retrieval that rewrites the
rulebook mid-answer is exactly the kind of invisible drift the separate
learner exists to prevent.

## Availability varies by surface — degrade loudly, not silently

Not every store is reachable everywhere (claude-mem needs its plugin or
connector; the vault needs the repo attached; the raw/ source piles exist
ONLY on Dave's machine and are never remotely readable). `references/
stores.md` has the per-surface matrix and the attach/authorize steps to
suggest when a store is missing. A miss in the wrong store is data too —
worth a playbook line if the routing table sent you there.
