drop table if exists cohorts.april2016_base_mail;
drop table if exists cohorts.april2016_cons_base_mail;
drop table if exists cohorts.april2016_cons_gotv_mail;
drop table if exists cohorts.april2016_gotv_mail;
drop table if exists cohorts.april2016_high_p_mail;
drop table if exists cohorts.april2016_low_p_mail;
drop table if exists cohorts.april2016_lpnt_mail;
drop table if exists cohorts.april2016_med_high_p_mail;
drop table if exists cohorts.april2016_med_low_p_mail;

create table cohorts.april2016_base_mail (DWID int primary key
,HOUSEHOLDID1 int
,HOUSEHOLDID2 int
,FIRSTNAME text
,MIDDLENAME text
,LASTNAME text
,NAMESUFFIX text
,AGE int
,GENDER text
,RACE text
,MAILADDRLINE1 text
,MAILADDRLINE2 text
,MAILADDRCITY text
,MAILADDRSTATE text
,MAILADDRZIP text
,MAILADDRZIP4 text
,STATE text
,COUNTYNAME text
,SOSCOUNTYCODE int
,TOWNSHIP text
,PRECINCTCODE bigint
,PRECINCTNAME text
,UNIQUEPRECINCTCODE bigint
,WARD text
,CONGRESSIONALDISTRICT int
,STATEHOUSEDISTRICT int
,STATESENATEDISTRICT int
,MUNICIPALDISTRICT text
,COUNTYCOMMISSION text
,SCHOOLBOARD text
,JUDICIALDISTRICT text
,PRECINCTSPLIT text
,CITYCOUNCIL text
,COUNTYLEGISLATIVE int
,SCHOOLDISTRICT text
,SUPERVISORDISTRICT int
,DISTRICT1 text
,DISTRICT2 text
,DISTRICT3 text
,DISTRICT4 text
,DISTRICT5 text
,DISTRICT6 text
,DISTRICT7 text
,DISTRICT8 text
,DISTRICT9 text
,DISTRICT10 text
,DISTRICT11 text
,DISTRICT12 text
,DISTRICT13 text
,DISTRICT14 text
,DISTRICT15 text);

create table cohorts.april2016_cons_base_mail as select * from cohorts.april2016_base_mail limit 0;
create table cohorts.april2016_cons_gotv_mail as select * from cohorts.april2016_base_mail limit 0;
create table cohorts.april2016_gotv_mail as select * from cohorts.april2016_base_mail limit 0;
create table cohorts.april2016_high_p_mail as select * from cohorts.april2016_base_mail limit 0;
create table cohorts.april2016_low_p_mail as select * from cohorts.april2016_base_mail limit 0;
create table cohorts.april2016_lpnt_mail as select * from cohorts.april2016_base_mail limit 0;
create table cohorts.april2016_med_high_p_mail as select * from cohorts.april2016_base_mail limit 0;
create table cohorts.april2016_med_low_p_mail as select * from cohorts.april2016_base_mail limit 0;

COPY cohorts.april2016_base_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_Base_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_cons_base_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_Cons_Base_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_cons_gotv_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_Cons_GOTV_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_gotv_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_GOTV_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_high_p_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_High-P_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_low_p_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_Low-P_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_lpnt_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_LPNT_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_med_high_p_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_Med-High-P_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';
COPY cohorts.april2016_med_low_p_mail FROM '/Users/Garrett/Desktop/2016-04-11 Cohorts/41116_Med-Low-P_MAIL.txt' WITH CSV HEADER DELIMITER AS '	';