select datecanvassed
,count(case when contacttypename in ('Paid Call','Phone') then vanid else null end) as phone_attempts
,count(case when contacttypename in ('Paid Walk','Walk') then vanid else null end) as walk_attempts
from public.nv_contact_history2016
where datecanvassed > '2016-10-14' and contacttypename in ('Paid Call','Phone','Paid Walk','Walk')
group by 1 order by 1;
;

select canvassed_times, count(*) from (
select vanid, count(*) as canvassed_times
from public.nv_contact_history2016 
where contacttypename in ('Paid Call','Phone')
group by 1
)a
group by 1
order by 1
;

select resultshortname, count(*) 
from public.nv_contact_history2016 
where contacttypename in ('Paid Call','Phone'/*,'Paid Walk','Walk'*/)
and datecanvassed >= '2016-11-04' and datecanvassed <='2016-11-08'
group by 1 order by 1
;

drop table if exists public.nv_contact_history2016;
create table public.nv_contact_history2016 (VANID int
,DWID int
,VoterName text
,ResultShortName text
,CreatedBy text
,CanvassedBy text
,IsCanvasser boolean
,CommitteeName text
,DateCreated date
,DateCanvassed date
,ContactTypeName text
,InputTypeName  text
);

copy public.nv_contact_history2016
from '/Users/Garrett/Desktop/import2.txt'
with csv header delimiter as '	'
;

select contacttypename, count(*) from public.nv_contact_history2016 
group by 1 order by 1
;