drop table if exists voterfiles_sos.split_march2017;
create table voterfiles_sos.split_march2017 (county text
,precinct_code numeric
,split_code text
,district_code text
,district_type text
,district_name text
);

copy voterfiles_sos.split_march2017 from '/users/garrett/desktop/ex-003 master voter list/SPLIT_DISTRICTS_03_01_2017_01_25_47.TXT' with csv header delimiter as ',' encoding 'windows-1251';
select count(*) from voterfiles_sos.split_march2017;