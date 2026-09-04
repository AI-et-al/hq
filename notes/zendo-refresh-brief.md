# Zendo refresh — standing brief for the refresher session (git-only, v2)

This file is the instruction set for the persistent "Zendo refresher"
session. The scheduled trigger just says "run the brief"; the brief lives
here so Dave or HQ can change it with a commit. Re-read it on every fire —
`git pull` first.

Artifact: https://claude.ai/code/artifact/4da496c0-687a-44ae-af33-a50d42363d71

## Why this session needs no connectors

As of 2026-09-04 the page hydrates Calendar, Gmail, Vercel and Supabase
**live in the viewer's browser** through Dave's own connectors (mcp
capability). The only content that cannot be fetched from a browser is the
project state in this repo's `LEDGER.md`. That is this session's whole job.

## Posture

- Work autonomously. Send no messages, deliver no files, create no
  scheduled tasks, send no push notifications.
- **This session has no connectors. Make no `mcp__*` tool call of any
  kind.** Everything you need is in this repo and the artifact.
- **Never wait on a permission prompt.** If any tool call asks for
  approval or is denied, skip that step and finish without it.
- Keep the run small: `git pull`, read `LEDGER.md`, read the artifact,
  patch, publish. Nothing exploratory.

## 1. Source

`LEDGER.md` — per project: status, latest dated line, waiting-on-Dave
items. Only projects already present in the page's `SNAPSHOT.projects`
array are updated; do not add or remove projects (HQ does that by editing
the page directly).

**Tracking rule (Dave, 2026-08-31):** never track or display `janus`
(retired) or `steipete-me` (analysis fork). If a card or row for either
reappears, remove it.

## 2. Read the live page

Artifact tool, `action: "read"` with the url above — required before any
publish. Build on the version that comes back. Working copy goes in the
scratchpad directory, not the repo.

## 3. Update — project cards only

Change only, inside the inline `SNAPSHOT.projects` array: each project's
`st` (status tuple), `line`, `meta` rows that the ledger contradicts, and
`src` (set to `"HQ ledger · <Mon D>"`). Also the Projects chip default
text (`#infra-chip-text`) to `"Ledger · <Mon D>"`.

Do NOT touch: `SNAPSHOT.generatedAt`, events, inbox, the stat tiles, the
deploy tile, the `widgy-icons` card's Supabase status (live layer owns
it), the OBSIDIBRAIN panel (between its comment markers), design, title,
favicon, capabilities, or anything in the live layer script.
**Never insert sample or invented data.** Don't editorialize beyond what
the ledger states.

## 4. Publish

Artifact tool with the same `url`; omit `favicon` and `capabilities` so
they carry forward; `label: "ledger-refresh"`. If no project card
changed, skip the publish entirely. On a publish conflict, read the newer
version and rebuild on it — never force.

## Card → ledger name map (added 2026-09-04 after the first sync)

The page's project cards and the ledger's `###` keys use different
names. Sync deterministically with this map; a card with no mapped
ledger key keeps its content untouched.

| Page card            | Ledger key                                  |
|----------------------|---------------------------------------------|
| Symposium            | `janus-reconstruction` (retired → Symposium) |
| bookclub CLI         | `bookclub-cli`                              |
| Substack             | `ai-et-al-substack`                         |
| widgy-icons          | `personal-dashboard` (Supabase piece; live layer owns its status) |
| ralph-orchestrator   | **unmapped** — possibly `agentic-ai-infrastructure` (loop engineering); awaiting Dave's confirmation |
| OpenClaw             | **unmapped** — no ledger entry              |
| (bench line)         | `home-lab`, `ai-hardware-robotics`          |

"Unknown/unconfirmed" in the ledger is absence of signal, not a
contradiction — never downgrade a card on it.
