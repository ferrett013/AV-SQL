select case when party in ('DEM','REP','UAF') then party else '3rd' end
,count(case when status_code = 'A' then 1 else null end) as active
,count(case when status_code = 'I' then 1 else null end) as inactive
from voterfiles_sos.june2016
group by 1
order by 1;
select count(*) from voterfiles_sos.june2016;