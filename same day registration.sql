select a.jurisdiction, count(case when a.vote_date=b.registration_date and c.voter_id is null then voter_id else null end) as new_reg
,count(case when (a.vote_date=b.registration_date and c.voter_id is not null) or (a.vote_date=b.effective_date and c.voter_id is not null) then voter_id else null end) as update_reg
from early_voters.ce19_2016 a
join votehistory.december2016_voterdetails b using (voter_id)
left join voterfiles_sos.octobermid2016 c using (voter_id)
group by 1
order by 1