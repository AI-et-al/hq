# Zendo — GitHub activity panel (page change for the sync child, 2026-09-05)

Dave (09-05): Zendo should capture "anything that changes in our GitHub".
Data source: `notes/github-activity.json` (HQ refreshes it at every
check-in from list_repos; no connector needed). Exclusions:
`notes/zendo-repo-exclude.txt`; forks and archived repos never show.

## One-time structural change — apply if `id="gh-rows"` is absent

Insert this block immediately BEFORE `<footer class="foot">`:

```html
  <!-- ============ GITHUB ============ -->
  <section class="glass panel" style="margin-top:16px;">
    <div class="panel-head">
      <h2>GitHub</h2>
      <span class="src"><span class="chip" id="gh-chip"><span class="dot"></span><span id="gh-chip-text">Snapshot</span></span></span>
    </div>
    <ul class="rows" id="gh-rows"></ul>
    <p class="panel-note">Every AI-et-al / AI-et-al-dev repo that changed, newest first — HQ snapshots the org at each check-in. Forks, archived and retired repos are not shown.</p>
  </section>
```

Add to `SNAPSHOT` (after `bench:`): `github: [...]` — an array of
`{ repo: "AI-et-al/Tokenograph", pushed: "2026-09-04T23:18:24Z", vis: "public", isNew: true, note: "" }`
for the 8 most recently pushed TRACKED repos in github-activity.json.
`isNew` = true when the repo was not in the previous snapshot (compare
with the `github` array already on the page). `note` may carry the
ledger's one-line status for repos that have a ledger entry (Tokenograph,
hq, obsidibrain, symposium, ios-projects, eve-slack-agent), else "".

Add this renderer after `renderProjects();` and call it once, and call
`setChip("gh-chip", "snapshot", snapLabel)` in the snapshot-boot block:

```js
function renderGithub() {
  const rows = (SNAPSHOT.github || []).map((g) => {
    const d = new Date(g.pushed); const days = Math.floor((Date.now() - d) / 86400000);
    const when = days <= 0 ? "today" : days === 1 ? "yesterday" : days < 14 ? days + "d ago" : d.toLocaleDateString("en-US", { month: "short", day: "numeric" });
    const short = g.repo.replace(/^AI-et-al(-dev)?\//, (m, dev) => dev ? "dev/" : "");
    return '<li><span class="when">' + esc(when) + '</span><span class="what"><span class="t"><a href="https://github.com/' + esc(g.repo) + '" target="_blank" rel="noopener">' + esc(short) + '</a>' + (g.isNew ? ' <span class="status ok" style="font-size:10px;padding:1px 7px;">✦ new</span>' : '') + '</span>' + (g.note ? '<span class="d">' + esc(g.note) + '</span>' : '') + '</span><span class="tail">' + esc(g.vis) + '</span></li>';
  }).join("");
  $("gh-rows").innerHTML = rows || '<li class="empty"><span class="zen">Nothing has moved.</span></li>';
}
renderGithub();
```

Also update the footer's "How this stays current" sentence to mention the
GitHub panel, and the header `.stamp` text is fine as is.

## Every sync — data only

Rebuild `SNAPSHOT.github` from the current github-activity.json (top 8
tracked by pushed_at desc, isNew vs the array on the page) and call it
changed if any repo, pushed_at or isNew differs.
