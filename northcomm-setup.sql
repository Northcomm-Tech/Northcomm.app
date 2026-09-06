-- Northcomm ScanSpec — COMPLETE database setup.
-- Run this once in the Supabase SQL Editor. Safe to re-run anytime; it makes no duplicates.
--
-- What this does, in plain terms:
--   * Creates the parts catalogue and per-user scan history.
--   * Creates the public "reports" storage bucket where Mark drops the PDFs.
--   * Auto-creates a part row whenever an NC-<serial>.pdf is uploaded.
--   * Leaves the database SECURE: the full catalogue is NOT publicly listable.
--     Anonymous scanning works only through the lookup_report function (one
--     known serial in, at most one report out). Signed-in staff can browse the
--     full list inside the app.
--   * Adds delete_own_account() so a signed-in user can delete their account
--     (required by the App Store).

-- ============================================================
-- 1) Parts table — what the app looks up by serial number
-- ============================================================
create table if not exists public.northcomm_parts (
  serial   text primary key,
  title    text,
  pdf_url  text,
  result   text default 'PASS',
  specs    jsonb default '[]'::jsonb,
  created_at timestamptz default now()
);

alter table public.northcomm_parts enable row level security;

-- SECURITY: make sure the old "anyone can list everything" policy is GONE.
-- (It existed in the first setup file; we drop it so the catalogue is not public.)
drop policy if exists "parts_public_read" on public.northcomm_parts;

-- Only SIGNED-IN staff can browse the full parts list inside the app.
-- Anonymous users never read this table directly — they go through
-- lookup_report() below, which returns a single report for a known serial.
drop policy if exists "parts_read_signed_in" on public.northcomm_parts;
create policy "parts_read_signed_in" on public.northcomm_parts
  for select to authenticated using (true);

-- ============================================================
-- 2) Scan history — private to each signed-in user
-- ============================================================
create table if not exists public.northcomm_scans (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  code text not null,
  title text,
  scanned_at timestamptz default now(),
  unique (user_id, code)
);

alter table public.northcomm_scans enable row level security;

drop policy if exists "scans_own_select" on public.northcomm_scans;
create policy "scans_own_select" on public.northcomm_scans
  for select using (auth.uid() = user_id);

drop policy if exists "scans_own_insert" on public.northcomm_scans;
create policy "scans_own_insert" on public.northcomm_scans
  for insert with check (auth.uid() = user_id);

drop policy if exists "scans_own_update" on public.northcomm_scans;
create policy "scans_own_update" on public.northcomm_scans
  for update using (auth.uid() = user_id);

drop policy if exists "scans_own_delete" on public.northcomm_scans;
create policy "scans_own_delete" on public.northcomm_scans
  for delete using (auth.uid() = user_id);

-- ============================================================
-- 3) Storage bucket for the PDF reports Mark uploads
-- ============================================================
-- storage.objects is owned by Supabase's storage role, so on some projects the
-- SQL Editor cannot create policies on it. We do it best-effort: if it is not
-- allowed, the script still finishes and prints a note, instead of failing the
-- whole setup. Anyone can READ a PDF (the app opens them by link); uploads
-- happen only through the Supabase dashboard, not the public app key.
do $$
begin
  insert into storage.buckets (id, name, public)
  values ('reports', 'reports', true)
  on conflict (id) do nothing;

  drop policy if exists "reports_public_read" on storage.objects;
  create policy "reports_public_read" on storage.objects
    for select using (bucket_id = 'reports');
exception when others then
  raise notice 'Storage bucket/policy step skipped (%). If PDFs do not open, create a public "reports" bucket in Storage and add a public read policy there.', sqlerrm;
end $$;

-- ============================================================
-- 4) Auto-sync trigger — upload NC-<serial>.pdf, get a part row
-- ============================================================
-- When a PDF named <SERIAL>.pdf lands in the "reports" bucket, create or
-- refresh the matching part row pointing at that PDF.
create or replace function public.sync_report_to_part()
returns trigger
language plpgsql
security definer
set search_path = public
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

-- ============================================================
-- 5) lookup_report — how anonymous scanning stays safe
-- ============================================================
-- Scanning stays account-free: one serial in, at most one report out. This
-- runs as owner, so it sees past the "signed-in only" policy on the parts
-- table — but only ever for a serial the caller already scanned. Nobody can
-- list the whole catalogue with it. The app calls: rpc("lookup_report", {scanned: serial})
create or replace function public.lookup_report(scanned text)
returns table(serial text, title text, pdf_url text, result text, specs jsonb)
language plpgsql
security definer
set search_path = public
as $$
declare
  want text := upper(regexp_replace(coalesce(scanned,''), '[^A-Za-z0-9]', '', 'g'));
begin
  -- too short to be a real serial: refuse, so nobody can fish with "NC"
  if length(want) < 6 then
    return;
  end if;

  -- exact match once punctuation and case are ignored
  return query
    select p.serial, p.title, p.pdf_url, p.result, p.specs
    from public.northcomm_parts p
    where upper(regexp_replace(p.serial, '[^A-Za-z0-9]', '', 'g')) = want
    limit 1;
  if found then
    return;
  end if;

  -- real labels wrap the serial in other text, e.g. "S/N: NC-121484DAN"
  return query
    select p.serial, p.title, p.pdf_url, p.result, p.specs
    from public.northcomm_parts p
    where length(regexp_replace(p.serial, '[^A-Za-z0-9]', '', 'g')) >= 6
      and want like '%' || upper(regexp_replace(p.serial, '[^A-Za-z0-9]', '', 'g')) || '%'
    order by length(regexp_replace(p.serial, '[^A-Za-z0-9]', '', 'g')) desc
    limit 1;
end;
$$;

-- anon + signed-in users may run the lookup; nobody else.
revoke all on function public.lookup_report(text) from public;
grant execute on function public.lookup_report(text) to anon, authenticated;

-- ------------------------------------------------------------
-- northcomm_scans must tolerate an anonymised row: user_id becomes null and
-- anonymised_at records when. Both statements are safe to re-run.
-- ------------------------------------------------------------
alter table public.northcomm_scans
  add column if not exists anonymised_at timestamptz;

alter table public.northcomm_scans
  alter column user_id drop not null;

-- An anonymised row belongs to nobody, so no policy should return it to anyone.
-- (The existing per-user policies already filter on user_id = auth.uid(), and
-- null never equals a uuid, so anonymised rows fall out of every user's view.)

-- ============================================================
-- 6) delete_own_account — App Store requirement
-- ============================================================
-- Lets a signed-in user delete their own account from inside the app.
-- The app calls: rpc("delete_own_account")
-- HOW THIS DELETES, AND WHY IT DOES NOT CASCADE
--
-- Apple requires that "delete my account" genuinely removes the account, not
-- merely deactivates it -- if the person can still sign in afterwards, the app
-- gets rejected. So the auth user is destroyed outright.
--
-- The scan rows are a different matter. Hard-deleting them, or letting a
-- foreign-key cascade take them, tears rows out of the middle of the history
-- table. Instead every column that could identify a person is set to null and
-- the row is marked anonymised. What survives is "some serial was looked up at
-- some time", which is nobody's personal data, so this still satisfies the
-- deletion requirement.
--
-- The parts catalogue is never touched by this function. A user deleting their
-- account can never remove a Northcomm report.
create or replace function public.delete_own_account()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  uid uuid := auth.uid();
begin
  if uid is null then
    raise exception 'not signed in';
  end if;

  -- 1) unlink the history from the person, keeping the rows intact
  update public.northcomm_scans
     set user_id      = null,
         anonymised_at = now()
   where user_id = uid;

  -- 2) destroy the sign-in itself, so the account is really gone
  delete from auth.users where id = uid;
end;
$$;

-- signed-in users only.
revoke all on function public.delete_own_account() from public;
grant execute on function public.delete_own_account() to authenticated;
