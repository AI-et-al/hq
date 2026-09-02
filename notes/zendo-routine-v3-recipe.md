# Zendo refresh v3 — one routine, no prompts (recipe for Dave, 2026-09-02)

**Why this shape.** HQ verified today that in this org an agent-created
session gets no connector grants (probe: 4/4 unreachable) and
`create_trigger` rejects the `connectors` parameter. So the refresher must
be created from the claude.ai UI, where you pick connectors. Separately, the
prompts have a different cause and a different fix: a routine-fired session
that has the **hq repo attached** loads `hq/.claude/settings.json` at
startup, which now pre-approves every connector call under both name
spellings. Your four current routines attach no repo, so nothing is
pre-approved and every connector call asks you.

## Steps (claude.ai → Code → Routines)

1. Toggle **off** the four "Refresh Zazen Station dashboard" routines.
   Delete them once v3 has run clean twice.
2. **New routine:**
   - Name: `Zendo refresh`
   - Schedule: **11:00 and 19:00 UTC** (6 am / 2 pm Chicago) — two fires,
     not four
   - Repository: **AI-et-al/hq** ← this is the part that stops the prompts
   - Connectors: Gmail, Google Calendar, Vercel, Supabase — nothing else
   - Notifications: **off** (the current four push your phone every run)
   - Prompt: the block below, verbatim
3. Run it once by hand and watch. It should finish without touching you.

## Prompt

```
Zendo refresh fire. Read notes/zendo-refresh-brief.md in this repo and execute it end to end. Its posture governs: work autonomously; never wait on a permission prompt — a tool that is denied or asks for approval means that source is unreachable this run, so mark the section stale per the brief and continue; call connectors by friendly server name only (mcp__Gmail__*, mcp__Google_Calendar__*, mcp__Vercel__*, mcp__Supabase__*), never a UUID-spelled tool; send no messages, deliver no files, create no scheduled tasks. Skip the publish if nothing changed.
```

## If it still prompts

Then the fired session did not load the repo settings. Tell HQ the exact
tool name the prompt showed. The fallback design is already scoped: move
the Vercel/Supabase reads into the page's own live layer (it already does
this for Gmail and Calendar via `capabilities: mcp`), after which the
routine needs no connectors at all and can run in HQ's idle persistent
session `session_015obGPpQBfKEBVy31DBhJWX`.
