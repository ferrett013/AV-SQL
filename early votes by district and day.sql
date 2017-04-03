select sd
,count(case when eday_diff=22 then voter_id else null end) as oct15
,count(case when eday_diff=21 then voter_id else null end) as oct16
,count(case when eday_diff=20 then voter_id else null end) as oct17
,count(case when eday_diff=19 then voter_id else null end) as oct18
,count(case when eday_diff=18 then voter_id else null end) as oct19
,count(case when eday_diff=17 then voter_id else null end) as oct20
,count(case when eday_diff=16 then voter_id else null end) as oct21
,count(case when eday_diff=15 then voter_id else null end) as oct22
,count(case when eday_diff=14 then voter_id else null end) as oct23
,count(case when eday_diff=13 then voter_id else null end) as oct24
,count(case when eday_diff=12 then voter_id else null end) as oct25
,count(case when eday_diff=11 then voter_id else null end) as oct26
,count(case when eday_diff=10 then voter_id else null end) as oct27
,count(case when eday_diff=9 then voter_id else null end) as oct28
,count(case when eday_diff=8 then voter_id else null end) as oct29
,count(case when eday_diff=7 then voter_id else null end) as oct30
,count(case when eday_diff=6 then voter_id else null end) as oct31
,count(case when eday_diff=5 then voter_id else null end) as nov1
,count(case when eday_diff=4 then voter_id else null end) as nov2
,count(case when eday_diff=3 then voter_id else null end) as nov3
,count(case when eday_diff=2 then voter_id else null end) as nov4
,count(case when eday_diff=1 then voter_id else null end) as nov5
,count(case when eday_diff=0 then voter_id else null end) as nov6

from (
        select received as vote_date, eday_diff, voter_id, jurisdiction from early_voters.ce18_2012
        union all
        select early_vote_date as vote_date, eday_diff, voter_id, jurisdiction from early_voters.ce19_2012
) a
join voterfiles_van.october2016 b on a.voter_id=b.statefileid
where eday_diff >=0 and eday_diff <= 22 and sd =35
group by 1 order by 1