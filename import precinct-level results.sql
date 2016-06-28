DROP SCHEMA IF EXISTS precinct_vote_abstract CASCADE;

CREATE SCHEMA precinct_vote_abstract;
--2011OddYearResults.txt
CREATE TABLE precinct_vote_abstract.odd_year_results_2011 (state text
	,year int
	,election_type char(1)
	,county text
	,issue text
	,yes_votes_raw varchar
	,no_votes_raw varchar
);

COPY precinct_vote_abstract.odd_year_results_2011
	FROM '/Users/Garrett/Dropbox/America Votes/Historical/2011-2012 Biennial Abstract of Votes Cast/2011OddYearResults.txt'
	WITH CSV HEADER DELIMITER AS '	'
;

ALTER TABLE precinct_vote_abstract.odd_year_results_2011 ADD COLUMN yes_votes int;
ALTER TABLE precinct_vote_abstract.odd_year_results_2011 ADD COLUMN no_votes int;

UPDATE precinct_vote_abstract.odd_year_results_2011 SET yes_votes = regexp_replace(yes_votes_raw,',','')::int;
UPDATE precinct_vote_abstract.odd_year_results_2011 SET no_votes = regexp_replace(no_votes_raw,',','')::int;

ALTER TABLE precinct_vote_abstract.odd_year_results_2011 DROP COLUMN yes_votes_raw;
ALTER TABLE precinct_vote_abstract.odd_year_results_2011 DROP COLUMN no_votes_raw;

--2011OddYearTurnout.txt
CREATE TABLE precinct_vote_abstract.odd_year_turnout_2011 (state text
	,year int
	,election_type char(1)
	,county text
	,active_voters_raw varchar
	,inactive_voters_raw varchar
	,total_voters_raw varchar
	,ballots_cast_raw varchar
	,total_voters_turnout_raw text
);

COPY precinct_vote_abstract.odd_year_turnout_2011
	FROM '/Users/Garrett/Dropbox/America Votes/Historical/2011-2012 Biennial Abstract of Votes Cast/2011OddYearTurnout.txt'
	WITH CSV HEADER DELIMITER AS '	'
;

ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 ADD COLUMN active_voters int;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 ADD COLUMN inactive_voters int;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 ADD COLUMN total_voters int;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 ADD COLUMN ballots_cast int;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 ADD COLUMN total_voters_turnout numeric;

UPDATE precinct_vote_abstract.odd_year_turnout_2011 SET active_voters = regexp_replace(active_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.odd_year_turnout_2011 SET inactive_voters = regexp_replace(inactive_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.odd_year_turnout_2011 SET total_voters = regexp_replace(total_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.odd_year_turnout_2011 SET ballots_cast = regexp_replace(ballots_cast_raw,',','')::int;

UPDATE precinct_vote_abstract.odd_year_turnout_2011
	SET total_voters_turnout = CASE WHEN CHAR_LENGTH(total_voters_turnout_raw) = 6
		THEN LEFT(total_voters_turnout_raw,5)::numeric
	WHEN CHAR_LENGTH(total_voters_turnout_raw) = 7
		THEN LEFT(total_voters_turnout_raw,6)::numeric ELSE
	LEFT(total_voters_turnout_raw,4)::numeric END
;

ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 DROP COLUMN active_voters_raw;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 DROP COLUMN inactive_voters_raw;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 DROP COLUMN total_voters_raw;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 DROP COLUMN ballots_cast_raw;
ALTER TABLE precinct_vote_abstract.odd_year_turnout_2011 DROP COLUMN total_voters_turnout_raw;

--2012GeneralResults.txt
CREATE TABLE precinct_vote_abstract.general_results2012 (state text
	,year int
	,election_type char(1)
	,county text
	,precinct varchar
	,office_issue_judgeship text
	,candidate text
	,party text
	,candidate_votes numeric
	,yes_votes numeric
	,no_votes numeric
);

COPY precinct_vote_abstract.general_results2012
	FROM '/Users/Garrett/Dropbox/America Votes/Historical/2011-2012 Biennial Abstract of Votes Cast/2012GeneralResults.txt'
	WITH CSV HEADER DELIMITER AS '	'
;

--2012GeneralTurnout.txt
CREATE TABLE precinct_vote_abstract.general_turnout2012 (state text
	,year int
	,election_type char(1)
	,county text
	,precinct varchar
	,active_voters_raw varchar
	,inactive_voters_raw varchar
	,total_voters_raw varchar
	,ballots_cast_raw varchar
	,total_voters_turnout_raw text
);

COPY precinct_vote_abstract.general_turnout2012
	FROM '/Users/Garrett/Dropbox/America Votes/Historical/2011-2012 Biennial Abstract of Votes Cast/2012GeneralTurnout.txt'
	WITH CSV HEADER DELIMITER AS '	'
;

ALTER TABLE precinct_vote_abstract.general_turnout2012 ADD COLUMN active_voters int;
ALTER TABLE precinct_vote_abstract.general_turnout2012 ADD COLUMN inactive_voters int;
ALTER TABLE precinct_vote_abstract.general_turnout2012 ADD COLUMN total_voters int;
ALTER TABLE precinct_vote_abstract.general_turnout2012 ADD COLUMN ballots_cast int;
ALTER TABLE precinct_vote_abstract.general_turnout2012 ADD COLUMN total_voters_turnout numeric;

UPDATE precinct_vote_abstract.general_turnout2012 SET active_voters = regexp_replace(active_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.general_turnout2012 SET inactive_voters = regexp_replace(inactive_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.general_turnout2012 SET total_voters = regexp_replace(total_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.general_turnout2012 SET ballots_cast = regexp_replace(ballots_cast_raw,',','')::int;

UPDATE precinct_vote_abstract.general_turnout2012
	SET total_voters_turnout = CASE WHEN CHAR_LENGTH(total_voters_turnout_raw) = 6
		THEN LEFT(total_voters_turnout_raw,5)::numeric
	WHEN CHAR_LENGTH(total_voters_turnout_raw) = 7
		THEN LEFT(total_voters_turnout_raw,6)::numeric ELSE
	LEFT(total_voters_turnout_raw,4)::numeric END
;

ALTER TABLE precinct_vote_abstract.general_turnout2012 DROP COLUMN total_voters_turnout_raw;
ALTER TABLE precinct_vote_abstract.general_turnout2012 DROP COLUMN active_voters_raw;
ALTER TABLE precinct_vote_abstract.general_turnout2012 DROP COLUMN inactive_voters_raw;
ALTER TABLE precinct_vote_abstract.general_turnout2012 DROP COLUMN total_voters_raw;
ALTER TABLE precinct_vote_abstract.general_turnout2012 DROP COLUMN ballots_cast_raw;

--2012PrimaryResults.txt
CREATE TABLE precinct_vote_abstract.primary_results2012 (state text
	,year int
	,election_type char(1)
	,county text
	,office text
	,candidate text
	,party text
	,votes_raw varchar
);

COPY precinct_vote_abstract.primary_results2012
	FROM '/Users/Garrett/Dropbox/America Votes/Historical/2011-2012 Biennial Abstract of Votes Cast/2012PrimaryResults.txt'
	WITH CSV HEADER DELIMITER AS '	'
;

ALTER TABLE precinct_vote_abstract.primary_results2012 ADD COLUMN votes int;
UPDATE precinct_vote_abstract.primary_results2012 SET votes = regexp_replace(votes_raw,',','')::int;
ALTER TABLE precinct_vote_abstract.primary_results2012 DROP COLUMN votes_raw;

--2012PrimaryTurnout.txt
CREATE TABLE precinct_vote_abstract.primary_turnout2012 (state text
	,year int
	,election_type char(1)
	,county text
	,active_voters_raw varchar
	,inactive_voters_raw varchar
	,total_voters_raw varchar
	,ballots_cast_raw varchar
	,total_voters_turnout_raw text
);

COPY precinct_vote_abstract.primary_turnout2012
	FROM '/Users/Garrett/Dropbox/America Votes/Historical/2011-2012 Biennial Abstract of Votes Cast/2012PrimaryTurnout.txt'
	WITH CSV HEADER DELIMITER AS '	'
;

ALTER TABLE precinct_vote_abstract.primary_turnout2012 ADD COLUMN active_voters int;
ALTER TABLE precinct_vote_abstract.primary_turnout2012 ADD COLUMN inactive_voters int;
ALTER TABLE precinct_vote_abstract.primary_turnout2012 ADD COLUMN total_voters int;
ALTER TABLE precinct_vote_abstract.primary_turnout2012 ADD COLUMN ballots_cast int;

ALTER TABLE precinct_vote_abstract.primary_turnout2012 ADD COLUMN total_voters_turnout numeric;

UPDATE precinct_vote_abstract.primary_turnout2012 SET active_voters = regexp_replace(active_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.primary_turnout2012 SET inactive_voters = regexp_replace(inactive_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.primary_turnout2012 SET total_voters = regexp_replace(total_voters_raw,',','')::int;
UPDATE precinct_vote_abstract.primary_turnout2012 SET ballots_cast = regexp_replace(ballots_cast_raw,',','')::int;

UPDATE precinct_vote_abstract.primary_turnout2012
	SET total_voters_turnout = CASE WHEN CHAR_LENGTH(total_voters_turnout_raw) = 6
		THEN LEFT(total_voters_turnout_raw,5)::numeric
	WHEN CHAR_LENGTH(total_voters_turnout_raw) = 7
		THEN LEFT(total_voters_turnout_raw,6)::numeric ELSE
	LEFT(total_voters_turnout_raw,4)::numeric END;

ALTER TABLE precinct_vote_abstract.primary_turnout2012 DROP COLUMN total_voters_turnout_raw;
ALTER TABLE precinct_vote_abstract.primary_turnout2012 DROP COLUMN active_voters_raw;
ALTER TABLE precinct_vote_abstract.primary_turnout2012 DROP COLUMN inactive_voters_raw;
ALTER TABLE precinct_vote_abstract.primary_turnout2012 DROP COLUMN total_voters_raw;
ALTER TABLE precinct_vote_abstract.primary_turnout2012 DROP COLUMN ballots_cast_raw;


SELECT * FROM precinct_vote_abstract.primary_turnout2012;
SELECT * FROM precinct_vote_abstract.primary_results2012;
SELECT * FROM precinct_vote_abstract.general_turnout2012;
SELECT * FROM precinct_vote_abstract.general_results2012;
SELECT * FROM precinct_vote_abstract.odd_year_turnout_2011;
SELECT * FROM precinct_vote_abstract.odd_year_results_2011;