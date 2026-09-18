# design-brief.md — northcomm / artifact
opened: 2026-09-18
judge_model: fable-5.1 (fallback: opus)   # one judge model for the whole build
builder_model: sonnet-5
budget_cap: 10 vision judgments (x3 orderings = 30 image calls), 4 rounds max

## References (Stage 1) — at least two, crossed with the brand
- **Halide (halide.cam)** — .visual/refs/halide.png. Borrow: instrument-panel data readouts (mono numeric sliders, high-contrast dark UI, single accent color used sparingly as a "selected" signal, condensed display type for the big headline). Stays original: no dark hero photography, no yellow accent (ours is #FF3800/#d92f00), no camera-app chrome — ScanSpec's "instrument" feel comes from the slab header + mono serials, not from replicating Halide's editing UI.
- **Flighty (flighty.com)** — .visual/refs/flighty.png. Borrow: dense real-data cards (flight number, status, gate) using tabular/mono figures at a large size so the one fact that matters (here: serial + PASS/FAIL) reads instantly without decoration; generous card padding despite density. Stays original: Flighty's card is flight-status colored pills (green/amber/red-as-status); we never use a colored dot/status pattern, our PASS/FAIL badge is a bordered text chip, not a traffic-light dot.
- **Things 3 (culturedcode.com/things)** — .visual/refs/things.png. Borrow: quiet native-iOS conventions — plain list rows, restrained single-accent color used only for the primary action and count badges, generous line-height, no card chrome around every row. Stays original: no soft pastel backgrounds; ScanSpec's list rows carry a hairline rule (datasheet identity) instead of Things' fully chromeless list.

## Diverge (Stage 2) — three tiles in .visual/tiles/{a,b,c}.html, one decider
decider: Jack | fable-5.1
pinned tokens:
--paper #fbfaf7 (light)
--card #ffffff (light)
--slab #232322 (fixed, never flips)
--ink #1c1c1a (light)
--signal #FF3800 (marks only)
--signal-press #d92f00 (filled buttons)
--pass #1d6b3a (text only)
--err #b3261e


### Decision (2026-09-18, decider: Fable 5.1, Jack absent; element-level pick)
- Winner: tile B "field instrument" as base, paper from A, PASS treatment from C.
- Pinned tokens light: --paper #fbfaf7 (matches the spec site), --card #ffffff, --slab #232322 (never flips), --ink #1c1c1a, --steel #5f5e5a, --line #d8d6d0, --signal #FF3800 (marks only), --signal-press #d92f00 (filled buttons, white text), --pass #1d6b3a (text only), --err #b3261e.
- Pinned tokens dark: --paper #141413, --card #1c1c1a, --ink #f0efe9, --steel #a3a29b, --line #38372f, --signal #FF5b30, --pass #6fcf97, --err #ff8a80; slab unchanged.
- Type: IBM Plex Sans Condensed 700 (screen titles, button labels), IBM Plex Mono 600 (serials, 28-40px), IBM Plex Sans 500/600 (body, min 15px). Self-hosted woff2 in fonts/, no CDN.
- Radius scale: 0 / 3px / 8px (inputs). Borders 2px ink on primary cards, 1px line on secondary. No shadows.
- Spacing base 8: 8/16/24/40.
- Refusals: no eyebrow microlabel above the home title; no arrows on links; PASS is never orange (orange means action); no status/online indicator; no em dashes; real Northcomm logo in the slab, never an N square; top bar holds logo + settings gear only.

## Borrowed vs original
borrow:
original:

## Surface prerequisites
single html file or folder
