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

- Scan a QR label and open the matching factory test report and spec sheet
- Fast camera-based lookup designed for field and install staff
- Optional sign-in to save your scan history across your devices
- Clean, no-clutter interface
- Free to use, with no ads and no third-party tracking

OPTIONAL ACCOUNT

You can use ScanSpec without an account. If you want your scan history saved and synced across devices, you can create a free account with your email address. You can delete your account and its data from inside the app at any time.

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
- Collected: **Yes**
- Linked to the user's identity: **Yes** (it is the account identifier)
- Used for tracking: **No**
- Purposes: **App Functionality** only
  (used to create and access the optional account; not used for advertising, analytics,
  or product personalization)

### 2. User Content > Other User Content  (the user's scan history)
- Collected: **Yes**
- Linked to the user's identity: **Yes** (tied to the account when signed in)
- Used for tracking: **No**
- Purposes: **App Functionality** only
  (saved so scan history syncs across the user's devices)

Notes for whoever fills the form:
- If App Store Connect does not offer a clean "scan history" fit under User Content, use
  **User Content > Other User Content**. Do not declare Browsing History, Usage Data, or
  Identifiers, because the app does not collect those.
- Answer **No** to "Do you or your third-party partners use data for tracking?" for the
  whole app. There is no third-party advertising and no analytics SDK.
- Data is NOT used for Third-Party Advertising, Developer's Advertising, Analytics, or
  Product Personalization. App Functionality is the only purpose for both types.
- The app can be used with no account at all; when used signed-out, neither data type is
  collected.

---

## What to Prepare Before Submitting

1. **Reviewer sign-in demo credentials (ACTION NEEDED - Jack must create this).**
   The app has optional Supabase email/password sign-in. Even though sign-in is optional,
   Apple reviewers will test it. Create a dedicated test account (for example
   reviewer@northcommtechnologies.com) with a known password and enter it in App Store
   Connect under App Review Information > Sign-In Required > demo account. Do NOT reuse a
   real customer account. Confirm the account can sign in on the live app before
   submitting.

2. **App Review notes (paste into the Notes field):**
   "Northcomm ScanSpec is a free utility for North Comm Technologies, a manufacturer of
   RF cable assemblies. The app uses the device camera to scan a QR label printed on an
   assembly. The QR code contains that unit's serial number. The app reads the serial and
   fetches that assembly's factory test report / spec sheet PDF. Sign-in is optional and
   only saves scan history across devices; the app is fully usable signed out. To test
   the scanner without a physical label, use the sample QR shown in one of the
   screenshots (or open the live web version at
   https://northcomm-tech.github.io/Northcomm.app/). Account deletion is available in-app.
   No ads, no analytics, no third-party tracking."

3. **A scannable sample QR** for the reviewer (a serial that resolves to a real PDF).
   Include it as a screenshot and/or reference it in the review notes so the reviewer can
   exercise the scanner on a simulator or second screen.

4. **Screenshots** at the required sizes (see SCREENSHOTS-TODO.md).

5. **App icon**: use icon-1024.png at the repo root (1024x1024, flattened, no alpha).
