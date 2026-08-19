-- Northcomm ScanSpec — run once in the Supabase SQL editor (Mark's project)
-- Creates the parts table, scan history, the "reports" storage bucket,
-- and an auto-sync trigger: upload NC-<serial>.pdf -> part row appears.

-- 1) Parts table (what the app looks up by serial)
create table if not exists public.northcomm_parts (
  serial   text primary key,
  title    text,
  pdf_url  text,
  result   text default 'PASS',
  specs    jsonb default '[]'::jsonb,
  created_at timestamptz default now()
);

alter table public.northcomm_parts enable row level security;

-- anyone with the app (anon key) can READ parts; only dashboard/service can write
create policy "parts_public_read" on public.northcomm_parts
  for select using (true);

-- 2) Scan history (per signed-in user)
create table if not exists public.northcomm_scans (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  code text not null,
  title text,
  scanned_at timestamptz default now(),
  unique (user_id, code)
);

alter table public.northcomm_scans enable row level security;

create policy "scans_own_select" on public.northcomm_scans
  for select using (auth.uid() = user_id);
create policy "scans_own_insert" on public.northcomm_scans
  for insert with check (auth.uid() = user_id);
create policy "scans_own_update" on public.northcomm_scans
  for update using (auth.uid() = user_id);
create policy "scans_own_delete" on public.northcomm_scans
  for delete using (auth.uid() = user_id);

-- 3) Storage bucket for the PDFs Mark drops in manually
insert into storage.buckets (id, name, public)
values ('reports', 'reports', true)
on conflict (id) do nothing;

-- public can read the PDFs; uploads happen only via the dashboard (owner)
create policy "reports_public_read" on storage.objects
  for select using (bucket_id = 'reports');

-- 4) Auto-sync: when a PDF named <SERIAL>.pdf lands in "reports",
--    create/refresh the matching part row pointing at its public URL.
create or replace function public.sync_report_to_part()
returns trigger
language plpgsql
security definer
as $$
declare
  v_serial text;
begin
  if new.bucket_id <> 'reports' then return new; end if;
  if new.name !~* '\.pdf$' then return new; end if;

  v_serial := upper(regexp_replace(new.name, '\.pdf$', '', 'i'));

  -- pdf_url stores just the object name; the app builds the full public URL
  insert into public.northcomm_parts (serial, title, pdf_url, result)
  values (v_serial, 'RF Cable Assembly Test Report', new.name, 'PASS')
  on conflict (serial) do update
    set pdf_url = excluded.pdf_url;

  return new;
end;
$$;

create or replace trigger trg_sync_report_to_part
after insert on storage.objects
for each row execute function public.sync_report_to_part();
