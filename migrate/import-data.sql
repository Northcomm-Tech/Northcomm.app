-- Northcomm data import — run AFTER supabase-setup.sql, in Mark's SQL Editor.
-- Copies the existing part record over. pdf_url is just the filename;
-- the app builds the full link to the "reports" bucket.

insert into public.northcomm_parts (serial, title, pdf_url, result, specs)
values (
  'NC-121483',
  'RF Cable Assembly Sweep Report',
  'NC-121483.pdf',
  'PASS',
  '[["Result","PASS"],["VSWR @ 155 MHz","1.076"],["VSWR @ 425 MHz","1.093"],["VSWR @ 920 MHz","1.140"],["Insertion loss @ 155 MHz","-0.28 dB"],["Insertion loss @ 920 MHz","-0.77 dB"],["Swept range","1 MHz - 6 GHz"],["Tested","8/13/2026"]]'::jsonb
)
on conflict (serial) do update
  set title = excluded.title,
      pdf_url = excluded.pdf_url,
      result = excluded.result,
      specs = excluded.specs;
