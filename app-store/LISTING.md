# Northcomm ScanSpec - App Store Connect Listing

Ready-to-paste copy for App Store Connect. Character counts are stated next to every
limited field. No em dashes are used anywhere in the customer-facing copy.

---

## App Name (limit 30)
**Northcomm ScanSpec**
Character count: 18 / 30

## Subtitle (limit 30)
**Scan RF assemblies for specs**
Character count: 28 / 30

## Promotional Text (limit 170)
**Scan the QR label on any Northcomm RF cable assembly and pull up its factory test report and spec sheet in seconds. Built for field and install crews. Free, no ads.**
Character count: 164 / 170

## Description (full)

Northcomm ScanSpec is the official spec-lookup tool for North Comm Technologies RF cable assemblies. Scan the QR label on an assembly and instantly open its factory test report and specification sheet. No more digging through paperwork or emails in the field.

WHAT IT DOES

Point your camera at the QR label printed on a Northcomm assembly. ScanSpec reads the serial encoded in the code and pulls up the exact document for that unit: the factory test report, the spec sheet, and the details you need to verify and install with confidence.

BUILT FOR THE FIELD

Whether you are on a tower, in a data center, or on an install site, the information you need is one scan away. The interface is fast and simple so you spend less time searching and more time working.

KEY FEATURES

- Scan a QR label and open the matching factory test report and spec sheet, no account needed
- Fast camera-based lookup designed for field and install staff
- Optional sign-in to keep your scan history synced across your devices
- Clean, no-clutter interface
- Free to use, with no ads and no third-party tracking

YOUR ACCOUNT (OPTIONAL)

No account is needed to scan a label, look up a part number, or open a report. An account is only there if you want your recent-scans history to follow you across devices. Sign in from Settings or from the invite under Recent scans, and delete your account from inside the app at any time.

PRIVACY

ScanSpec does not run ads, does not use analytics SDKs, and does not share your data with third parties for advertising. The only data tied to your account is your email address and your own scan history, and both are used solely to make the app work. See the privacy policy for full details.

ABOUT NORTH COMM TECHNOLOGIES

North Comm Technologies manufactures RF cable assemblies. ScanSpec is provided as a free utility so customers and field crews can retrieve the documentation for those assemblies quickly and reliably.

Questions or issues? Visit the support page linked below.

---

## Keywords (limit 100, single comma-separated string)
**RF,cable,assembly,spec,scan,QR,barcode,test report,datasheet,coax,northcomm,field,install,antenna**
Character count: 97 / 100

## Categories
- Primary category: **Utilities**
- Secondary category: **Business**

Rationale: the app is a single-purpose scan-and-retrieve utility, which fits Utilities
best. Its audience is professional field and install staff, so Business is the natural
secondary.

## URLs
- Support URL: https://northcomm-tech.github.io/Northcomm.app/support.html
- Marketing URL: https://northcomm-tech.github.io/Northcomm.app/
- Privacy Policy URL: https://northcomm-tech.github.io/Northcomm.app/privacy.html

---

## Age Rating Questionnaire
Target rating: **4+**

Answer every content-description question with **None**:

- Cartoon or Fantasy Violence: None
- Realistic Violence: None
- Prolonged Graphic or Sadistic Realistic Violence: None
- Profanity or Crude Humor: None
- Mature/Suggestive Themes: None
- Horror/Fear Themes: None
- Medical/Treatment Information: None
- Alcohol, Tobacco, or Drug Use or References: None
- Simulated Gambling: None
- Sexual Content or Nudity: None
- Graphic Sexual Content and Nudity: None

Other questionnaire toggles:
- Unrestricted Web Access: **No** (the app only opens Northcomm assembly documents, not
  arbitrary web browsing)
- Gambling (real): **No**
- Contests: **No**
- Made for Kids: **No** (this is a professional tool, not a kids app)

Result: **4+**

---

## App Privacy ("nutrition label")

Declare exactly the two data types below. Everything else: **not collected**.

### 1. Contact Info > Email Address
- Collected: **Yes, only if the user chooses to create an account**
- Linked to the user's identity: **Yes** (it is the account identifier)
- Used for tracking: **No**
- Purposes: **App Functionality** only
  (used to create and access the optional account; not used for advertising, analytics,
  or product personalization)

### 2. Usage Data > Product Interaction  (the user's scan history)
- Collected: **Yes** (kept on-device only when signed out; synced to the account when signed in)
- Linked to the user's identity: **Yes, when the user is signed in** (device-local and unlinked otherwise)
- Used for tracking: **No**
- Purposes: **App Functionality** only
  (saved so scan history syncs across the user's devices, for users who sign in)

Notes for whoever fills the form:
- Scan history is declared as **Usage Data > Product Interaction**, matching
  app-store/PRIVACY-ANSWERS.md. Do not declare Browsing History, User Content, or
  Identifiers, because the app does not collect those.
- Answer **No** to "Do you or your third-party partners use data for tracking?" for the
  whole app. There is no third-party advertising and no analytics SDK.
- Data is NOT used for Third-Party Advertising, Developer's Advertising, Analytics, or
  Product Personalization. App Functionality is the only purpose for both types.
- No account is required to use the app (App Review Guideline 5.1.1(v)). Both data types
  above are only collected from users who choose to create an account; a signed-out user's
  recent scans stay in local device storage and are never sent to the server.

---

## What to Prepare Before Submitting

1. **Reviewer demo credentials (ACTION NEEDED - Jack must create this).**
   No account is required to use the app -- scanning, manual entry, lookup and opening a
   report all work signed out. A demo account is still supplied so the reviewer can also
   exercise the account-bound history/sync/delete features. Create a dedicated test account
   (for example appreview@northcommtechnologies.com) with a known password and enter it in
   App Store Connect under App Review Information > Sign-In Information (not "Sign-In
   Required" -- the app has no such requirement). Do NOT reuse a real customer account.
   Confirm the account can sign in on the live app before submitting.

2. **App Review notes (paste into the Notes field):**
   "Northcomm ScanSpec is a free utility for North Comm Technologies, a manufacturer of
   RF cable assemblies. The app uses the device camera to scan a QR label printed on an
   assembly. The QR code contains that unit's serial number. The app reads the serial and
   fetches that assembly's factory test report / spec sheet PDF. No account is required for
   any of this. To test without a physical label, tap 'Enter a part number manually' on the
   Home screen and type NC-121484, or open the live web version at
   https://northcomm-tech.github.io/Northcomm.app/. Signing in is optional and only keeps
   scan history in sync across devices; demo credentials are provided in App Review
   Information for testing that path, and account deletion is available in-app under
   Settings (requires northcomm-setup.sql to have been run). No ads, no analytics, no
   third-party tracking."

3. **A scannable sample QR** for the reviewer (a serial that resolves to a real PDF).
   Include it as a screenshot and/or reference it in the review notes so the reviewer can
   exercise the scanner on a simulator or second screen.

4. **Screenshots** at the required sizes (see SCREENSHOTS-TODO.md).

5. **App icon**: use icon-1024.png at the repo root (1024x1024, flattened, no alpha).
