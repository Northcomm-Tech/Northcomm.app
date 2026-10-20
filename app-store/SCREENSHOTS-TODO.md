# Northcomm ScanSpec - Screenshots

Status 2026-10-20: app-store/screenshots-v4 holds four 1290 x 2796 shots of the CURRENT
look (home, report, reports on file, camera access). The older sets (screenshots,
screenshots-v3) show the previous design: do not upload those. Before submitting, retake
the four on the live app signed in with the demo account so the data is real (v4 was
rendered from a local copy with stubbed rows for serials NC-121484/87/88/89/90/39/43).
The create-account screen (shot 5) is optional and not yet taken.

## Size
- **6.9" display: 1290 x 2796 px portrait.** For an iPhone-only app this one set is enough;
  App Store Connect scales it for smaller iPhones. No iPad set (the app is iPhone-only).
- 3 to 5 shots.

## Shots (Apple 2.3.3: show the app in use, not just the login screen)
1. **Home**: "Scan your Northcomm product" with Scan a code and the serial field.
   Caption: "Scan the label on any Northcomm product."
2. **Report**: NC-121484 test report with the PASS result.
   Caption: "The factory test report, in seconds."
3. **Reports on file**: the list with PASS badges and Print label.
   Caption: "Every report on file, plus printable labels."
4. **Camera access**: the explainer screen. Caption: "Your camera only reads the label."
5. (Optional, never first) **Create account**. Caption: "A free account syncs your scans."

## How to capture (no Mac needed)
Headless Chromium at a 430 x 932 viewport with device scale factor 3 gives exactly
1290 x 2796. Use the live app or a local preview of the release branch, signed in with the
demo account, real data only.

## Notes
- Captions honest and benefit-led, no em dashes.
- Real serials that resolve to real reports.
