# Northcomm ScanSpec - iOS build (no Mac needed)

The iPhone app is the same app you already use in the browser, wrapped with
Capacitor so it can go on the App Store. It BUNDLES the web files (it is a real
app, not a shortcut to a website), and it builds on GitHub's Mac servers, so
nobody needs to own a Mac.

## How a build runs

1. Go to the repo on GitHub, open the **Actions** tab.
2. Pick **iOS build** on the left, click **Run workflow**.
3. GitHub spins up a Mac, builds the app, and (once the secrets below are set)
   uploads it to App Store Connect.

Before Apple enrollment is finished, the build still runs and proves the app
compiles. It just cannot upload yet, because uploading needs an Apple account.

## The one-time secrets to add after Apple enrollment

Add these under **Settings > Secrets and variables > Actions** in the GitHub
repo. Once they exist, the same workflow signs and uploads automatically.

| Secret | What it is / where to get it |
|--------|------------------------------|
| `TEAM_ID` | Your 10-character Apple Developer Team ID (developer.apple.com > Membership). |
| `BUILD_CERTIFICATE_BASE64` | An Apple **Distribution** certificate exported as a `.p12`, then base64-encoded. |
| `P12_PASSWORD` | The password you set when exporting that `.p12`. |
| `PROVISIONING_PROFILE_BASE64` | An **App Store** provisioning profile for `com.northcomm.scanspec`, base64-encoded. |
| `APPSTORE_ISSUER_ID` | App Store Connect > Users and Access > Integrations > App Store Connect API: the Issuer ID. |
| `APPSTORE_KEY_ID` | The Key ID of an API key you create on that same page. |
| `APPSTORE_PRIVATE_KEY` | The contents of the `.p8` file you download when creating that API key (you can only download it once). |

To base64-encode a file on a Mac: `base64 -i file.p12 | pbcopy` then paste.
On Windows PowerShell: `[Convert]::ToBase64String([IO.File]::ReadAllBytes("file.p12"))`.

## App facts (for App Store Connect)

- **App ID / bundle identifier:** `com.northcomm.scanspec`
- **Display name:** Northcomm ScanSpec
- **Listing text, keywords, privacy answers:** see `app-store/LISTING.md`
- **Store icon:** `icon-1024.png`
- **Screenshots still to capture:** see `app-store/SCREENSHOTS-TODO.md`

## Local commands (optional, for developers)

- `npm install` - install the build tooling
- `npm run build:web` - copy the current web app into `www/` (the bundle)

The `ios/` native project is generated fresh on the Mac runner each build, so it
is not stored in the repo.

## First signed run checklist

Signing is MANUAL: the workflow imports your Distribution certificate into a temporary
keychain, installs your App Store profile, and signs with exactly those. Nothing is
created automatically on Apple's side, so set these up first.

1. In the Apple Developer account, register the App ID `com.northcomm.scanspec`.
2. Create an **Apple Distribution** certificate, export it as `.p12`, and note its password.
3. Create an **App Store** provisioning profile for that App ID using that certificate.
   Download it (`.mobileprovision`).
4. In App Store Connect, create the app record with the same bundle id.
5. Create an App Store Connect API key (Users and Access > Integrations), with App Manager
   access. Save the Issuer ID, Key ID and the `.p8` file.
6. Add all 7 secrets (table above). If any is missing the workflow builds the unsigned
   compile proof instead and says how many it found in the "Check for signing secrets" step.
7. Run **iOS build**. Early failures to expect and what they mean:
   - "Profile is for X, expected TEAMID.com.northcomm.scanspec": wrong profile or wrong TEAM_ID.
   - "No identity found" or an empty identity list: the `.p12` is not a Distribution cert,
     or the password is wrong.
   - Export error about the profile: the profile was made with a different certificate than the
     `.p12` you uploaded.
8. When it passes, the build appears in App Store Connect > TestFlight after Apple's
   processing (usually under 30 minutes). Install it through TestFlight on a real iPhone and
   check: camera scan, a report opening in the Safari sheet, Delete my account.

The unsigned compile-proof path is unchanged and still runs with no secrets.

Reports and outside links open in an in-app Safari sheet (`@capacitor/browser`) inside the
iPhone app; in a normal browser they behave as before.
