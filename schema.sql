-- Run in Supabase SQL Editor. RLS is enabled; clients cannot directly write leaderboard rows.
create table if not exists public.pilot_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  pilot_name text not null default 'ROOKIE' check (char_length(pilot_name) between 1 and 18),
  created_at timestamptz not null default now()
);
create table if not exists public.run_scores (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  pilot_name text not null,
  score integer not null check (score >= 0 and score <= 10000000),
  created_at timestamptz not null default now()
);
create index if not exists run_scores_score_idx on public.run_scores(score desc);
alter table public.pilot_profiles enable row level security;
alter table public.run_scores enable row level security;
create policy "profiles readable" on public.pilot_profiles for select using (true);
create policy "own profile insert" on public.pilot_profiles for insert with check (auth.uid() = user_id);
create policy "own profile update" on public.pilot_profiles for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "scores readable" on public.run_scores for select using (true);
create or replace view public.leaderboard as
 select p.user_id, coalesce(p.pilot_name, max(s.pilot_name)) as pilot_name, max(s.score)::integer as best_score
 from public.pilot_profiles p join public.run_scores s on s.user_id=p.user_id
 group by p.user_id,p.pilot_name;
grant select on public.leaderboard to anon, authenticated;
create or replace function public.submit_run(p_score integer, p_pilot_name text)
returns void language plpgsql security definer set search_path=public as $$
declare n text;
begin
 if auth.uid() is null then raise exception 'Sign in required'; end if;
 if p_score < 0 or p_score > 10000000 then raise exception 'Invalid score'; end if;
 n := left(regexp_replace(coalesce(p_pilot_name,'ROOKIE'), '[^a-zA-Z0-9 _-]', '', 'g'),18);
 if n = '' then n := 'ROOKIE'; end if;
 insert into public.pilot_profiles(user_id,pilot_name) values(auth.uid(),n)
 on conflict(user_id) do update set pilot_name=excluded.pilot_name;
 insert into public.run_scores(user_id,pilot_name,score) values(auth.uid(),n,p_score);
end; $$;
revoke all on function public.submit_run(integer,text) from public;
grant execute on function public.submit_run(integer,text) to authenticated;
