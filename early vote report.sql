@stop on error;
drop table if exists early_voters.districts;
create table early_voters.districts (district text);
	insert into early_voters.districts values ('Statewide');
	insert into early_voters.districts values ('CD-03');
	insert into early_voters.districts values ('CD-06');
	insert into early_voters.districts values ('SD-08');
	insert into early_voters.districts values ('SD-14');
	insert into early_voters.districts values ('SD-19');
	insert into early_voters.districts values ('SD-25');
	insert into early_voters.districts values ('SD-26');
	insert into early_voters.districts values ('SD-27');
	insert into early_voters.districts values ('SD-28');
	insert into early_voters.districts values ('SD-35');
	insert into early_voters.districts values ('HD-03');
	insert into early_voters.districts values ('HD-17');
	insert into early_voters.districts values ('HD-18');
	insert into early_voters.districts values ('HD-23');
	insert into early_voters.districts values ('HD-25');
	insert into early_voters.districts values ('HD-27');
	insert into early_voters.districts values ('HD-28');
	insert into early_voters.districts values ('HD-29');
	insert into early_voters.districts values ('HD-30');
	insert into early_voters.districts values ('HD-31');
	insert into early_voters.districts values ('HD-33');
	insert into early_voters.districts values ('HD-34');
	insert into early_voters.districts values ('HD-36');
	insert into early_voters.districts values ('HD-37');
	insert into early_voters.districts values ('HD-40');
	insert into early_voters.districts values ('HD-47');
	insert into early_voters.districts values ('HD-50');
	insert into early_voters.districts values ('HD-51');	
	insert into early_voters.districts values ('HD-59');
	insert into early_voters.districts values ('Adams County');
	insert into early_voters.districts values ('Arapahoe County');
	insert into early_voters.districts values ('Broomfield County');
	insert into early_voters.districts values ('Boulder County');
	insert into early_voters.districts values ('Denver County');
	insert into early_voters.districts values ('Douglas County');
	insert into early_voters.districts values ('El Paso County');
	insert into early_voters.districts values ('Garfield County');
	insert into early_voters.districts values ('Jefferson County');
	insert into early_voters.districts values ('La Plata County');
	insert into early_voters.districts values ('Larimer County');
	insert into early_voters.districts values ('Mesa County');
	insert into early_voters.districts values ('Pueblo County');
	insert into early_voters.districts values ('Weld County');
	insert into early_voters.districts values ('Statewide');

drop table if exists early_voters.ce18_2016;
create table early_voters.ce18_2016 (jurisdiction varchar
	,voter_id integer 
	,last_name varchar
	,first_name varchar
	,middle_name varchar
	,name_suffix varchar
	,party varchar
	,residential_address varchar
	,precinct numeric
	,uocava varchar
	,uocava_type varchar
	,received date
	,election_name text
);


copy early_voters.ce18_2016
	from '/Users/Garrett/Desktop/CE-018_MailBallotsReturned_08Nov_600010433_20161111_091001.txt'
	with csv header delimiter as ',' encoding 'windows-1251'
;

drop table if exists early_voters.ce19_2016;
create table early_voters.ce19_2016 (jurisdiction varchar
	,voter_id integer
	,last_name varchar
	,first_name varchar
	,middle_name varchar
	,name_suffix varchar
	,party varchar
	,residential_address varchar
	,precinct numeric
	,uocava varchar
	,uocava_type varchar
	,in_person_vote_method varchar
	,vspc_location varchar
	,vote_date date
	,election_name text
);

copy early_voters.ce19_2016
	from '/Users/Garrett/Desktop/CE-019_InPersonVoting_08Nov_600010433_20161111_092501.txt'
	with csv header delimiter as ',' encoding 'windows-1251'
;



--Get voted count
select count(*) from (
	select distinct voter_id, party from early_voters.ce18_2016
	union all
	select distinct voter_id, party from early_voters.ce19_2016
) a
;

--Get party breakdown
select party, count(*) from (
	select distinct voter_id, party from early_voters.ce18_2016
	union all
	select distinct voter_id, party from early_voters.ce19_2016
) a
group by 1 order by 1
;

--Check for double voters
select * from early_voters.ce18_2016 a
join early_voters.ce19_2016 c using (voter_id);

select * from early_voters.ce19_2016 a
join early_voters.ce18_2016 c using (voter_id);

--for VAN
	@export on;
	@export set filename="/Users/Garrett/Desktop/mail.txt" CsvRowDelimiter=\r\n;
		select distinct voter_id, received from early_voters.ce18_2016;
	@export set filename="/Users/Garrett/Desktop/in-person.txt" CsvRowDelimiter=\r\n;
		select distinct voter_id, vote_date from early_voters.ce19_2016;

--Applicant Match
	@export set filename="/Users/Garrett/Desktop/match_mail.txt" CsvRowDelimiter=\r\n;
	select distinct vanid, received from early_voters.ce18_2016 a
		join early_voters.matched b using (voter_id);
	@export set filename="/Users/Garrett/Desktop/match_inperson.txt" CsvRowDelimiter=\r\n;
	select distinct vanid, vote_date from early_voters.ce19_2016 a
		join early_voters.matched b using (voter_id);

--GRU data exclusion
	@export set filename="/Users/Garrett/dropbox/America Votes/GRU Data Pipeline/early vote exclusions/ev exclusion ${dbvis-timestamp||||||format=[yyyy-MM-dd hh.mm.ss]}$.csv" CsvColumnDelimiter=",";
		select vanid, sd, hd from (select voter_id from early_voters.ce18_2016 union all select voter_id from early_voters.ce19_2016) a
		join (select distinct vanid, statefileid as voter_id, sd, hd from voterfiles_van.octobermid2016) b using (voter_id) group by 1,2,3;

--VANID data exclusion and address
	@export set filename="/Users/Garrett/dropbox/America Votes/AVEV VANID Address Data/ev exclusion ${dbvis-timestamp||||||format=[yyyy-MM-dd hh.mm.ss]}$.csv" CsvColumnDelimiter=",";
		select distinct vanid, address, city, state, zip5, zip4, email, homephone, cellphone
		from (select voter_id from early_voters.ce18_2016 union all select voter_id from early_voters.ce19_2016) a
		join (select distinct vanid, statefileid as voter_id, vaddress as address, vcity as city
		      ,vstate as state, vzip5 as zip5, vzip4 as zip4, preferredemail as email, homephone, cellphone 
		      from voterfiles_van.octobermid2016) b using (voter_id);

--VANID Exclusion
	@export set filename="/Users/Garrett/dropbox/America Votes/AVEV VANID Data/ev exclusion ${dbvis-timestamp||||||format=[yyyy-MM-dd hh.mm.ss]}$.csv" CsvColumnDelimiter=",";
		select distinct vanid
		from (select voter_id from early_voters.ce18_2016 union all select voter_id from early_voters.ce19_2016) a
		join (select distinct vanid, statefileid as voter_id 
		      from voterfiles_van.octobermid2016
		) b using (voter_id);

--Voter_ID Exclusion
	@export set filename="/Users/Garrett/desktop/voter_id ev exclusion ${dbvis-timestamp||||||format=[yyyy-MM-dd hh.mm.ss]}$.csv" CsvColumnDelimiter=",";
		select distinct voter_id
		from (select voter_id from early_voters.ce18_2016 union all select voter_id from early_voters.ce19_2016) a
		join voterfiles_sos.november2016 b using (voter_id)
		left join (select statefileid as voter_id from voterfiles_van.octobermid2016) c using (voter_id)
		where c.voter_id is null;

--To Partners
	@export set filename="/Users/Garrett/dropbox/America Votes/AVEV Data/AVEV Mail ${dbvis-timestamp||||||format=[yyyy-MM-dd hh.mm.ss]}$.txt";
		select distinct voter_id, received, precinct from early_voters.ce18_2016;
	@export set filename="/Users/Garrett/dropbox/America Votes/AVEV Data/AVEV In Person ${dbvis-timestamp||||||format=[yyyy-MM-dd hh.mm.ss]}$.txt";
		select distinct voter_id, vote_date, precinct from early_voters.ce19_2016;
@export off;


--SD
drop table if exists early_voters.report;
create table early_voters.report as 
select a.district
,count(distinct voter_id) as ballots_returned
,count(distinct case when cohorts_20160914='Base' then voter_id else null end) as cohort_base
,count(distinct case when cohorts_20160914='GOTV' then voter_id else null end) as cohort_gotv
,count(distinct case when cohorts_20160914 in ('HiP','MedHiP','MedLoP','LoP') then voter_id else null end) as cohort_persuasion
,count(distinct case when cohorts_20160914 in ('ConsBase','ConsGOTV') then voter_id else null end) as cohort_conservative
,count(distinct case when cohorts_20160914 = 'LPNT' then voter_id else null end) as cohort_lpnt
,count(distinct case when party = 'Democratic' then voter_id else null end) as dem
,count(distinct case when party = 'Unaffiliated' then voter_id else null end) as uaf
,count(distinct case when party = 'Republican' then voter_id else null end) as gop
,count(distinct case when party not in ('Democratic','Republican','Unaffiliated') then voter_id else null end) as third
,count(distinct case when datereg >='2014-12-01' then voter_id else null end) as new_reg
,count(distinct case when datereg >='2016-10-01' then voter_id else null end) as oct_reg
,count(distinct case when reg_status = 'Inactive' then voter_id else null end) as inactive_vote
,count(distinct case when nam = 'African American' then voter_id else null end) as afam
,count(distinct case when nam = 'Latino' then voter_id else null end) as latino
,count(distinct case when nam = 'Asian' then voter_id else null end) as api
,count(distinct case when nam = 'Youth 18-34' then voter_id else null end) as youth
,count(distinct case when nam = 'Single Women' then voter_id else null end) as single_women
,count(distinct case when nam = 'White Other' then voter_id else null end) as white_other
,count(distinct case when nam is null then voter_id else null end) as nam_unknown
,count(distinct case when vanid is not null then voter_id else null end) as gotv
,count(distinct case when vote_date < '2016-10-17' then voter_id else null end) as pre_oct17
,count(distinct case when vote_date = '2016-10-17' then voter_id else null end) as Oct17
,count(distinct case when vote_date = '2016-10-18' then voter_id else null end) as Oct18
,count(distinct case when vote_date = '2016-10-19' then voter_id else null end) as Oct19
,count(distinct case when vote_date = '2016-10-20' then voter_id else null end) as Oct20
,count(distinct case when vote_date = '2016-10-21' then voter_id else null end) as Oct21
,count(distinct case when vote_date = '2016-10-22' then voter_id else null end) as Oct22
,count(distinct case when vote_date = '2016-10-23' then voter_id else null end) as Oct23
,count(distinct case when vote_date = '2016-10-24' then voter_id else null end) as Oct24
,count(distinct case when vote_date = '2016-10-25' then voter_id else null end) as Oct25
,count(distinct case when vote_date = '2016-10-26' then voter_id else null end) as Oct26
,count(distinct case when vote_date = '2016-10-27' then voter_id else null end) as Oct27
,count(distinct case when vote_date = '2016-10-28' then voter_id else null end) as Oct28
,count(distinct case when vote_date = '2016-10-29' then voter_id else null end) as Oct29
,count(distinct case when vote_date = '2016-10-30' then voter_id else null end) as Oct30
,count(distinct case when vote_date = '2016-10-31' then voter_id else null end) as Oct31
,count(distinct case when vote_date = '2016-11-01' then voter_id else null end) as Nov01
,count(distinct case when vote_date = '2016-11-02' then voter_id else null end) as Nov02
,count(distinct case when vote_date = '2016-11-03' then voter_id else null end) as Nov03
,count(distinct case when vote_date = '2016-11-04' then voter_id else null end) as Nov04
,count(distinct case when vote_date = '2016-11-05' then voter_id else null end) as Nov05
,count(distinct case when vote_date = '2016-11-06' then voter_id else null end) as Nov06
,count(distinct case when vote_date = '2016-11-07' then voter_id else null end) as Nov07
,count(distinct case when vote_date = '2016-11-08' then voter_id else null end) as Nov08
from (
        select distinct district
        ,voter_id
        ,b.party
        ,b.vote_date
        ,c.cohorts_20160914
        ,case when c.datereg is null then '2016-11-01' else c.datereg end as datereg
        ,c.reg_status
        ,d.vanid
        ,c.nam
        from early_voters.districts a
		left join (
			select 'SD-'||substring(a.precinct::text,2,2) as district
            ,voter_id
            ,a.party
            ,vote_date
            ,status as reg_status
            from (
                select distinct voter_id, received as vote_date, party, precinct from early_voters.ce18_2016 
                union all
                select distinct voter_id, vote_date, party, precinct from early_voters.ce19_2016
            ) a 
            left join voterfiles_sos.november2016 b using (voter_id)
        ) b using (district)
        left join voterfiles_van.octobermid2016 c on b.voter_id = c.statefileid
        left join early_voters.gotv2016 d on b.voter_id = d.statefileid
		where left(a.district,2)='SD'
) a
group by 1
order by 1
;

--HD
insert into early_voters.report
select a.district
,count(distinct voter_id) as ballots_returned
,count(distinct case when cohorts_20160914='Base' then voter_id else null end) as cohort_base
,count(distinct case when cohorts_20160914='GOTV' then voter_id else null end) as cohort_gotv
,count(distinct case when cohorts_20160914 in ('HiP','MedHiP','MedLoP','LoP') then voter_id else null end) as cohort_persuasion
,count(distinct case when cohorts_20160914 in ('ConsBase','ConsGOTV') then voter_id else null end) as cohort_conservative
,count(distinct case when cohorts_20160914 = 'LPNT' then voter_id else null end) as cohort_lpnt
,count(distinct case when party = 'Democratic' then voter_id else null end) as dem
,count(distinct case when party = 'Unaffiliated' then voter_id else null end) as uaf
,count(distinct case when party = 'Republican' then voter_id else null end) as gop
,count(distinct case when party not in ('Democratic','Republican','Unaffiliated') then voter_id else null end) as third
,count(distinct case when datereg >='2014-12-01' then voter_id else null end) as new_reg
,count(distinct case when datereg >='2016-10-01' then voter_id else null end) as oct_reg
,count(distinct case when reg_status = 'Inactive' then voter_id else null end) as inactive_vote
,count(distinct case when nam = 'African American' then voter_id else null end) as afam
,count(distinct case when nam = 'Latino' then voter_id else null end) as latino
,count(distinct case when nam = 'Asian' then voter_id else null end) as api
,count(distinct case when nam = 'Youth 18-34' then voter_id else null end) as youth
,count(distinct case when nam = 'Single Women' then voter_id else null end) as single_women
,count(distinct case when nam = 'White Other' then voter_id else null end) as white_other
,count(distinct case when nam is null then voter_id else null end) as nam_unknown
,count(distinct case when vanid is not null then voter_id else null end) as gotv
,count(distinct case when vote_date < '2016-10-17' then voter_id else null end) as pre_oct17
,count(distinct case when vote_date = '2016-10-17' then voter_id else null end) as Oct17
,count(distinct case when vote_date = '2016-10-18' then voter_id else null end) as Oct18
,count(distinct case when vote_date = '2016-10-19' then voter_id else null end) as Oct19
,count(distinct case when vote_date = '2016-10-20' then voter_id else null end) as Oct20
,count(distinct case when vote_date = '2016-10-21' then voter_id else null end) as Oct21
,count(distinct case when vote_date = '2016-10-22' then voter_id else null end) as Oct22
,count(distinct case when vote_date = '2016-10-23' then voter_id else null end) as Oct23
,count(distinct case when vote_date = '2016-10-24' then voter_id else null end) as Oct24
,count(distinct case when vote_date = '2016-10-25' then voter_id else null end) as Oct25
,count(distinct case when vote_date = '2016-10-26' then voter_id else null end) as Oct26
,count(distinct case when vote_date = '2016-10-27' then voter_id else null end) as Oct27
,count(distinct case when vote_date = '2016-10-28' then voter_id else null end) as Oct28
,count(distinct case when vote_date = '2016-10-29' then voter_id else null end) as Oct29
,count(distinct case when vote_date = '2016-10-30' then voter_id else null end) as Oct30
,count(distinct case when vote_date = '2016-10-31' then voter_id else null end) as Oct31
,count(distinct case when vote_date = '2016-11-01' then voter_id else null end) as Nov01
,count(distinct case when vote_date = '2016-11-02' then voter_id else null end) as Nov02
,count(distinct case when vote_date = '2016-11-03' then voter_id else null end) as Nov03
,count(distinct case when vote_date = '2016-11-04' then voter_id else null end) as Nov04
,count(distinct case when vote_date = '2016-11-05' then voter_id else null end) as Nov05
,count(distinct case when vote_date = '2016-11-06' then voter_id else null end) as Nov06
,count(distinct case when vote_date = '2016-11-07' then voter_id else null end) as Nov07
,count(distinct case when vote_date = '2016-11-08' then voter_id else null end) as Nov08
from (
        select distinct district
        ,voter_id
        ,b.party
        ,b.vote_date
        ,c.cohorts_20160914
        ,case when c.datereg is null then '2016-11-01' else c.datereg end as datereg
        ,c.reg_status
        ,d.vanid
        ,c.nam
        from early_voters.districts a
        left join (
			select 'HD-'||substring(a.precinct::text,4,2) as district
            ,voter_id
            ,a.party
            ,vote_date
            ,status as reg_status
            from (
                select distinct voter_id, received as vote_date, party, precinct from early_voters.ce18_2016 
                union all
                select distinct voter_id, vote_date, party, precinct from early_voters.ce19_2016
            ) a 
            left join voterfiles_sos.november2016 b using (voter_id)
        ) b using (district)
        left join voterfiles_van.octobermid2016 c on b.voter_id = c.statefileid
        left join early_voters.gotv2016 d on b.voter_id = d.statefileid
		where left(a.district,2)='HD'
) a
group by 1
order by 1
;

--CD
insert into early_voters.report
select a.district
,count(distinct voter_id) as ballots_returned
,count(distinct case when cohorts_20160914='Base' then voter_id else null end) as cohort_base
,count(distinct case when cohorts_20160914='GOTV' then voter_id else null end) as cohort_gotv
,count(distinct case when cohorts_20160914 in ('HiP','MedHiP','MedLoP','LoP') then voter_id else null end) as cohort_persuasion
,count(distinct case when cohorts_20160914 in ('ConsBase','ConsGOTV') then voter_id else null end) as cohort_conservative
,count(distinct case when cohorts_20160914 = 'LPNT' then voter_id else null end) as cohort_lpnt
,count(distinct case when party = 'Democratic' then voter_id else null end) as dem
,count(distinct case when party = 'Unaffiliated' then voter_id else null end) as uaf
,count(distinct case when party = 'Republican' then voter_id else null end) as gop
,count(distinct case when party not in ('Democratic','Republican','Unaffiliated') then voter_id else null end) as third
,count(distinct case when datereg >='2014-12-01' then voter_id else null end) as new_reg
,count(distinct case when datereg >='2016-10-01' then voter_id else null end) as oct_reg
,count(distinct case when reg_status = 'Inactive' then voter_id else null end) as inactive_vote
,count(distinct case when nam = 'African American' then voter_id else null end) as afam
,count(distinct case when nam = 'Latino' then voter_id else null end) as latino
,count(distinct case when nam = 'Asian' then voter_id else null end) as api
,count(distinct case when nam = 'Youth 18-34' then voter_id else null end) as youth
,count(distinct case when nam = 'Single Women' then voter_id else null end) as single_women
,count(distinct case when nam = 'White Other' then voter_id else null end) as white_other
,count(distinct case when nam is null then voter_id else null end) as nam_unknown
,count(distinct case when vanid is not null then voter_id else null end) as gotv
,count(distinct case when vote_date < '2016-10-17' then voter_id else null end) as pre_oct17
,count(distinct case when vote_date = '2016-10-17' then voter_id else null end) as Oct17
,count(distinct case when vote_date = '2016-10-18' then voter_id else null end) as Oct18
,count(distinct case when vote_date = '2016-10-19' then voter_id else null end) as Oct19
,count(distinct case when vote_date = '2016-10-20' then voter_id else null end) as Oct20
,count(distinct case when vote_date = '2016-10-21' then voter_id else null end) as Oct21
,count(distinct case when vote_date = '2016-10-22' then voter_id else null end) as Oct22
,count(distinct case when vote_date = '2016-10-23' then voter_id else null end) as Oct23
,count(distinct case when vote_date = '2016-10-24' then voter_id else null end) as Oct24
,count(distinct case when vote_date = '2016-10-25' then voter_id else null end) as Oct25
,count(distinct case when vote_date = '2016-10-26' then voter_id else null end) as Oct26
,count(distinct case when vote_date = '2016-10-27' then voter_id else null end) as Oct27
,count(distinct case when vote_date = '2016-10-28' then voter_id else null end) as Oct28
,count(distinct case when vote_date = '2016-10-29' then voter_id else null end) as Oct29
,count(distinct case when vote_date = '2016-10-30' then voter_id else null end) as Oct30
,count(distinct case when vote_date = '2016-10-31' then voter_id else null end) as Oct31
,count(distinct case when vote_date = '2016-11-01' then voter_id else null end) as Nov01
,count(distinct case when vote_date = '2016-11-02' then voter_id else null end) as Nov02
,count(distinct case when vote_date = '2016-11-03' then voter_id else null end) as Nov03
,count(distinct case when vote_date = '2016-11-04' then voter_id else null end) as Nov04
,count(distinct case when vote_date = '2016-11-05' then voter_id else null end) as Nov05
,count(distinct case when vote_date = '2016-11-06' then voter_id else null end) as Nov06
,count(distinct case when vote_date = '2016-11-07' then voter_id else null end) as Nov07
,count(distinct case when vote_date = '2016-11-08' then voter_id else null end) as Nov08
from (
        select distinct district
        ,voter_id
        ,b.party
        ,b.vote_date
        ,c.cohorts_20160914
        ,case when c.datereg is null then '2016-11-01' else c.datereg end as datereg
        ,c.reg_status
        ,d.vanid
        ,c.nam
        from early_voters.districts a
		left join (
			select 'CD-'||lpad(substring(a.precinct::text,1,1),2,'0') as district
            ,voter_id
            ,a.party
            ,vote_date
            ,status as reg_status
            from (
                select distinct voter_id, received as vote_date, party, precinct from early_voters.ce18_2016 
                union all
                select distinct voter_id, vote_date, party, precinct from early_voters.ce19_2016
            ) a 
            left join voterfiles_sos.november2016 b using (voter_id)
        ) b using (district)
        left join voterfiles_van.octobermid2016 c on b.voter_id = c.statefileid
        left join early_voters.gotv2016 d on b.voter_id = d.statefileid
		where left(a.district,2)='CD'
) a
group by 1
order by 1
;

--Counties
insert into early_voters.report
select a.district
,count(distinct voter_id) as ballots_returned
,count(distinct case when cohorts_20160914='Base' then voter_id else null end) as cohort_base
,count(distinct case when cohorts_20160914='GOTV' then voter_id else null end) as cohort_gotv
,count(distinct case when cohorts_20160914 in ('HiP','MedHiP','MedLoP','LoP') then voter_id else null end) as cohort_persuasion
,count(distinct case when cohorts_20160914 in ('ConsBase','ConsGOTV') then voter_id else null end) as cohort_conservative
,count(distinct case when cohorts_20160914 = 'LPNT' then voter_id else null end) as cohort_lpnt
,count(distinct case when party = 'Democratic' then voter_id else null end) as dem
,count(distinct case when party = 'Unaffiliated' then voter_id else null end) as uaf
,count(distinct case when party = 'Republican' then voter_id else null end) as gop
,count(distinct case when party not in ('Democratic','Republican','Unaffiliated') then voter_id else null end) as third
,count(distinct case when datereg >='2014-12-01' then voter_id else null end) as new_reg
,count(distinct case when datereg >='2016-10-01' then voter_id else null end) as oct_reg
,count(distinct case when reg_status = 'Inactive' then voter_id else null end) as inactive_vote
,count(distinct case when nam = 'African American' then voter_id else null end) as afam
,count(distinct case when nam = 'Latino' then voter_id else null end) as latino
,count(distinct case when nam = 'Asian' then voter_id else null end) as api
,count(distinct case when nam = 'Youth 18-34' then voter_id else null end) as youth
,count(distinct case when nam = 'Single Women' then voter_id else null end) as single_women
,count(distinct case when nam = 'White Other' then voter_id else null end) as white_other
,count(distinct case when nam is null then voter_id else null end) as nam_unknown
,count(distinct case when vanid is not null then voter_id else null end) as gotv
,count(distinct case when vote_date < '2016-10-17' then voter_id else null end) as pre_oct17
,count(distinct case when vote_date = '2016-10-17' then voter_id else null end) as Oct17
,count(distinct case when vote_date = '2016-10-18' then voter_id else null end) as Oct18
,count(distinct case when vote_date = '2016-10-19' then voter_id else null end) as Oct19
,count(distinct case when vote_date = '2016-10-20' then voter_id else null end) as Oct20
,count(distinct case when vote_date = '2016-10-21' then voter_id else null end) as Oct21
,count(distinct case when vote_date = '2016-10-22' then voter_id else null end) as Oct22
,count(distinct case when vote_date = '2016-10-23' then voter_id else null end) as Oct23
,count(distinct case when vote_date = '2016-10-24' then voter_id else null end) as Oct24
,count(distinct case when vote_date = '2016-10-25' then voter_id else null end) as Oct25
,count(distinct case when vote_date = '2016-10-26' then voter_id else null end) as Oct26
,count(distinct case when vote_date = '2016-10-27' then voter_id else null end) as Oct27
,count(distinct case when vote_date = '2016-10-28' then voter_id else null end) as Oct28
,count(distinct case when vote_date = '2016-10-29' then voter_id else null end) as Oct29
,count(distinct case when vote_date = '2016-10-30' then voter_id else null end) as Oct30
,count(distinct case when vote_date = '2016-10-31' then voter_id else null end) as Oct31
,count(distinct case when vote_date = '2016-11-01' then voter_id else null end) as Nov01
,count(distinct case when vote_date = '2016-11-02' then voter_id else null end) as Nov02
,count(distinct case when vote_date = '2016-11-03' then voter_id else null end) as Nov03
,count(distinct case when vote_date = '2016-11-04' then voter_id else null end) as Nov04
,count(distinct case when vote_date = '2016-11-05' then voter_id else null end) as Nov05
,count(distinct case when vote_date = '2016-11-06' then voter_id else null end) as Nov06
,count(distinct case when vote_date = '2016-11-07' then voter_id else null end) as Nov07
,count(distinct case when vote_date = '2016-11-08' then voter_id else null end) as Nov08
from (
        select distinct district
        ,voter_id
        ,b.party
        ,b.vote_date
        ,c.cohorts_20160914
        ,case when c.datereg is null then '2016-11-01' else c.datereg end as datereg
        ,c.reg_status
        ,d.vanid
        ,c.nam
        from early_voters.districts a
        left join (
			select jurisdiction||' County' as district
            ,voter_id
            ,a.party
            ,vote_date
            ,status as reg_status
            from (
                select distinct voter_id, received as vote_date, party, jurisdiction from early_voters.ce18_2016 
                union all
                select distinct voter_id, vote_date, party, jurisdiction from early_voters.ce19_2016
            ) a 
            left join voterfiles_sos.november2016 b using (voter_id)
        ) b using (district)
        left join voterfiles_van.octobermid2016 c on b.voter_id = c.statefileid
        left join early_voters.gotv2016 d on b.voter_id = d.statefileid
		where right(a.district,6)='County'
) a
group by 1
order by 1
;

--Statewide
insert into early_voters.report
select a.district
,count(distinct voter_id) as ballots_returned
,count(distinct case when cohorts_20160914='Base' then voter_id else null end) as cohort_base
,count(distinct case when cohorts_20160914='GOTV' then voter_id else null end) as cohort_gotv
,count(distinct case when cohorts_20160914 in ('HiP','MedHiP','MedLoP','LoP') then voter_id else null end) as cohort_persuasion
,count(distinct case when cohorts_20160914 in ('ConsBase','ConsGOTV') then voter_id else null end) as cohort_conservative
,count(distinct case when cohorts_20160914 = 'LPNT' then voter_id else null end) as cohort_lpnt
,count(distinct case when party = 'Democratic' then voter_id else null end) as dem
,count(distinct case when party = 'Unaffiliated' then voter_id else null end) as uaf
,count(distinct case when party = 'Republican' then voter_id else null end) as gop
,count(distinct case when party not in ('Democratic','Republican','Unaffiliated') then voter_id else null end) as third
,count(distinct case when datereg >='2014-12-01' then voter_id else null end) as new_reg
,count(distinct case when datereg >='2016-10-01' then voter_id else null end) as oct_reg
,count(distinct case when reg_status = 'Inactive' then voter_id else null end) as inactive_vote
,count(distinct case when nam = 'African American' then voter_id else null end) as afam
,count(distinct case when nam = 'Latino' then voter_id else null end) as latino
,count(distinct case when nam = 'Asian' then voter_id else null end) as api
,count(distinct case when nam = 'Youth 18-34' then voter_id else null end) as youth
,count(distinct case when nam = 'Single Women' then voter_id else null end) as single_women
,count(distinct case when nam = 'White Other' then voter_id else null end) as white_other
,count(distinct case when nam is null then voter_id else null end) as nam_unknown
,count(distinct case when vanid is not null then voter_id else null end) as gotv
,count(distinct case when vote_date < '2016-10-17' then voter_id else null end) as pre_oct17
,count(distinct case when vote_date = '2016-10-17' then voter_id else null end) as Oct17
,count(distinct case when vote_date = '2016-10-18' then voter_id else null end) as Oct18
,count(distinct case when vote_date = '2016-10-19' then voter_id else null end) as Oct19
,count(distinct case when vote_date = '2016-10-20' then voter_id else null end) as Oct20
,count(distinct case when vote_date = '2016-10-21' then voter_id else null end) as Oct21
,count(distinct case when vote_date = '2016-10-22' then voter_id else null end) as Oct22
,count(distinct case when vote_date = '2016-10-23' then voter_id else null end) as Oct23
,count(distinct case when vote_date = '2016-10-24' then voter_id else null end) as Oct24
,count(distinct case when vote_date = '2016-10-25' then voter_id else null end) as Oct25
,count(distinct case when vote_date = '2016-10-26' then voter_id else null end) as Oct26
,count(distinct case when vote_date = '2016-10-27' then voter_id else null end) as Oct27
,count(distinct case when vote_date = '2016-10-28' then voter_id else null end) as Oct28
,count(distinct case when vote_date = '2016-10-29' then voter_id else null end) as Oct29
,count(distinct case when vote_date = '2016-10-30' then voter_id else null end) as Oct30
,count(distinct case when vote_date = '2016-10-31' then voter_id else null end) as Oct31
,count(distinct case when vote_date = '2016-11-01' then voter_id else null end) as Nov01
,count(distinct case when vote_date = '2016-11-02' then voter_id else null end) as Nov02
,count(distinct case when vote_date = '2016-11-03' then voter_id else null end) as Nov03
,count(distinct case when vote_date = '2016-11-04' then voter_id else null end) as Nov04
,count(distinct case when vote_date = '2016-11-05' then voter_id else null end) as Nov05
,count(distinct case when vote_date = '2016-11-06' then voter_id else null end) as Nov06
,count(distinct case when vote_date = '2016-11-07' then voter_id else null end) as Nov07
,count(distinct case when vote_date = '2016-11-08' then voter_id else null end) as Nov08
from (
        select distinct district
        ,voter_id
        ,b.party
        ,b.vote_date
        ,c.cohorts_20160914
        ,case when c.datereg is null then '2016-11-01' else c.datereg end as datereg
        ,c.reg_status
        ,d.vanid
        ,c.nam
        from early_voters.districts a
        left join (select 'Statewide'::text as district
                ,voter_id
                ,a.party
                ,vote_date
                ,status as reg_status
                from (
                        select distinct voter_id, received as vote_date, party from early_voters.ce18_2016 
                        union all
                        select distinct voter_id, vote_date, party from early_voters.ce19_2016
                ) a 
                left join voterfiles_sos.november2016 b using (voter_id)
        ) b using (district)
        left join voterfiles_van.octobermid2016 c on b.voter_id = c.statefileid
        left join early_voters.gotv2016 d on b.voter_id = d.statefileid
        where a.district = 'Statewide'
) a
group by 1
order by 1
;

@export on;
@export set filename="/Users/Garrett/desktop/ev report.csv" CsvColumnDelimiter=",";
select * from early_voters.report;

@export set filename="/Users/Garrett/desktop/ev report coverpage.csv" CsvColumnDelimiter=",";
select vote_date
,count(case when party = 'Democratic' then voter_id else null end) as dem
,count(case when party = 'Republican' then voter_id else null end) as gop
,count(case when party not in ('Democratic','Republican') then voter_id else null end) as uaf_third
from (
	select distinct voter_id, received as vote_date, party from early_voters.ce18_2016
	union all
	select distinct voter_id, vote_date, party from early_voters.ce19_2016
)a
where vote_date >= '2016-10-17'
group by 1
order by 1
;

@export set filename="/Users/Garrett/desktop/ev vote by day.csv" CsvColumnDelimiter=",";
select case when eday_diff>22 then '>22' else eday_diff::text end
,count(case when party = 'Democratic' then voter_id else null end) as dem
,count(case when party = 'Republican' then voter_id else null end) as gop
,count(case when party not in ('Democratic','Republican' ) then voter_id else null end) as uaf
from (
        select max('2016-11-08'-received) as eday_diff, party, voter_id from early_voters.ce18_2016 group by 2,3
        union all
        select max('2016-11-08'-vote_date) as eday_diff, party, voter_id from early_voters.ce19_2016 group by 2,3
) a
group by 1
order by 1 desc
;

--fsa ev report data
@export set filename="/Users/Garrett/dropbox/America Votes/GRU Data Pipeline/early vote report data/ev report ${dbvis-timestamp||||||format=[yyyy-MM-dd hh.mm.ss]}$.csv" CsvColumnDelimiter=",";
	select distinct vanid
	,voter_id
	,cd
	,sd
	,hd
	,county
	,precinct
	,age
	,cohorts_20160914
	from (select voter_id from early_voters.ce18_2016 union all select voter_id from early_voters.ce19_2016) a
	join (
		select distinct vanid, statefileid as voter_id
		,cd
		,sd
		,hd
		,countyname as county
		,vanprecinct as precinct
		,age
		,cohorts_20160914
		from voterfiles_van.octobermid2016
	) b using (voter_id);
