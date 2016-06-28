drop table if exists early_voters.ce18_2008;
create table early_voters.ce18_2008 (JURISDICTION text
,VOTER_ID int primary key
,LAST_NAME text
,FIRST_NAME text
,MIDDLE_NAME text
,NAME_SUFFIX text
,RECEIVED date
,PARTY text
);

copy early_voters.ce18_2008
	from '/users/garrett/desktop/CE-018_PublicRecievedBallots_04Nov_20120918_072600_00.txt'
	with csv header delimiter as ','
;


/*drop table if exists early_voters.ce19_2008;
create table early_voters.ce19_2008 (
);

copy early_voters.ce19_2008
	from '/users/garrett/desktop/'
	with csv header delimiter as '|'
;
*/
select count(*) from early_voters.ce18_2008;
--select count(*) from early_voters.ce19_2008;