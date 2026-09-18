# App Store Connect - App Privacy answers

Copy these into App Store Connect > your app > App Privacy. Getting this section wrong is
one of the most common reasons an app is rejected or pulled later, so answer it exactly as
written here. Every answer below was checked against what the app's code actually does.

Reference: the app talks to exactly one backend, Northcomm's own Supabase project. It loads
no analytics SDK, no ad SDK, and no third party script at runtime (the Supabase and QR
libraries are bundled inside the app, not fetched from a CDN).

---

## Question 1: Does this app collect data?

**YES.**

Do not answer "No". No account is required to use the app, but a user who chooses to create
one gives the app an email address, and their scan history then leaves the device to sync.
Answering "No" here is a false statement to Apple.

---

## Data types to declare

Select exactly these two. Leave every other category unchecked.

### Contact Info > Email Address

| Field | Answer |
|---|---|
| Collected? | Yes |
| Used for tracking? | **No** |
| Linked to the user's identity? | **Yes** |
| Purpose | **App Functionality** only |

Why: an account is optional. If a user creates one, it is used to sign them in and sync
scan history across devices. It is not used for marketing, advertising or analytics, and it
never gates any feature -- scanning, manual entry, lookup and opening a report all work
without one.

### Usage Data > Product Interaction

| Field | Answer |
|---|---|
| Collected? | Yes |
| Used for tracking? | **No** |
| Linked to the user's identity? | **Yes, only if the user is signed in** |
| Purpose | **App Functionality** only |

Why: when a signed-in user scans a label, the serial, the title and a timestamp are saved to
their own scan history row so they can see what they looked up before. That is product
interaction data, it is tied to their account, and it exists purely to power the history
feature. Signed out, the same recent-scans list is kept in local device storage only and is
never sent to the server.

---

## Data types to explicitly NOT declare

Do not check any of these. None of them are collected:

- Location (of any precision)
- Contacts, Photos, Audio, Health, Financial Info, Purchases
- Identifiers (no advertising identifier, no IDFA, no device ID is collected)
- Diagnostics, Crash Data, Performance Data (no crash or analytics SDK is present)
- Search History, Browsing History
- Sensitive Info
- Other Data

Camera note: the app uses the camera to read a QR label. The camera frames are processed on
the device and are never uploaded or stored. Camera access is a **permission**, not a data
type, so it is declared in Info.plist (already done) and does NOT get declared here.

---

## Tracking

**"Does this app use data for tracking purposes?" -> NO.**

There is no ad network, no data broker, no cross-app or cross-website tracking, and no
App Tracking Transparency prompt is needed. Do not add the ATT framework.

---

## Account deletion

Apple requires any app with account creation to offer in-app account deletion.

- The app has it: **Settings > Delete my account**, which calls the `delete_own_account()`
  database function. Your sign-in is destroyed, and your scan history is permanently
  unlinked from you so it can no longer be traced to any person.
- **This only works once `northcomm-setup.sql` has been run on the Supabase project.** If
  that has not been run, deletion fails and the app will be rejected on this point. Confirm
  it works on a real device before submitting.

When the review form asks how a user deletes their account, answer: "Sign in, open Settings
in the app, and tap Delete my account. This permanently destroys the sign-in and permanently
unlinks all of that account's scan history from the person, so it can never be traced back."

---

## URLs to enter

| Field | Value |
|---|---|
| Privacy Policy URL | https://northcomm-tech.github.io/Northcomm.app/privacy.html |
| Support URL | https://northcomm-tech.github.io/Northcomm.app/support.html |

Both pages are live. Check they still load before you submit, because a dead privacy URL is
an automatic rejection.

---

## App Review Information: no account required, demo account still supplied

No account is required to use the app (App Review Guideline 5.1.1(v)): scanning, manual
entry, lookup and opening a report all work signed out. A demo account is still supplied so
the reviewer can also exercise the optional history/sync/delete features.

In App Store Connect > App Review Information, use **Sign-In Information** (not "Sign-In
Required" -- the app has no such requirement) and enter a real account created in
Northcomm's Supabase, kept alive for as long as the app is on sale. Give the reviewer the
sample serial **NC-121484** to type under "Enter a part number manually" on Home, so they
can see a real report without any physical label or sign-in at all.

| Field | Value |
|---|---|
| Username | (create one, e.g. appreview@northcomm.app) |
| Password | (set one, and do not change it while a review is open) |

## Review notes (paste into "Notes" for the reviewer)

> ScanSpec is a free documentation lookup tool published by North Comm Technologies, the
> manufacturer of the RF cable assemblies it reads. Point the camera at the QR label printed
> on an assembly and the app opens that unit's factory test report.
>
> No sign-in is needed to use the app. To test the lookup without a physical label, tap
> "Enter a part number manually" on the Home screen and type NC-121484, then tap Go -- this
> pulls up that assembly's real factory test report signed out. "Browse reports on file" also
> works signed out and lists every report in the catalogue.
>
> Signing in is optional and only syncs scan history across devices. Use the demo account
> above to test that path from Settings > Sign in or create an account. The account can be
> deleted from Settings > Delete my account.

Before submitting, confirm on a real device, signed out, that Home shows immediately (no
login wall), that manual entry of NC-121484 opens a real report, and that Browse reports on
file lists the catalogue. Then sign in with the demo account and confirm history sync and
Settings > Delete my account still work.
