# obsidibrain → HQ: findings note, 2026-09-05 evening

Dave asked the vault session to "put your findings in a note for hq" after a day that covered the Sync-merge cleanup, the credential closure (your side), the claude.ai export, the lineage pilot, herdr/pi, and tokenograph. This is that note. Decisions were Dave's; details and provenance are in the vault log (`log.md`, 2026-09-05 entries) and the pages named below.

## 1. Lineage pilot: passed

- ADR 2026-09-05 (conversation cards amendment) is accepted. Wholesale, verified JSON cards per conversation; sparse, reviewed narrative pages. Vault paths: `lineage/cards/` (committed), `wiki/lineage/` (pages), `tools/lineage/` (extract, redact, verify, prompt spec).
- Card writer: Dave rejected the local qwen3.6 run after 40 sessions and chose **Claude Opus 5 via the Claude Code subscription** (subagents interactively; headless `claude -p` planned for the nightly job). No Anthropic API key exists on the Mac outside pi's own store.
- Result on the Feb–Jul 2026 Codex batch (55 non-empty sessions, ~360K tokens, 8 Opus subagents in parallel): **44 cards accepted, 0 rejected, 11 correctly empty; 167/167 quotes verified verbatim; 0 secrets in any card** (redact-before-formation plus a post-write sweep).
- First era page drafted from the cards: `wiki/lineage/2026-02-to-07-the-codex-months.md`, status draft, awaiting Dave's review. It is the first place his working preferences with agents are collected in his own words with citations.

## 2. Findings from the sources (for the backfill design)

- Codex rollouts contain machine-generated `user` turns (`<codex_internal_context source="goal">`, injected skill bodies, safety-assessor and memory-writer prompts, heartbeats). Writers correctly ignored them; the extractor now drops the tagged ones.
- Two June 30 "Codex" sessions are Claude Code transcripts stored under `~/.codex/sessions/`. One April session addresses the owner as "Peter" (automated prompt, not Dave). Source labels cannot be trusted from the path alone.
- Duplicates: the vault's founding conversation exists as two rollouts (2026-05-31 06:49 and 2026-06-30 06:47) sharing early turns; two OpenClaw-backup lookups are near-identical. A dedup rule is needed before the 3.5M-token backfill.
- Image-only user turns are dropped or appear as `<image>`; some meaning is lost. Extractor to emit placeholders.
- The redactor missed a Slack auth ticket and prose-form passwords ("the VNC password is …") in sources; both patterns added. Neither reached a card.

## 3. herdr + pi assessment (Dave: "investigate using pi for this")

- Installed and viable: herdr 0.8.2 (server running), pi 0.85.1 authenticated to Anthropic via API key with claude-fable-5-1 / claude-opus-5 / claude-sonnet-5 in its catalog, and the `@andrewjacop/pi-herdr` extension (pi as orchestrator spawning pi/claude/codex workers in visible herdr panes). herdr's state hooks are installed for pi, claude, codex.
- **Blocker:** the herdr server runs as a brew service under launchd (`homebrew.mxcl.herdr`, started 09-04 12:27). pi-herdr's README warns this inherits a minimal PATH without node and spawned pi agents die silently. Fix: `brew services stop herdr`, then launch `herdr` from a terminal.
- The vault session cannot drive herdr: herdr's agent rules forbid controlling panes from outside a herdr pane (`HERDR_ENV` unset here). Test has to start from Dave inside herdr. A ready orchestrator prompt is at `tools/lineage/HERDR_DRIVER.md` (pi with Fable as orchestrator, Opus workers, verifier at the end). Suggested batch: the 66 August 2026 Codex sessions.
- Verdict: not better for the pilot (done on subagents), better for the long runs (reattachable, per-pane visibility, tokenograph fleet view built for it). Note pi bills the API key; Claude Code subagents ride the subscription.

## 4. tokenograph over this session (Dave: "run the tokenograph over this")

Panel: `~/Desktop/tokenograph-obsidibrain-2026-09-05.html` (self-contained). Numbers at build time:

| | |
|---|---|
| Wall clock | 19.6 h (session opened 09-04 20:23 CDT) |
| Model-active time | 0.60 h; tools 0.17 h; idle 18.8 h |
| Assistant calls | 290 (201 in the 8 subagent streams) |
| Tool calls | 346 (195 in subagents) |
| Tokens | 37.8M cached reads, 1.54M computed, 227K completion; cache hit 96.1% |
| Estimated cost | $45.39 (cache read 13.84, cache write 21.13, output 10.39), at Fable 5.1 list price |

Session model: Claude Fable 5.1; subagents: Claude Opus 5.

## 5. Also today (already on your ledger, restated for completeness)

- Credentials: your closure verified from the vault side; Google key revoked and dead; three export findings (Anthropic key pasted 2026-08-02, live OpenRouter key in the export, two unknown Google keys) sent 09-05 ~15:45 CDT.
- Downloads→Google Drive sync: Dave turned it off; the claude.ai export zips had already been uploaded, so they sit in his Drive.
- Sync-merge: undone 09-04; quarantine folder deleted by Dave 09-04 22:29.

## Open for Dave

1. Review the draft era page.
2. herdr test: stop the brew service, launch herdr from a terminal, run `HERDR_DRIVER.md` in a pi pane.
3. ChatGPT and Gemini exports (instructions given in-session).
4. Say go on the branch→main GitHub cleanup (still 40+ commits on the live branch, main frozen 08-10).
