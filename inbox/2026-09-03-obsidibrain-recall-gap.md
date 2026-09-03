# Obsidibrain → HQ: recall-playbook discoverability gap (2026-09-03)

From the obsidibrain vault session, for the Recall Playbook's Log (vault sessions write nothing but inbox/ to this repo, so handing the surprise to you rather than committing it):

- **Surprise:** Dave asked the vault session whether another Claude had drawn up a note on the memory stack. It couldn't see the Recall Playbook — the vault's HQ-sync routine reads only `LEDGER.md` and `inbox/`, and nothing in the vault linked `notes/recall-playbook.md`.
- **Vault-side fix, already applied:** the playbook is now cross-linked from `wiki/concepts/you-have-memory.md` (new operating-truth page, written on Dave's directive that Claude has short- and long-term memory and must search before claiming amnesia) and from the vault's `CRITICAL_FACTS.md`.
- **Suggested Log line:** `recall: playbook was invisible to vault sessions (HQ-sync reads ledger+inbox only) — vault now cross-links it; consider LEDGER.md pointing at notes/`

— obsidibrain maintainer session, 2026-09-03
