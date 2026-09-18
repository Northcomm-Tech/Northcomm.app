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

Do not answer "No". The app stores an email address for the required account and keeps a scan
history, and both leave the device. Answering "No" here is a false statement to Apple.

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

Why: an account is created with an email address, and that account is what gates the app
and syncs scan history across devices. It is not used for marketing, advertising or analytics.

### Usage Data > Product Interaction

| Field | Answer |
|---|---|
| Collected? | Yes |
| Used for tracking? | **No** |
| Linked to the user's identity? | **Yes** |
| Purpose | **App Functionality** only |

Why: when a signed-in user scans a label, the serial, the title and a timestamp are saved to
their own scan history row so they can see what they looked up before. That is product
interaction data, it is tied to their account, and it exists purely to power the history
feature.

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

## App Review Information: a demo account is REQUIRED

The app shows a sign-in screen first and there is no anonymous path into it, so Apple
Guideline 2.1 requires you to hand the reviewer working credentials. Without them the
review is rejected in a day with "we were unable to sign in".

In App Store Connect > App Review Information, tick **Sign-in required** and enter a real
account created in Northcomm's Supabase, kept alive for as long as the app is on sale.

| Field | Value |
|---|---|
| Username | (create one, e.g. appreview@northcomm.app) |
| Password | (set one, and do not change it while a review is open) |

## Review notes (paste into "Notes" for the reviewer)

> ScanSpec is a free documentation lookup tool published by North Comm Technologies, the
> manufacturer of the RF cable assemblies it reads. Point the camera at the QR label printed
> on an assembly and the app opens that unit's factory test report.
>
> Sign in with the demo account provided above. To test without physical hardware, tap
> "Browse reports on file" on the home screen to see the catalogue and open any report
> directly. To scan a physical label, sign in on a second device, open "Browse reports on file", and point
> this app's scanner at the QR code shown there.
>
> The account is used only to sync scan history. It can be deleted from
> Settings > Delete my account.

Before submitting, sign in as the demo account on a real device and confirm that Browse
loads and a report opens. A reviewer who gets stuck on the first screen will reject the app.
