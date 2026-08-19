# Northcomm ScanSpec — Handoff Setup

Goal: Mark owns everything (GitHub repo + Supabase project) so the app is a clean asset if he ever sells the company.

## One-time setup (Jack)

1. **Supabase (Mark's project)**
   - Open the project's SQL Editor, paste and run `supabase-setup.sql` from this repo.
   - That creates: `northcomm_parts`, `northcomm_scans`, a public `reports` storage bucket, and a trigger that auto-registers any uploaded `<SERIAL>.pdf` as a scannable part.
2. **App keys**
   - In `index.html`, replace `SUPA_URL` and `SUPA_ANON` with Mark's project URL and anon key (Project Settings > API). The anon key is safe to be public — row security limits what it can do.
3. **GitHub**
   - Push this repo to Mark's GitHub account. Settings > Pages > deploy from `master` root.
   - App goes live at `https://<mark-account>.github.io/northcomm-scanspec/`.

## How Mark adds a report (his manual workflow, no Jack needed)

1. Log in to Supabase > Storage > `reports` bucket.
2. Upload the PDF named exactly after the serial, e.g. `NC-121483.pdf`.
3. Done. The trigger creates the part row automatically; scanning a QR containing `NC-121483` now pulls that PDF.
4. Optional: open Table Editor > `northcomm_parts` and fill in a nicer `title` or `specs`.

## QR labels

Each QR just encodes the plain serial text, e.g. `NC-121483`. Any label printer or free QR generator works. The app also has a built-in "generate QR" view for any part it displays.

## Testing checklist

- [ ] Open the live URL on a phone, allow camera.
- [ ] Scan a QR containing a serial that has a PDF uploaded → spec sheet + "Open PDF" appears.
- [ ] Scan an unknown serial → clean "not found" message, no crash.
- [ ] Upload a new PDF, scan its serial within a minute → found without any code change.
