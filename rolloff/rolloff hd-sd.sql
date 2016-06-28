--HD
SELECT substring(precinct,4,2) as hd, office_issue_judgeship as office, sum(candidate_votes) as votes
FROM precinct_vote_abstract.general_results2012
WHERE (left(office_issue_judgeship,20) = 'State Representative' or office_issue_judgeship = 'President/Vice President')
AND LEFT(precinct,1) <> 'P'
GROUP BY 1,2
ORDER BY 1,2
;
--SD
SELECT substring(precinct,2,2) as sd, office_issue_judgeship as office, sum(candidate_votes) as votes
FROM precinct_vote_abstract.general_results2012
WHERE (left(office_issue_judgeship,12) = 'State Senate' or office_issue_judgeship = 'President/Vice President')
AND LEFT(precinct,1) <> 'P'
GROUP BY 1,2
ORDER BY 1,2