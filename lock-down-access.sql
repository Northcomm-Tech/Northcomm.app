-- Run once in Mark's Supabase SQL Editor.
-- Goal: a scanned serial is the key. Without one you cannot list or read reports.

-- 1) Stop anyone reading the whole catalogue with the app's public key.
drop policy if exists "parts_public_read" on public.northcomm_parts;

-- Signed-in staff can still browse the full list inside the app.
drop policy if exists "parts_read_signed_in" on public.northcomm_parts;
create policy "parts_read_signed_in" on public.northcomm_parts
  for select to authenticated using (true);

-- 2) Scanning stays account-free: one serial in, at most one report out.
--    Runs as owner, so it sees past the policy above, but only ever for a
--    serial the caller already knows.
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

revoke all on function public.lookup_report(text) from public;
grant execute on function public.lookup_report(text) to anon, authenticated;
