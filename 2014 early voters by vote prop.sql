select vote_date
,count(case when cat_partisan_2016 < 10 then voter_id else null end) as "0to10"
,count(case when cat_partisan_2016 < 20 and cat_partisan_2016 >= 10 then voter_id else null end) as "10to20"
,count(case when cat_partisan_2016 < 30 and cat_partisan_2016 >= 20 then voter_id else null end) as "20to30"
,count(case when cat_partisan_2016 < 40 and cat_partisan_2016 >= 30 then voter_id else null end) as "30to40"
,count(case when cat_partisan_2016 < 50 and cat_partisan_2016 >= 40 then voter_id else null end) as "40to50"
,count(case when cat_partisan_2016 < 60 and cat_partisan_2016 >= 50 then voter_id else null end) as "50to60"
,count(case when cat_partisan_2016 < 70 and cat_partisan_2016 >= 60 then voter_id else null end) as "60to70"
,count(case when cat_partisan_2016 < 80 and cat_partisan_2016 >= 70 then voter_id else null end) as "70to80"
,count(case when cat_partisan_2016 < 90 and cat_partisan_2016 >= 80 then voter_id else null end) as "80to90"
,count(case when cat_partisan_2016 >= 90 then voter_id else null end) as "90to100"
,count(case when cat_partisan_2016 is null then voter_id else null end) as unknown
from (
	select voter_id, received as vote_date from early_voters.ce18_2014
	union
	select voter_id, vote_date from early_voters.ce19_2014
)a
left join voterfiles_van.april2016 b on a.voter_id = b.statefileid
group by 1
order by 1
;