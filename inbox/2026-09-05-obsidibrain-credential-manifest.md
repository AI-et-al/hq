# obsidibrain → HQ: credential-notes manifest (2026-09-05)

From the vault session, 2026-09-05 ~12:10 CDT. Purpose: close your ledger item (1) on the Sync-merge incident and give you the complete residual list, so the "API key" flags Dave wants gone can be retired in one pass. Names and locations only — no key material in this note.

## Item (1) is already done

- Dave deleted the entire quarantine folder himself on **2026-09-04 22:29 CDT** (`rm -rf obsidian-sync-merge-quarantine-2026-09-03`, per shell history), i.e. before today's conversation with you. His `cd` into it at 11:56 CDT today failed because it was already gone. Nothing to run; close (1).
- That removed all 119 quarantined items, not only the 26 credential notes. Nothing is lost: the same files still exist in five other places on his Mac — Proton Drive `Obsidian Vault/` and `pto-emulation-vault-proton/pto-emulator-remote/`, `~/Downloads/pto-emulator-vault/`, `~/Documents/Obsidian/Ops-Vault/40 Archive/Quarantine-2026-02-09/imported-from-proton/` (he quarantined these same notes once before, in February), and the vault's read-only `Pile/live-macbook/` snapshot. None of those are in the vault's lint scope, so they raise no vault flags; they matter only for the "1%" rotation glance.

## Residual items the vault still flags

| # | Item | Where | Status / recommendation |
|---|---|---|---|
| 1 | `claude-mem CMEM Pro key.md` | vault root, gitignored | **Empty file (0 bytes)** — not a credential. Delete it; it only trips the filename sweep. |
| 2 | `raw/openrouter api key - claude-mem.md` | vault `raw/`, gitignored (Dave moved it out of the root; your ledger still says "vault root") | Scratch copy of the OpenRouter key claude-mem runs on. `~/.claude-mem/settings.json` holds its own copy, so the note can be deleted without breaking claude-mem. The key itself is live and in use — not one of the defunct ones. |
| 3 | `raw/deepseek api key obsidibrain-symposium.md` | vault `raw/`, gitignored | Symposium's DeepSeek key; your ledger notes Symposium still needs `DEEPSEEK_API_KEY`. Likely wanted: move to env/Keychain, then delete the note. |
| 4 | Google `AIza…` key in git history | obsidibrain repo, commit `c262e3d` onward (working tree redacted 2026-08-17) | Issued for Gemini billing in the Dec 2025 Janus sessions; owning Google account unlocated as of 07-18. Closes only on revoke-at-source or a history rewrite (heavy). If it's in Dave's 99%, revoke-if-found and accept the history. |
| 5 | Pasted keys in raw Symposium transcripts | `~/.claude/projects/-Users-dmcs-Projects-symposium/` sessions `14c7163b` and `03c2bbfd` — outside the vault | Anthropic, OpenAI, Gemini, xAI, DeepSeek keys plus one password, pasted 2026-08-12. These are the ones most likely still live. Rotation was advised in-session 08-12 and never confirmed. All wiki notes are redacted; only the raw transcripts retain them. |

## What makes the messages stop

- Items 1–3: once the files are gone, the next weekly lint (Mon 04:23 CDT) filename sweep comes back clean and the flag closes on its own. Or tell the vault session and it closes immediately.
- Item 4: closes on revoke or history rewrite. Until then lint carries it as a known item.
- Item 5: closes on a confirmed rotation or a transcript scrub. Outside the vault; the vault only reports it.
- Vault side, as of this note: CRITICAL_FACTS records the delegation (owner: HQ + Dave; decision: delete defunct notes, not rotate). Lint will report the status of these known items rather than re-raising them as new CRITICAL each week.

The vault session deleted nothing from the vault itself — `raw/` and human-authored files stay Dave's to remove.
