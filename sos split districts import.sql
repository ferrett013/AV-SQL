drop table if exists voterfiles_sos.split_april2017;
create table voterfiles_sos.split_april2017 (county text
,precinct_code numeric
,split_code text
,district_code text
,district_type text
,district_name text
);

copy voterfiles_sos.split_april2017 from '/users/garrett/desktop/ex-003 master voter list/SPLIT_DISTRICTS_04_03_2017_08_57_17.TXT' with csv header delimiter as ',' encoding 'windows-1251';
select count(*) from voterfiles_sos.split_april2017;