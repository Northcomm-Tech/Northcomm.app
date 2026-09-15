# jaswarm backlog — northcomm-scanspec

- [ ] Confirm the SW registration console error ("An unknown error occurred when fetching the script") is a localhost-only artifact, not a real fault. Seen 2026-09-15 on http://localhost:4751 tick 1; all precache assets return 200 and sw.js is valid JS served as text/javascript, so likely a bare-http-server scope quirk (deployed HTTPS should be fine). Verify on the real HTTPS deploy path before dismissing.
- [ ] Deep JS-logic correctness pass on index.html error paths (scanner handlers, auth failures, part-not-found, camera-permission-denied, network error). App agent read CSS+markup fully tick 1 but did not finish the JS pass.
