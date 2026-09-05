# Northcomm ScanSpec Handoff Setup

Goal: Mark owns everything (GitHub repo + Supabase project) so the app is a clean asset if he ever sells the company.

**Live app:** https://northcomm-tech.github.io/Northcomm.app/

The app keys are already filled into the code and pushed live, so Mark does not need to touch any code.

## The one setup step (Mark, in Supabase)

This is the only manual database step, and only Mark can do it because it needs his Supabase login.

1. Log in to the Northcomm Supabase project and open the **SQL Editor**.
2. Open `northcomm-setup.sql` from this repo, copy everything in it, and paste it into the editor.
3. Click **Run**.

That single file does everything: it creates the parts and scans tables, the public `reports` storage bucket, and the trigger that auto-registers any uploaded `<SERIAL>.pdf` as a scannable part. It also locks the catalogue so it stays secure and adds account deletion. It is safe to run more than once.

## How Mark adds a report (his manual workflow, no developer needed)

1. Log in to Supabase > Storage > `reports` bucket.
2. Upload the PDF named exactly after the serial, e.g. `NC-121483.pdf`.
3. Done. The part row is created automatically; scanning a QR containing `NC-121483` now pulls that PDF.
4. Optional: open Table Editor > `northcomm_parts` and fill in a nicer `title` or `specs`.

## QR labels

Each QR just encodes the plain serial text, e.g. `NC-121483`. Any label printer or free QR generator works. The app also has a built-in "generate QR" view for any part it displays.

## Testing checklist

- [ ] Open the live URL on a phone, allow camera.
- [ ] Scan a QR containing a serial that has a PDF uploaded, spec sheet plus "Open PDF" appears.
- [ ] Scan an unknown serial, clean "not found" message, no crash.
- [ ] Upload a new PDF, scan its serial within a minute, found without any code change.
