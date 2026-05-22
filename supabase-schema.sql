-- Partner Jobs Landing Page - Supabase setup
-- Run in Supabase SQL editor once before launch.

create extension if not exists pgcrypto;

create table if not exists public.jobs (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  location text not null,
  is_active boolean not null default true,
  sort_order integer not null default 10,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  phone text not null,
  city text,
  job_id text,
  job_title text,
  consent boolean not null default false,
  tracking jsonb not null default '{}'::jsonb,
  page_url text,
  user_agent text,
  source text,
  created_at timestamptz not null default now()
);

insert into public.jobs (title, location, is_active, sort_order)
values
  ('שירות ומכירות', 'באר שבע', true, 1),
  ('שירות ומכירות', 'ראש העין', true, 2),
  ('שירות ומכירות', 'חיפה', true, 3)
on conflict do nothing;

alter table public.jobs enable row level security;
alter table public.leads enable row level security;

drop policy if exists "Public can read active jobs" on public.jobs;
create policy "Public can read active jobs"
on public.jobs for select
to anon, authenticated
using (is_active = true or auth.role() = 'authenticated');

drop policy if exists "Authenticated users can manage jobs" on public.jobs;
create policy "Authenticated users can manage jobs"
on public.jobs for all
to authenticated
using (true)
with check (true);

drop policy if exists "Public can insert leads" on public.leads;
create policy "Public can insert leads"
on public.leads for insert
to anon, authenticated
with check (true);

drop policy if exists "Authenticated users can read leads" on public.leads;
create policy "Authenticated users can read leads"
on public.leads for select
to authenticated
using (true);
