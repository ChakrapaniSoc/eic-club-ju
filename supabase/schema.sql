create extension if not exists pgcrypto;
create table if not exists public.site_items (
 id uuid primary key default gen_random_uuid(),
 type text not null check (type in ('event','member','achievement','setting')),
 payload jsonb not null default '{}'::jsonb,
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
create index if not exists site_items_type_created_idx on public.site_items(type, created_at desc);
create table if not exists public.registrations (
 id uuid primary key default gen_random_uuid(),
 name text not null,
 roll_number text not null,
 mobile text not null,
 email text not null,
 event_ids jsonb not null,
 created_at timestamptz not null default now()
);
alter table public.site_items enable row level security;
alter table public.registrations enable row level security;
-- No public table policies: all database access is through the protected Vercel API using the service-role key.
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('eic-media','eic-media',true,5242880,array['image/png','image/jpeg','image/webp','image/gif'])
on conflict (id) do update set public=true,file_size_limit=5242880;
