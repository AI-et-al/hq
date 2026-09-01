# Why the approval prompts keep coming — and the fix

**Dave, 2026-09-01.** Root cause found and verified in-session.

## The bug

Every connector is exposed under **two different names**:

| Connector | Friendly name | UUID name |
|---|---|---|
| Claude Code Remote | `Claude_Code_Remote` | `bf7c680d-5fdc-5ef4-b4a0-abadb619bf0a` |
| Basic Memory | `basic_memory` | `8016106a-f4d2-416d-a294-bd501afb3f7a` |
| Gmail | `Gmail` | `269fb4f1-3c45-410f-a764-f6ca3a0c5763` |
| Google Calendar | `Google_Calendar` | `1ae4f0f0-0b52-445c-bd5e-4becbd192049` |
| Vercel | `Vercel` | `2d3e3f87-e731-411c-bcd9-22010c49ff9a` |
| Supabase | `Supabase` | `22c27886-16ef-4eb2-8a8e-e77be311fc5f` |

Which name a session presents varies. A permission rule naming one form
does not match a call arriving under the other, so the call prompts.

Verified 2026-09-01: `mcp__bf7c680d-…__list_sessions` raised an approval
prompt on Dave's screen; the identical call as
`mcp__Claude_Code_Remote__list_sessions` went through with no prompt, in
the same session, seconds apart.

Correction to the 2026-08-31 note: the UUIDs are **stable per connector**,
not flapping. Yesterday's "allowlists cannot win" conclusion was wrong.
Allowlisting both spellings does win. (The git-first write policy still
stands on its own merits — it is simply no longer the only option.)

## The fix, in three places

1. **Repo sessions** — `.claude/settings.json` here now allows both
   spellings for every connector, with destructive calls (sends, deletes,
   SQL, purchases) still on `ask`. Applies to any session with this repo
   attached.
2. **Local Macs** — copy `notes/mac-user-settings.json` into
   `~/.claude/settings.json` (merge the `permissions` block if that file
   already exists). User-level settings apply to every project on the
   machine, which repo-level settings cannot do. This is what stops the
   prompts in Ghostty.
3. **Routine-fired cloud sessions** — these start fresh with default
   permissions and no settings file, so neither of the above reaches them.
   Two options: attach the `hq` repo to the routine so this repo's
   settings.json applies, or bind the routine to a persistent session
   created with a permissive permission mode instead of spawning a new
   session per fire.
