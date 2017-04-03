drop table if exists cohorts.september_v2_2016_base;
drop table if exists cohorts.september_v2_2016_consbase;
drop table if exists cohorts.september_v2_2016_consgotv;
drop table if exists cohorts.september_v2_2016_gotv;
drop table if exists cohorts.september_v2_2016_hip;
drop table if exists cohorts.september_v2_2016_lop;
drop table if exists cohorts.september_v2_2016_lpnt;
drop table if exists cohorts.september_v2_2016_medhip;
drop table if exists cohorts.september_v2_2016_medlop;

create table cohorts.september_v2_2016_base (dwid int primary key
,householdid1 int
,householdid2 int
,firstname text
,middlename text
,lastname text
,namesuffix text
,age int
,gender text
,race text
,mailaddrline1 text
,mailaddrline2 text
,mailaddrcity text
,mailaddrstate text
,mailaddrzip text
,mailaddrzip4 text
,state text
,countyname text
,soscountycode int
,township text
,precinctcode bigint
,precinctname text
,uniqueprecinctcode bigint
,ward text
,congressionaldistrict int
,statehousedistrict int
,statesenatedistrict int
,municipaldistrict text
,countycommission text
,schoolboard text
,judicialdistrict text
,precinctsplit text
,citycouncil text
,countylegislative int
,schooldistrict text
,supervisordistrict int
,district1 text
,district2 text
,district3 text
,district4 text
,district5 text
,district6 text
,district7 text
,district8 text
,district9 text
,district10 text
,district11 text
,district12 text
,district13 text
,district14 text
,district15 text);

create table cohorts.september_v2_2016_consbase as select * from cohorts.september_v2_2016_base limit 0;
create table cohorts.september_v2_2016_consgotv as select * from cohorts.september_v2_2016_base limit 0;
create table cohorts.september_v2_2016_gotv as select * from cohorts.september_v2_2016_base limit 0;
create table cohorts.september_v2_2016_hip as select * from cohorts.september_v2_2016_base limit 0;
create table cohorts.september_v2_2016_lop as select * from cohorts.september_v2_2016_base limit 0;
create table cohorts.september_v2_2016_lpnt as select * from cohorts.september_v2_2016_base limit 0;
create table cohorts.september_v2_2016_medhip as select * from cohorts.september_v2_2016_base limit 0;
create table cohorts.september_v2_2016_medlop as select * from cohorts.september_v2_2016_base limit 0;

copy cohorts.september_v2_2016_base from '/users/garrett/desktop/91316_Base_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_consbase from '/users/garrett/desktop/91316_ConsBase_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_consgotv from '/users/garrett/desktop/91316_ConsGOTV_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_gotv from '/users/garrett/desktop/91316_GOTV_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_hip from '/users/garrett/desktop/91316_HiP_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_lop from '/users/garrett/desktop/91316_LoP_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_lpnt from '/users/garrett/desktop/91316_LPNT_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_medhip from '/users/garrett/desktop/91316_MedHiP_MAIL.txt' with csv header delimiter as '	';
copy cohorts.september_v2_2016_medlop from '/users/garrett/desktop/91316_MedLoP_MAIL.txt' with csv header delimiter as '	';

drop table if exists cohorts.september_v2_2016;

create table cohorts.september_v2_2016 as
	select dwid, 'ConsBase' as cohort from cohorts.september_v2_2016_consbase
	union all
	select dwid, 'ConsGOTV' as cohort from cohorts.september_v2_2016_consgotv
	union all
	select dwid, 'Base' as cohort from cohorts.september_v2_2016_base
	union all
	select dwid, 'GOTV' as cohort from cohorts.september_v2_2016_gotv
	union all
	select dwid, 'HiP' as cohort from cohorts.september_v2_2016_hip
	union all
	select dwid, 'MedHiP' as cohort from cohorts.september_v2_2016_medhip
	union all
	select dwid, 'MedLoP' as cohort from cohorts.september_v2_2016_medlop
	union all 
	select dwid, 'LoP' as cohort from cohorts.september_v2_2016_lop
	union all 
	select dwid, 'LPNT' as cohort from cohorts.september_v2_2016_lpnt;

select count(*) from cohorts.september_v2_2016;
select count(distinct dwid) from cohorts.september_v2_2016;
select cohort, count(*) from cohorts.september_v2_2016 group by 1 order by 1;


@export on;
@export set filename="/Users/Garrett/Desktop/Base.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='Base';
@export set filename="/Users/Garrett/Desktop/ConsBase.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='ConsBase';
@export set filename="/Users/Garrett/Desktop/ConsGOTV.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='ConsGOTV';
@export set filename="/Users/Garrett/Desktop/GOTV.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='GOTV';
@export set filename="/Users/Garrett/Desktop/HiP.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='HiP';
@export set filename="/Users/Garrett/Desktop/LPNT.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='LPNT';
@export set filename="/Users/Garrett/Desktop/LoP.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='LoP';
@export set filename="/Users/Garrett/Desktop/MedHiP.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='MedHiP';
@export set filename="/Users/Garrett/Desktop/MedLoP.txt" CsvRowDelimiter=\r\n;
select * from cohorts.september_v2_2016 where cohort='MedLoP';