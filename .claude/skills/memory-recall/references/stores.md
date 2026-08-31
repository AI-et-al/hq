# Store mechanics — verified against provider docs 2026-08-31

Sources: basicmachines-co/basic-memory tool docstrings + AI-assistant guide;
thedotmack/claude-mem docs + mem-search skill; obsidibrain `_CLAUDE.md`
(the vault's own operating manual); HQ `CHARTER.md`/`CLAUDE.md`.

## Basic Memory (curated notes, cloud)

Workspace `AI-et-al`, main project `main`. Tools may appear under server
name `basic_memory` or a connector UUID — check both before declaring it
unreachable.

- **Search first** — `search_notes(query, project="main", page_size=10)`.
  Query syntax: implicit AND, explicit `AND/OR/NOT`, `"exact phrase"`,
  grouping. Filters: `tags=[...]` (or `tag:x` in query), `note_types`
  (frontmatter types), `after_date="1 week"`, `search_type`
  ("text" | "title" | "permalink" | "hybrid"; permalink supports globs but
  matches the FULL path). Filter-only search works with no query.
- **Read** — `read_note(identifier)`: takes title, permalink,
  `folder/permalink`, or `memory://` URL; a miss returns suggestions, not
  an error. Permalinks are slugged titles.
- **Neighborhood** — `build_context(url="memory://<permalink>", depth=1-2,
  timeframe="last week")` pulls the note plus linked neighbors; depth >3 is
  slow and discouraged.
- **Recency** — `recent_activity(timeframe="2 days ago")`; max 1 year back;
  returns entities only unless you ask for observations/relations too.
- **Our conventions**: ledger mirror lives in `hq/` (one note per project,
  tag `hq-ledger`, index at `hq/hq-ledger-index`); the recall playbook is
  `memory/recall-playbook`.

## claude-mem (automatic session history)

Three-layer progressive disclosure — the documented anti-pattern is
fetching full observations without the index pass (~10x token waste).

1. `search(query, project=..., limit=20, orderBy="date_desc")` — compact
   index. Query is SQLite FTS5: `AND/OR/NOT`, `"exact phrase"`,
   column-scoped `title:x` / `content:x` / `concepts:x`. Filters: `type`
   ("observations" | "sessions" | "prompts"), `obs_type` (comma-separated:
   bugfix, feature, decision, discovery, change), `dateStart`/`dateEnd`.
2. `timeline(anchor=<id> | query=..., depth_before, depth_after)` — only
   when the narrative arc matters.
3. `get_observations(ids=[...])` — ALWAYS batched, only for filtered IDs.

- **Project scoping**: project name = basename of the git repo root of the
  session's cwd (falls back to cwd basename). Filter with repo dir names.
- Recipe patterns: debugging → `obs_type="bugfix"` then timeline; decisions
  → `obs_type="decision"`, skip timeline; context recovery →
  `orderBy="date_desc"` then `timeline(depth_before=10)`.
- **Cloud caveat**: the cmem.ai cloud variant may silently ignore date/type
  filters — prefer keyword narrowing there; never put secrets in queries.
- **Availability**: local machines with the plugin — always. Cloud sessions
  — only via the cmem connector/MCP server AND network egress that allows
  cmem.ai; both absent means no session history from here. Say so.

## obsidibrain (long-term knowledge vault)

Repo `AI-et-al/obsidibrain` (private). **Read branch
`claude/kimi-swarms-deployment-7f26gd`, never `main`** (weeks behind until
merged). Not attached by default in cloud sessions — `add_repo` (read),
shallow clone, `git fetch origin <branch>` + checkout from FETCH_HEAD.

- **Query doctrine from the vault's own manual**: index-first navigation —
  start at `index.md`, follow wikilinks; no embedding infra. Grep is fine
  for entity/concept names.
- `log.md` — append-only activity log, NEWEST AT THE BOTTOM, entries parse
  as `## [YYYY-MM-DD] kind | title`. Bottom ~50 lines = fastest
  what-changed scan.
- `wiki/reviews/` — weekly `lint-YYYY-MM-DD.md` (fixes + waiting-on-Dave
  flags) and `transcript-digest-*.md`. `wiki/logs/sessions/`, `projects/`,
  `entities/`, `concepts/`, `decisions/` hold the knowledge; every page
  carries provenance.
- **Hard limit**: `raw/`, `Pile/` source piles are gitignored and exist
  only on Dave's machine. No remote session can read them, ever — route
  pile questions to Dave.
- The vault is read-only to every session but its own maintainer.

## HQ ledger (live working memory)

Repo `AI-et-al/hq` (private): `LEDGER.md` (canonical project state,
stages, waiting-on-Dave), `log/` (dated admin audit trail), `inbox/` +
`inbox/processed/` (raw session reports), `CHARTER.md` (HQ's standing
instructions). Reconciled at least twice daily by the HQ session. When the
repo isn't attached, the Basic Memory `hq/` mirror is the same content one
step staler — its notes say when they were last mirrored.

## Per-surface availability matrix

| Store | Dave's Mac (local session) | Cloud session (CCR/claude.ai) |
|---|---|---|
| HQ ledger | clone or `gh` read | attach via add_repo, or use BM mirror |
| Basic Memory | connector | connector (may flap between names) |
| claude-mem | plugin, always | cmem connector + egress allow, else NO |
| obsidibrain wiki | local vault path or clone | add_repo + clone (live branch) |
| obsidibrain raw/ piles | yes (path on disk) | NEVER |

If a store the routing table wants is unreachable, say which, suggest the
attach/authorize step in one line, answer from the reachable stores, and
consider a playbook Log line if the gap was surprising.
