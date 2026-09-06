# Mark's To-Do List

Only you can do these steps because they need your Supabase login. Should take about 5 minutes.

## The one setup step (do this once)

1. Go to supabase.com and log in to your Northcomm Supabase project.
   (This makes the app secure and turns on account deletion.)
2. In the left menu, click **SQL Editor**.
   (This is where the setup runs.)
3. Open this link, then click the copy icon at the top right of the file box to copy everything:
   https://github.com/Northcomm-Tech/Northcomm.app/blob/master/northcomm-setup.sql
   (This is the single setup file. It is safe to run more than once.)
4. Paste it into the big empty box in the SQL Editor.
5. Click the green **Run** button (bottom right).
   (When it says success, you are done. The app is now live and secure.)


## The Apple one (start this now, it takes about a month)

To get ScanSpec on the App Store, North Comm needs its own Apple Developer account in the
business name. Apple verifies the business first, and that is the slow part.

1. Check whether North Comm already has a D-U-N-S number (many companies do without knowing).
   Free lookup: https://www.dnb.com/duns-number/lookup.html
   If there is not one, request it on that same page. It is free and takes 1-2 weeks.
2. Once you have the D-U-N-S, enroll at https://developer.apple.com/programs/enroll/
   Choose **Organization**, not Individual. $99/year.
   Use the legal business name exactly as it appears on your incorporation paperwork.
   Apple's verification takes another 1-3 weeks.
3. Tell Jack when it is approved. He handles the submission from there.

## Your everyday step: adding a new report

Do this any time you have a new spec sheet. No developer needed.

1. In Supabase, click **Storage** in the left menu.
2. Open the **reports** bucket.
3. Click **Upload file** and pick your PDF.
4. Name the PDF exactly after the serial, like `NC-121483.pdf`.
   (Scanning that serial will now pull up this PDF automatically.)

That's it. The app is live at https://northcomm-tech.github.io/Northcomm.app/
