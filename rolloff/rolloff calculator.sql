select precinct, top_vote-low_vote as rolloff from (
	select precinct
	,max(case when office_issue_judgeship = 'United States Senator' then votes else null end) as top_vote
	,max(case when left(office_issue_judgeship,20) = 'State Representative' then votes else null end) as low_vote
	from (
		select precinct, office_issue_judgeship, sum(candidate_votes) as votes
		from precinct_vote_abstract.general_results2014 
		where office_issue_judgeship = 'United States Senator' or left(office_issue_judgeship,20) = 'State Representative'
		group by 1,2
		order by 1,2
	) a
	group by 1
	order by 1
) a