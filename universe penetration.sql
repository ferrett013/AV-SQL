drop table if exists contact_history.district_table;
create table contact_history.district_table (sd text);
insert into contact_history.district_table values ('SD-19');
insert into contact_history.district_table values ('SD-25');
insert into contact_history.district_table values ('SD-26');
insert into contact_history.district_table values ('SD-27');
insert into contact_history.district_table values ('HD-03');
insert into contact_history.district_table values ('HD-17');
insert into contact_history.district_table values ('HD-23');
insert into contact_history.district_table values ('HD-25');
insert into contact_history.district_table values ('HD-28');
insert into contact_history.district_table values ('HD-29');
insert into contact_history.district_table values ('HD-30');
insert into contact_history.district_table values ('HD-31');
insert into contact_history.district_table values ('HD-33');
insert into contact_history.district_table values ('HD-59');
insert into contact_history.district_table values ('Total');

drop table if exists contact_history.v2016;
create table contact_history.v2016 (vanid int
,dwid int
,votername text
,resultshortname text
,createdby text
,canvassedby text
,iscanvasser boolean
,committeename text
,datecreated date
,datecanvassed date
,contacttypename text
,campaignname text
,content text
,inputtypename text
);

copy contact_history.v2016
from '/Users/Garrett/Desktop/import2.txt'
with csv header delimiter as '	'
;

@export on;
@export set filename="/Users/Garrett/Desktop/sd.txt" ShowNullAs="";
select * from contact_history.district_table a
left join (
	select 'SD-'||sd::text as sd
	,sum(case when committeename='SEIU Blue' and cohort = 'P' then contacts else null end) as seiu_persuasion_contacts
	,sum(case when committeename='SEIU Blue' and cohort = 'P' then knocks else null end) as seiu_persuasion_knocks
	,sum(case when committeename='Fair Share Alliance' and cohort = 'P' then contacts else null end) as fsa_persuasion_contacts
	,sum(case when committeename='Fair Share Alliance' and cohort = 'P' then knocks else null end) as fsa_persuasion_knocks
	,sum(case when committeename='2016 LFP' and cohort = 'P' then contacts else null end) as lfp_persuasion_contacts
	,sum(case when committeename='2016 LFP' and cohort = 'P' then knocks else null end) as lfp_persuasion_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'P' then contacts else null end) as clr_persuasion_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'P' then knocks else null end) as clr_persuasion_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'P' then contacts else null end) as other_persuasion_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'P' then knocks else null end) as other_persuasion_knocks

	,sum(case when committeename='SEIU Blue' and cohort = 'G' then contacts else null end) as seiu_gotv_contacts
	,sum(case when committeename='SEIU Blue' and cohort = 'G' then knocks else null end) as seiu_gotv_knocks
	,sum(case when committeename='Fair Share Alliance' and cohort = 'G' then contacts else null end) as fsa_gotv_contacts
	,sum(case when committeename='Fair Share Alliance' and cohort = 'G' then knocks else null end) as fsa_gotv_knocks
	,sum(case when committeename='2016 LFP' and cohort = 'G' then contacts else null end) as lfp_gotv_contacts
	,sum(case when committeename='2016 LFP' and cohort = 'G' then knocks else null end) as lfp_gotv_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'G' then contacts else null end) as clr_gotv_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'G' then knocks else null end) as clr_gotv_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'G' then contacts else null end) as other_gotv_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'G' then knocks else null end) as other_gotv_knocks
	from (
		select sd
		,vanprecinct
		,case when cohorts_20160803 in ('HiP','MedHiP','MedLoP') then 'P' when cohorts_20160914 = 'GOTV' then 'G' else 'O' end as cohort
		,committeename
		,datecanvassed
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		,count(distinct coalesce(vhhid,mhhid)) as knocks
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and sd in (19,25,26,27)
		group by 1,2,3,4,5
	) a
	group by 1
	order by 1
) b using (sd)
left join (
	select 'SD-'||sd::text as sd
	,sum(case when committeename='SEIU Blue' then contacts else null end) as seiu_contacts
	,sum(case when committeename='SEIU Blue' then knocks else null end) as seiu_knocks
	,sum(case when committeename='Fair Share Alliance' then contacts else null end) as fsa_contacts
	,sum(case when committeename='Fair Share Alliance' then knocks else null end) as fsa_knocks
	,sum(case when committeename='2016 LFP' then contacts else null end) as lfp_contacts
	,sum(case when committeename='2016 LFP' then knocks else null end) as lfp_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' then contacts else null end) as clr_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' then knocks else null end) as clr_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') then contacts else null end) as other_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') then knocks else null end) as other_knocks

	from (
		select sd
		,committeename
		,datecanvassed
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		,count(distinct vhhid) as knocks
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and sd in (19,25,26,27)
		group by 1,2,3
	) a
	group by 1
	order by 1
) c using (sd)
left join (
	select 'SD-'||sd::text as sd
	,sum(contacts) as total_contacts
	,count(case when contacts = 1 then vanid else null end) as one_contacts
	,count(case when contacts = 2 then vanid else null end) as two_contacts
	,count(case when contacts = 3 then vanid else null end) as three_contacts
	,count(case when contacts = 4 then vanid else null end) as four_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_contacts
	from (
		select sd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and sd in (19,25,26,27)
		group by 1,2
	) a
	group by 1
	order by 1
) d using (sd)
left join (
	select 'SD-'||sd::text as sd
	,sum(contacts) as total_p_contacts
	,count(case when contacts = 1 then vanid else null end) as one_p_contacts
	,count(case when contacts = 2 then vanid else null end) as two_p_contacts
	,count(case when contacts = 3 then vanid else null end) as three_p_contacts
	,count(case when contacts = 4 then vanid else null end) as four_p_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_p_contacts
	from (
		select sd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and sd in (19,25,26,27) and cohorts_20160803 in ('HiP','MedHiP','MedLoP')
		group by 1,2
	) a
	group by 1
	order by 1
) e using (sd)
left join (
	select 'SD-'||sd::text as sd
	,sum(contacts) as total_g_contacts
	,count(case when contacts = 1 then vanid else null end) as one_g_contacts
	,count(case when contacts = 2 then vanid else null end) as two_g_contacts
	,count(case when contacts = 3 then vanid else null end) as three_g_contacts
	,count(case when contacts = 4 then vanid else null end) as four_g_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_g_contacts
	from (
		select sd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and sd in (19,25,26,27) and cohorts_20160914 = 'GOTV'
		group by 1,2
	) a
	group by 1
	order by 1
) f using (sd)
left join (
	select 'SD-'||sd::text as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_knocks
	,count(case when knocks = 2 then 1 else null end) as two_knocks
	,count(case when knocks = 3 then 1 else null end) as three_knocks
	,count(case when knocks = 4 then 1 else null end) as four_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_knocks
	from (
		select sd
		,vhhid
		,count(*) as knocks
		from (
			select sd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and sd in (19,25,26,27)
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) g using (sd)
left join (
	select 'SD-'||sd::text as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_p_knocks
	,count(case when knocks = 2 then 1 else null end) as two_p_knocks
	,count(case when knocks = 3 then 1 else null end) as three_p_knocks
	,count(case when knocks = 4 then 1 else null end) as four_p_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_p_knocks
	from (
		select sd
		,vhhid
		,count(*) as knocks
		from (
			select sd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and sd in (19,25,26,27) and cohorts_20160803 in ('HiP','MedHiP','MedLoP')
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) h using (sd)
left join (
	select 'SD-'||sd::text as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_g_knocks
	,count(case when knocks = 2 then 1 else null end) as two_g_knocks
	,count(case when knocks = 3 then 1 else null end) as three_g_knocks
	,count(case when knocks = 4 then 1 else null end) as four_g_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_g_knocks
	from (
		select sd
		,vhhid
		,count(*) as knocks
		from (
			select sd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and sd in (19,25,26,27) and cohorts_20160914 = 'GOTV'
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) i using (sd)
left join (
	select 'SD-'||sd::text as sd
	,count(distinct case when resultshortname = 'Canvassed' then vanid else null end) as contacted
	,count(distinct vhhid) as knocked
	,count(distinct case when resultshortname = 'Canvassed' and cohorts_20160803 in ('HiP','MedHiP','MedLoP') then vanid else null end) as p_contacted
	,count(distinct case when cohorts_20160803 in ('HiP','MedHiP','MedLoP') then vhhid else null end) as p_knocked
	,count(distinct case when resultshortname = 'Canvassed' and cohorts_20160914 = 'GOTV' then vanid else null end) as g_contacted
	,count(distinct case when cohorts_20160914 = 'GOTV' then vhhid else null end) as g_knocked
	
	from contact_history.v2016
	join voterfiles_van.septembermid2016 b using (vanid)
	where contacttypename = 'Walk' and sd in (19,25,26,27)
        group by 1
) j using (sd)
;

@export set filename="/Users/Garrett/Desktop/hd.txt" ShowNullAs="";
select * from contact_history.district_table a
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(case when committeename='SEIU Blue' and cohort = 'P' then contacts else null end) as seiu_persuasion_contacts
	,sum(case when committeename='SEIU Blue' and cohort = 'P' then knocks else null end) as seiu_persuasion_knocks
	,sum(case when committeename='Fair Share Alliance' and cohort = 'P' then contacts else null end) as fsa_persuasion_contacts
	,sum(case when committeename='Fair Share Alliance' and cohort = 'P' then knocks else null end) as fsa_persuasion_knocks
	,sum(case when committeename='2016 LFP' and cohort = 'P' then contacts else null end) as lfp_persuasion_contacts
	,sum(case when committeename='2016 LFP' and cohort = 'P' then knocks else null end) as lfp_persuasion_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'P' then contacts else null end) as clr_persuasion_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'P' then knocks else null end) as clr_persuasion_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'P' then contacts else null end) as other_persuasion_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'P' then knocks else null end) as other_persuasion_knocks

	,sum(case when committeename='SEIU Blue' and cohort = 'G' then contacts else null end) as seiu_gotv_contacts
	,sum(case when committeename='SEIU Blue' and cohort = 'G' then knocks else null end) as seiu_gotv_knocks
	,sum(case when committeename='Fair Share Alliance' and cohort = 'G' then contacts else null end) as fsa_gotv_contacts
	,sum(case when committeename='Fair Share Alliance' and cohort = 'G' then knocks else null end) as fsa_gotv_knocks
	,sum(case when committeename='2016 LFP' and cohort = 'G' then contacts else null end) as lfp_gotv_contacts
	,sum(case when committeename='2016 LFP' and cohort = 'G' then knocks else null end) as lfp_gotv_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'G' then contacts else null end) as clr_gotv_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'G' then knocks else null end) as clr_gotv_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'G' then contacts else null end) as other_gotv_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'G' then knocks else null end) as other_gotv_knocks
	from (
		select hd
		,vanprecinct
		,case when cohorts_20160803 in ('HiP','MedHiP','MedLoP') then 'P' when cohorts_20160914 = 'GOTV' then 'G' else 'O' end as cohort
		,committeename
		,datecanvassed
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		,count(distinct coalesce(vhhid,mhhid)) as knocks
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59)
		group by 1,2,3,4,5
	) a
	group by 1
	order by 1
) k using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(case when committeename='SEIU Blue' then contacts else null end) as seiu_contacts
	,sum(case when committeename='SEIU Blue' then knocks else null end) as seiu_knocks
	,sum(case when committeename='Fair Share Alliance' then contacts else null end) as fsa_contacts
	,sum(case when committeename='Fair Share Alliance' then knocks else null end) as fsa_knocks
	,sum(case when committeename='2016 LFP' then contacts else null end) as lfp_contacts
	,sum(case when committeename='2016 LFP' then knocks else null end) as lfp_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' then contacts else null end) as clr_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' then knocks else null end) as clr_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') then contacts else null end) as other_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') then knocks else null end) as other_knocks

	from (
		select hd
		,committeename
		,datecanvassed
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		,count(distinct vhhid) as knocks
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59)
		group by 1,2,3
	) a
	group by 1
	order by 1
) l using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(contacts) as total_contacts
	,count(case when contacts = 1 then vanid else null end) as one_contacts
	,count(case when contacts = 2 then vanid else null end) as two_contacts
	,count(case when contacts = 3 then vanid else null end) as three_contacts
	,count(case when contacts = 4 then vanid else null end) as four_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_contacts
	from (
		select hd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59)
		group by 1,2
	) a
	group by 1
	order by 1
) m using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(contacts) as total_p_contacts
	,count(case when contacts = 1 then vanid else null end) as one_p_contacts
	,count(case when contacts = 2 then vanid else null end) as two_p_contacts
	,count(case when contacts = 3 then vanid else null end) as three_p_contacts
	,count(case when contacts = 4 then vanid else null end) as four_p_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_p_contacts
	from (
		select hd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59) and cohorts_20160803 in ('HiP','MedHiP','MedLoP')
		group by 1,2
	) a
	group by 1
	order by 1
) n using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(contacts) as total_g_contacts
	,count(case when contacts = 1 then vanid else null end) as one_g_contacts
	,count(case when contacts = 2 then vanid else null end) as two_g_contacts
	,count(case when contacts = 3 then vanid else null end) as three_g_contacts
	,count(case when contacts = 4 then vanid else null end) as four_g_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_g_contacts
	from (
		select hd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59) and cohorts_20160914 = 'GOTV'
		group by 1,2
	) a
	group by 1
	order by 1
) o using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_knocks
	,count(case when knocks = 2 then 1 else null end) as two_knocks
	,count(case when knocks = 3 then 1 else null end) as three_knocks
	,count(case when knocks = 4 then 1 else null end) as four_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_knocks
	from (
		select hd
		,vhhid
		,count(*) as knocks
		from (
			select hd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59)
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) p using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_p_knocks
	,count(case when knocks = 2 then 1 else null end) as two_p_knocks
	,count(case when knocks = 3 then 1 else null end) as three_p_knocks
	,count(case when knocks = 4 then 1 else null end) as four_p_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_p_knocks
	from (
		select hd
		,vhhid
		,count(*) as knocks
		from (
			select hd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59) and cohorts_20160803 in ('HiP','MedHiP','MedLoP')
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) q using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_g_knocks
	,count(case when knocks = 2 then 1 else null end) as two_g_knocks
	,count(case when knocks = 3 then 1 else null end) as three_g_knocks
	,count(case when knocks = 4 then 1 else null end) as four_g_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_g_knocks
	from (
		select hd
		,vhhid
		,count(*) as knocks
		from (
			select hd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59) and cohorts_20160914 = 'GOTV'
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) r using (sd)
left join (
	select 'HD-'||LPAD(hd::text, 2, '0') as sd
	,count(distinct case when resultshortname = 'Canvassed' then vanid else null end) as contacted
	,count(distinct vhhid) as knocked
	,count(distinct case when resultshortname = 'Canvassed' and cohorts_20160803 in ('HiP','MedHiP','MedLoP') then vanid else null end) as p_contacted
	,count(distinct case when cohorts_20160803 in ('HiP','MedHiP','MedLoP') then vhhid else null end) as p_knocked
	,count(distinct case when resultshortname = 'Canvassed' and cohorts_20160914 = 'GOTV' then vanid else null end) as g_contacted
	,count(distinct case when cohorts_20160914 = 'GOTV' then vhhid else null end) as g_knocked
	
	from contact_history.v2016
	join voterfiles_van.septembermid2016 b using (vanid)
	where contacttypename = 'Walk' and hd in (3,17,23,25,28,29,30,31,33,59)
        group by 1
) s using (sd)
;

@export set filename="/Users/Garrett/Desktop/total.txt" ShowNullAs="";
select * from contact_history.district_table a
left join (
	select 'Total' as sd
	,sum(case when committeename='SEIU Blue' and cohort = 'P' then contacts else null end) as seiu_persuasion_contacts
	,sum(case when committeename='SEIU Blue' and cohort = 'P' then knocks else null end) as seiu_persuasion_knocks
	,sum(case when committeename='Fair Share Alliance' and cohort = 'P' then contacts else null end) as fsa_persuasion_contacts
	,sum(case when committeename='Fair Share Alliance' and cohort = 'P' then knocks else null end) as fsa_persuasion_knocks
	,sum(case when committeename='2016 LFP' and cohort = 'P' then contacts else null end) as lfp_persuasion_contacts
	,sum(case when committeename='2016 LFP' and cohort = 'P' then knocks else null end) as lfp_persuasion_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'P' then contacts else null end) as clr_persuasion_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'P' then knocks else null end) as clr_persuasion_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'P' then contacts else null end) as other_persuasion_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'P' then knocks else null end) as other_persuasion_knocks

	,sum(case when committeename='SEIU Blue' and cohort = 'G' then contacts else null end) as seiu_gotv_contacts
	,sum(case when committeename='SEIU Blue' and cohort = 'G' then knocks else null end) as seiu_gotv_knocks
	,sum(case when committeename='Fair Share Alliance' and cohort = 'G' then contacts else null end) as fsa_gotv_contacts
	,sum(case when committeename='Fair Share Alliance' and cohort = 'G' then knocks else null end) as fsa_gotv_knocks
	,sum(case when committeename='2016 LFP' and cohort = 'G' then contacts else null end) as lfp_gotv_contacts
	,sum(case when committeename='2016 LFP' and cohort = 'G' then knocks else null end) as lfp_gotv_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'G' then contacts else null end) as clr_gotv_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' and cohort = 'G' then knocks else null end) as clr_gotv_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'G' then contacts else null end) as other_gotv_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') and cohort = 'G' then knocks else null end) as other_gotv_knocks
	from (
		select hd
		,vanprecinct
		,case when cohorts_20160803 in ('HiP','MedHiP','MedLoP') then 'P' when cohorts_20160914 = 'GOTV' then 'G' else 'O' end as cohort
		,committeename
		,datecanvassed
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		,count(distinct coalesce(vhhid,mhhid)) as knocks
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27))
		group by 1,2,3,4,5
	) a
	group by 1
	order by 1
) k using (sd)
left join (
	select 'Total' as sd
	,sum(case when committeename='SEIU Blue' then contacts else null end) as seiu_contacts
	,sum(case when committeename='SEIU Blue' then knocks else null end) as seiu_knocks
	,sum(case when committeename='Fair Share Alliance' then contacts else null end) as fsa_contacts
	,sum(case when committeename='Fair Share Alliance' then knocks else null end) as fsa_knocks
	,sum(case when committeename='2016 LFP' then contacts else null end) as lfp_contacts
	,sum(case when committeename='2016 LFP' then knocks else null end) as lfp_knocks
	,sum(case when committeename='Campaign for Community Change [c4]' then contacts else null end) as clr_contacts
	,sum(case when committeename='Campaign for Community Change [c4]' then knocks else null end) as clr_knocks
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') then contacts else null end) as other_contacts
	,sum(case when committeename not in ('Campaign for Community Change [c4]','SEIU Blue','Fair Share Alliance','2016 LFP') then knocks else null end) as other_knocks

	from (
		select hd
		,committeename
		,datecanvassed
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		,count(distinct vhhid) as knocks
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27))
		group by 1,2,3
	) a
	group by 1
	order by 1
) l using (sd)
left join (
	select 'Total' as sd
	,sum(contacts) as total_contacts
	,count(case when contacts = 1 then vanid else null end) as one_contacts
	,count(case when contacts = 2 then vanid else null end) as two_contacts
	,count(case when contacts = 3 then vanid else null end) as three_contacts
	,count(case when contacts = 4 then vanid else null end) as four_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_contacts
	from (
		select hd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27))
		group by 1,2
	) a
	group by 1
	order by 1
) m using (sd)
left join (
	select 'Total' as sd
	,sum(contacts) as total_p_contacts
	,count(case when contacts = 1 then vanid else null end) as one_p_contacts
	,count(case when contacts = 2 then vanid else null end) as two_p_contacts
	,count(case when contacts = 3 then vanid else null end) as three_p_contacts
	,count(case when contacts = 4 then vanid else null end) as four_p_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_p_contacts
	from (
		select hd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27)) and cohorts_20160803 in ('HiP','MedHiP','MedLoP')
		group by 1,2
	) a
	group by 1
	order by 1
) n using (sd)
left join (
	select 'Total' as sd
	,sum(contacts) as total_g_contacts
	,count(case when contacts = 1 then vanid else null end) as one_g_contacts
	,count(case when contacts = 2 then vanid else null end) as two_g_contacts
	,count(case when contacts = 3 then vanid else null end) as three_g_contacts
	,count(case when contacts = 4 then vanid else null end) as four_g_contacts
	,count(case when contacts = 5 then vanid else null end) as fiveplus_g_contacts
	from (
		select hd
		,vanid
		,count(case when resultshortname = 'Canvassed' then vanid else null end) as contacts
		from contact_history.v2016
		join voterfiles_van.septembermid2016 b using (vanid)
		where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27)) and cohorts_20160914 = 'GOTV'
		group by 1,2
	) a
	group by 1
	order by 1
) o using (sd)
left join (
	select 'Total' as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_knocks
	,count(case when knocks = 2 then 1 else null end) as two_knocks
	,count(case when knocks = 3 then 1 else null end) as three_knocks
	,count(case when knocks = 4 then 1 else null end) as four_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_knocks
	from (
		select hd
		,vhhid
		,count(*) as knocks
		from (
			select hd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27))
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) p using (sd)
left join (
	select 'Total' as sd
	,sum(knocks) as total
	,count(case when knocks = 1 then 1 else null end) as one_p_knocks
	,count(case when knocks = 2 then 1 else null end) as two_p_knocks
	,count(case when knocks = 3 then 1 else null end) as three_p_knocks
	,count(case when knocks = 4 then 1 else null end) as four_p_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_p_knocks
	from (
		select hd
		,vhhid
		,count(*) as knocks
		from (
			select hd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27)) and cohorts_20160803 in ('HiP','MedHiP','MedLoP')
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) q using (sd)
left join (
	select 'Total' as sd
	,sum(knocks) as total 
	,count(case when knocks = 1 then 1 else null end) as one_g_knocks
	,count(case when knocks = 2 then 1 else null end) as two_g_knocks
	,count(case when knocks = 3 then 1 else null end) as three_g_knocks
	,count(case when knocks = 4 then 1 else null end) as four_g_knocks
	,count(case when knocks = 5 then 1 else null end) as fiveplus_g_knocks
	from (
		select hd
		,vhhid
		,count(*) as knocks
		from (
			select hd
			,datecanvassed
			,committeename
			,vhhid
			from contact_history.v2016
			join voterfiles_van.septembermid2016 b using (vanid)
			where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27)) and cohorts_20160914 = 'GOTV'
			group by 1,2,3,4
		) a
		group by 1,2
	)a
	group by 1
	order by 1
) r using (sd)
left join (
	select 'Total' as sd
	,count(distinct case when resultshortname = 'Canvassed' then vanid else null end) as contacted
	,count(distinct vhhid) as knocked
	,count(distinct case when resultshortname = 'Canvassed' and cohorts_20160803 in ('HiP','MedHiP','MedLoP') then vanid else null end) as p_contacted
	,count(distinct case when cohorts_20160803 in ('HiP','MedHiP','MedLoP') then vhhid else null end) as p_knocked
	,count(distinct case when resultshortname = 'Canvassed' and cohorts_20160914 = 'GOTV' then vanid else null end) as g_contacted
	,count(distinct case when cohorts_20160914 = 'GOTV' then vhhid else null end) as g_knocked
	
	from contact_history.v2016
	join voterfiles_van.septembermid2016 b using (vanid)
	where contacttypename = 'Walk' and (hd in (3,17,23,25,28,29,30,31,33,59) or sd in (19,25,26,27))
        group by 1
) s using (sd)