drop table if exists public.maria;
create table public.maria (vanid int
,dwid int
,statefileid int);
copy public.maria from '/users/garrett/desktop/import.txt' with csv header delimiter as '	' encoding 'windows-1251';