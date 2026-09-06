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
