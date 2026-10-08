# Northcomm ScanSpec - App Store Connect Listing

Ready-to-paste copy for App Store Connect. Character counts are stated next to every
limited field. No em dashes are used anywhere in the customer-facing copy.

---

## App Name (limit 30)
**Northcomm ScanSpec**
Character count: 18 / 30

## Subtitle (limit 30)
**Test reports for RF cables**
Character count: 29 / 30

## Promotional Text (limit 170)
**Scan the QR label on any Northcomm RF cable and pull up the factory test report that shipped with it, in seconds. Built for field and install crews. Free, no ads.**
Character count: 165 / 170

## Description (full)

Northcomm ScanSpec is the official test-report app for North Comm Technologies RF cable products. Scan the QR label on a Northcomm product and open the factory test report that shipped with it. No more digging through paperwork or emails in the field.

WHAT IT DOES

Point your camera at the QR label on a Northcomm product. ScanSpec reads the serial number in the code and opens the factory test report for that exact unit, with its pass result and sweep measurements. You can also type the serial number instead of scanning.

BUILT FOR THE FIELD

Whether you are on a tower, in an equipment room, or on an install site, the report you need is one scan away. The interface is fast and simple so you spend less time searching and more time working.

KEY FEATURES

- Scan a QR label and open that product's factory test report
- Type a serial number when a label is hard to scan
- Browse every report on file and print replacement QR labels
- Your scan history is saved to your account and synced across your devices
- Free to use, with no ads and no third-party tracking

YOUR ACCOUNT

ScanSpec asks you to create a free account the first time you open it. Your account keeps your scan history saved and synced across your devices. You can delete your account from inside the app at any time.

PRIVACY

ScanSpec does not run ads, does not use analytics SDKs, and does not share your data with third parties. Your account details and scan history are used to run the app, and North Comm Technologies may email you about its products, with an unsubscribe link in every email. See the privacy policy for full details.

ABOUT NORTH COMM TECHNOLOGIES

North Comm Technologies designs and builds precision RF cable assemblies in Plano, Texas. ScanSpec is provided free so customers and field crews can retrieve the test documentation for their products quickly and reliably.

Questions or issues? Visit the support page linked below.

---

## Copyright
**2026 North Comm Technologies**

## What's New (version 1.0)
**First release: scan a Northcomm QR label or type a serial number to open the product's factory test report.**

---

## Keywords (limit 100, single comma-separated string)
**RF,cable,assembly,spec,scan,QR,test report,datasheet,coax,VSWR,sweep,insertion loss,field,install**
Character count: 97 / 100
(The app name is indexed already, so "northcomm" is not repeated here.)

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
- Unrestricted Web Access: **No** (the app only opens Northcomm test reports and its own
  support pages, not arbitrary web browsing)
- Gambling (real): **No**
- Contests: **No**
- Made for Kids: **No** (this is a professional tool, not a kids app)

Result: **4+**

---

## App Privacy ("nutrition label")

Declare exactly the three data types below. Everything else: **not collected**.
This must match app-store/PRIVACY-ANSWERS.md, privacy.html and ios-extras/PrivacyInfo.xcprivacy.

### 1. Contact Info > Email Address
- Collected: **Yes** · Linked to identity: **Yes** · Tracking: **No**
- Purposes: **App Functionality** and **Developer's Advertising or Marketing**

### 2. Contact Info > Name
- Collected: **Yes** · Linked to identity: **Yes** · Tracking: **No**
- Purposes: **App Functionality** and **Developer's Advertising or Marketing**

### 3. Usage Data > Product Interaction (the user's scan history)
- Collected: **Yes** · Linked to identity: **Yes** · Tracking: **No**
- Purposes: **App Functionality** only

Answer **No** to "Do you or your third-party partners use data for tracking?". There is no
third-party advertising and no analytics SDK.

---

## What to Prepare Before Submitting

1. **Reviewer sign-in demo credentials (ACTION NEEDED - Jack must create this).**
   The app has required Supabase email/password sign-in.
   Apple reviewers will test it. Create a dedicated test account (for example
   appreview@northcommtechnologies.com) with a known password and enter it in App Store
   Connect under App Review Information > Sign-In Required > demo account. Do NOT reuse a
   real customer account. Confirm the account can sign in on the live app before
   submitting.

2. **App Review notes (paste into the Notes field):**
   "Northcomm ScanSpec is a free app from North Comm Technologies, a manufacturer of RF
   cable assemblies. Each product ships with a QR label holding its serial number. The app
   scans the label and opens that product's factory test report (a PDF).

   To test without a physical product:
   1. Sign in with the demo account in App Review Information.
   2. Scan this sample label from a second screen:
      https://northcomm-tech.github.io/Northcomm.app/app-store/review-sample-qr.png
      or type the serial 121484 in "Enter Serial Number Here" and tap Retrieve Report.
   3. The report for NC-121484 opens with a PASS result.

   Your account keeps your scan history synced across devices. Account deletion: Account
   (top right) > Delete my account. If the demo account is deleted during review, it can
   be recreated with the same details. No ads, no analytics, no third-party tracking."

   Before submitting: confirm the demo account signs in on the live app, the sample serial
   opens its report, and Delete my account works (needs northcomm-setup.sql run first).

3. **Sample QR for the reviewer**: app-store/review-sample-qr.png (encodes
   https://northcomm-tech.github.io/Northcomm.app/?s=NC-121484, verified to decode). It is
   served from the live site once this branch is pushed.

4. **Screenshots** at the required sizes (see SCREENSHOTS-TODO.md).

5. **App icon**: use icon-1024.png at the repo root (1024x1024, flattened, no alpha).
