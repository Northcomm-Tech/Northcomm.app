
# jaswarm changelog — northcomm-scanspec

## Round 1 — 2026-09-15 ~11:05 (committed 2d3c816 on ja/loop)
| Lane | Change | Proof |
|---|---|---|
| perf | index.html: North Comm logo was base64-embedded twice (topbar + scanner); keep one, copy src at runtime | 165KB -> 117KB, grep confirms 1 base64 copy, logos render |
| infra | sw.js: cross-origin (Supabase) GETs now bypass cache -> spec data stays fresh; cache bumped -4 | valid JS, serves text/javascript, safety gate clean |
| content | README de-staled (real Supabase, no jsPDF); em dashes removed from privacy/support | grep clean |
| safety | clean | gate: no issues found |
| regression | app renders (sign-in screen, real logo), all resources 200, no functional console errors | SW-register error is pre-existing localhost quirk (backlog) |
Committed: 2d3c816 · Open: SW-register localhost error to confirm; deep JS error-path pass owed (round 2).

## Round 2 — 2026-09-15 ~11:20 (committed 7a485fc on ja/loop)
| Lane | Change | Proof |
|---|---|---|
| correctness | doAuth() try/catch so a dropped connection can't leave the button stuck on "Please wait" forever | traced: error path now always resets button + shows #loginErr |
| correctness | HONEST STATE: offline no longer mis-reported as "no report on file" -- matchLocally/findPartRow throw on a real Supabase error, openResult catches it and shows "Couldn't reach the parts database" + Retry | RPC->local fallback intact (findPartRow line 629); zero-rows still returns null=not-found |
| content | removed all em dashes (3 JS comments + 5 user-visible &mdash;) | grep -c mdash = 0 |
| regression | inline script parses + runs, app renders (sign-in + theme toggle), no NEW console errors | only pre-existing SW-register localhost quirk remains |
Committed: 7a485fc · +1.7KB for error paths, 117->118KB.
