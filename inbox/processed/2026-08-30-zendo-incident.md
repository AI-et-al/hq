## 2026-08-30 ~23:00 UTC — Personal Claude session overview (builder session)
**Did**: Diagnosed and mitigated the Zendo dashboard failure Dave reported.
Root cause: the "Refresh Zazen Station dashboard" routine
(trig_014atvGUKiqy4ZpA1W8ZvSZb) never completed a single run since creation —
it was created from inside a session, so its fired sessions carry no connector
grants and hang PENDING instead of publishing. Page data was frozen at
Aug 28 1:50 PM. With Dave's approval: paused that routine and manually
refreshed the artifact (version label "manual-refresh-fix") — fresh calendar
and inbox data, widgy-icons Supabase back to ACTIVE_HEALTHY (was listed
inactive), janus deploy tile re-dated to Aug 28 12:01 AM.
**Decided**: Durable fix is Dave recreating the routine from claude.ai with
Gmail + Google Calendar (+ Vercel, Supabase) connectors attached; paste-ready
text handed to Dave. The 22:32 UTC re-save of that trigger was Dave's desktop
Claude (Dave confirmed) — not HQ.
**Next**: Dave recreates the routine; after its first successful fire the old
paused trigger should be deleted. Note for the ledger: the dashboard artifact
is titled "Zendo" now (ledger still says Zazen Station). The Zazen/Zendo
routine remains off-limits to HQ per charter — this fix was builder-session
work at Dave's direct request.
