# Zendo refresh — standing brief for the refresher session

This file is the instruction set for the persistent "Zendo refresher"
session. The scheduled trigger just says "run the brief"; the brief lives
here so Dave (or HQ) can change it with a commit. Re-read it on every fire —
do `git pull` first.

Artifact: https://claude.ai/code/artifact/4da496c0-687a-44ae-af33-a50d42363d71

## Posture

- Work autonomously. Send no messages, deliver no files, create no
  scheduled tasks, send no push notifications.
- **Never wait on a permission prompt.** If a tool call is denied or asks
  for approval, treat that source as unreachable for this run: keep the
  section's previous content, mark its source note
  `stale — <service> unreachable <date>`, and move on.
- **Call connectors by their friendly server name only** —
  `mcp__Gmail__*`, `mcp__Google_Calendar__*`, `mcp__Vercel__*`,
  `mcp__Supabase__*`. Never fall back to the UUID spelling
  (`mcp__269fb4f1-…`); that path raises approval prompts on Dave's screen.
  If the friendly name is not connected, the service is unreachable this
  run — see above.
- Keep the run small. No exploratory reads; only the calls listed here.

## 1. Gather (render times in America/Chicago)

- **Calendar** — `list_events`, today through +30 days, on (a) the primary
  calendar, (b) `family11438714781506581322@group.calendar.google.com`,
  (c) `en.usa#holiday@group.v.calendar.google.com`. A calendar with zero
  events returns no `events` array at all.
- **Gmail** — `search_threads`, query `in:inbox is:unread`, pageSize 20.
- **Projects** — `LEDGER.md` in this repo is the source of truth for
  project state (HQ maintains it). Use each project's status, latest
  dated line, and waiting-on-Dave items. Label repo-derived claims as such.
- **Infra, only if quick** — Vercel team `team_AwfVMsN1GRBv8x4HHL5IMiIz`:
  latest deployment state of **eve-slack-agent only**. Supabase: status of
  **widgy-icons**.

**Tracking rule (Dave, 2026-08-31):** Zendo tracks only projects whose
GitHub repos AI-et-al created — never repos forked for analysis. Do not
track or display `janus` (retired) or `steipete-me` (fork). If a tile or
row for either reappears, remove it during the data update.

## 2. Read the live page

Artifact tool, `action: "read"` with the url above — required before any
publish. Build on the version that comes back; if Dave changed the page,
keep his structure. Make the working copy in the scratchpad directory, not
the repo.

## 3. Update data only

Preserve design, structure, title, favicon, capabilities, and the
**OBSIDIBRAIN panel** (between its comment markers) verbatim. Change only:

- the `SNAPSHOT` object in the inline script — `generatedAt` = now,
  events, inbox groups/counts/`moreCount`, project statuses/lines/src dates;
- the stat-tile values in the static markup;
- the static calendar fallback rows;
- the "Last deploy" tile.

Curate inbox rows into the existing groups (Security / Needs action /
Deliveries / Reading); everything else only counts toward `moreCount`.
**Never insert sample or invented data.** Don't editorialize beyond what
the ledger states.

## 4. Publish

Artifact tool with the same `url` so it updates in place; omit `favicon`
and `capabilities` so they carry forward; `label: "scheduled-refresh"`.
If nothing changed since the current snapshot, skip the publish entirely.
On a publish conflict, read the newer version and rebuild on it — never
force.
