select registration_date as "Registration Date"
,count(case when cat_partisan_2016 < 10 then voter_id else null end) as "0 to 10"
,count(case when cat_partisan_2016 < 20 and cat_partisan_2016 >= 10 then voter_id else null end) as "10 to 20"
,count(case when cat_partisan_2016 < 30 and cat_partisan_2016 >= 20 then voter_id else null end) as "20 to 30"
,count(case when cat_partisan_2016 < 40 and cat_partisan_2016 >= 30 then voter_id else null end) as "30 to 40"
,count(case when cat_partisan_2016 < 50 and cat_partisan_2016 >= 40 then voter_id else null end) as "40 to 50"
,count(case when cat_partisan_2016 < 60 and cat_partisan_2016 >= 50 then voter_id else null end) as "50 to 60"
,count(case when cat_partisan_2016 < 70 and cat_partisan_2016 >= 60 then voter_id else null end) as "60 to 70"
,count(case when cat_partisan_2016 < 80 and cat_partisan_2016 >= 70 then voter_id else null end) as "70 to 80"
,count(case when cat_partisan_2016 < 90 and cat_partisan_2016 >= 80 then voter_id else null end) as "80 to 90"
,count(case when cat_partisan_2016 >= 90 then voter_id else null end) as "90 to 100"
,count(case when cat_partisan_2016 is null then voter_id else null end) as "Unknown"
,count(*) as "Total"
from voterfiles_old.dec2014 a
left join voterfiles_van.april2016 b on a.voter_id=b.statefileid
where a.registration_date >= '2014-05-01' and a.registration_date < '2014-11-01'
group by 1
order by 1