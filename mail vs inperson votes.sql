select countyname
,count(case when vote_method='Mail' then statefileid else null end) as mail_voters
,count(case when vote_method='In-Person' then statefileid else null end) as inperson_voters
,count(*) as total
from (
        select voter_id as statefileid, 'Mail' as vote_method from early_voters.ce18_2016 
        union all
        select voter_id as statefileid, 'In-Person' as vote_method from early_voters.ce19_2016 
) a
join voterfiles_van.december2016 b using (statefileid)
group by 1 order by 1
;
select case when age <=25 then '18-25' when age > 25 and age <=35 then '26-35'when age > 35 and age <=45 then '36-45' when age > 45 and age <=55 then '46-55' when age > 55 and age <=65 then '56-65' when age >65 then '65+' else null end
,count(case when vote_method='Mail' then statefileid else null end) as mail_voters
,count(case when vote_method='In-Person' then statefileid else null end) as inperson_voters
,count(*) as total
from (
        select voter_id as statefileid, 'Mail' as vote_method from early_voters.ce18_2016 
        union all
        select voter_id as statefileid, 'In-Person' as vote_method from early_voters.ce19_2016 
) a
join voterfiles_van.december2016 b using (statefileid)
group by 1 order by 1
;
select race, count(distinct statefileid)
from (
        select voter_id as statefileid, party, received as vote_date, 'Mail' as vote_method from early_voters.ce18_2016
        union all
        select voter_id as statefileid, party, vote_date, 'In Person' as vote_method from early_voters.ce19_2016
) a
left join voterfiles_van.december2016 b using (statefileid)
where --vote_date >= '2016-10-24' and vote_date <= '2016-10-28' and
vote_method = 'In Person'
group by 1 order by 1
;
select sex
,count(case when vote_method='Mail' then statefileid else null end) as mail_voters
,count(case when vote_method='In-Person' then statefileid else null end) as inperson_voters
,count(*) as total
from (
        select voter_id as statefileid, 'Mail' as vote_method from early_voters.ce18_2016 
        union all
        select voter_id as statefileid, 'In-Person' as vote_method from early_voters.ce19_2016 
) a
join voterfiles_van.december2016 b using (statefileid)
group by 1 order by 1
;
select party
,count(case when vote_method='Mail' then statefileid else null end) as mail_voters
,count(case when vote_method='In-Person' then statefileid else null end) as inperson_voters
,count(*) as total
from (
        select voter_id as statefileid, 'Mail' as vote_method from early_voters.ce18_2016 
        union all
        select voter_id as statefileid, 'In-Person' as vote_method from early_voters.ce19_2016 
) a
join voterfiles_van.december2016 b using (statefileid)
group by 1 order by 1