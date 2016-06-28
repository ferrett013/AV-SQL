SELECT substr(precinct,2,2)::int as "SD"
,SUM(CASE WHEN party = 'Democratic Party'
	THEN candidate_votes
	ELSE 0 END) AS "Democratic Party"
,SUM(CASE WHEN party = 'Republican Party'
	THEN candidate_votes
	ELSE 0 END) AS "Republican Party"
,SUM(CASE WHEN party IN ('America''s Party'
	,'American Constitution Party'
	,'American Third Position'
	,'Green Party'
	,'Independent / Republican'
	,'Justice Party'
	,'Libertarian Party'
	,'Objectivist Party'
	,'Peace and Freedom'
	,'Socialism and Liberation'
	,'Socialist Equality Party'
	,'Socialist Party USA'
	,'Socialist Workers Party'
	,'Unaffiliated'
	,'We the People')
	THEN candidate_votes
	ELSE 0 END) AS "3rd Party"

FROM precinct_vote_abstract.general_results2012
WHERE office_issue_judgeship = 'President/Vice President'
AND precinct <> 'Provisional'
GROUP BY 1
ORDER BY 1
;

SELECT substr(precinct,4,2)::int as "HD"
,SUM(CASE WHEN party = 'Democratic Party'
	THEN candidate_votes
	ELSE 0 END) AS "Democratic Party"
,SUM(CASE WHEN party = 'Republican Party'
	THEN candidate_votes
	ELSE 0 END) AS "Republican Party"
,SUM(CASE WHEN party IN ('America''s Party'
	,'American Constitution Party'
	,'American Third Position'
	,'Green Party'
	,'Independent / Republican'
	,'Justice Party'
	,'Libertarian Party'
	,'Objectivist Party'
	,'Peace and Freedom'
	,'Socialism and Liberation'
	,'Socialist Equality Party'
	,'Socialist Party USA'
	,'Socialist Workers Party'
	,'Unaffiliated'
	,'We the People')
	THEN candidate_votes
	ELSE 0 END) AS "3rd Party"

FROM precinct_vote_abstract.general_results2012
WHERE office_issue_judgeship = 'President/Vice President'
AND precinct <> 'Provisional'
GROUP BY 1
ORDER BY 1
;