SELECT LEFT(precinct,1) as cd, office_issue_judgeship as office, sum(candidate_votes) as votes
FROM precinct_vote_abstract.general_results2012
WHERE office_issue_judgeship IN ('President/Vice President'
,'United States Representative - District 1'
,'United States Representative - District 2'
,'United States Representative - District 3'
,'United States Representative - District 4'
,'United States Representative - District 5'
,'United States Representative - District 6'
,'United States Representative - District 7'
)
AND LEFT(precinct,1) <> 'P'
GROUP BY 1,2
ORDER BY 1,2