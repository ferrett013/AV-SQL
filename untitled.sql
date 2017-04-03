drop table if exists early_voters.ce18_test2016;
create table early_voters.ce18_test2016 (jurisdiction varchar
	,voter_id integer 
	,last_name varchar
	,first_name varchar
	,middle_name varchar
	,name_suffix varchar
	,party varchar
	,residential_address varchar
	,precinct numeric
	,uocava varchar
	,uocava_type varchar
	,received date
	,election_name text
);


copy early_voters.ce18_test2016
	from '/Users/Garrett/Desktop/CE-018_MailBallotsReturned_08Nov_600010433_20161030_091001.txt'
	with csv header delimiter as ','
;

drop table if exists early_voters.ce19_2016;
create table early_voters.ce19_2016 (jurisdiction varchar
	,voter_id integer
	,last_name varchar
	,first_name varchar
	,middle_name varchar
	,name_suffix varchar
	,party varchar
	,residential_address varchar
	,precinct numeric
	,uocava varchar
	,uocava_type varchar
	,in_person_vote_method varchar
	,vspc_location varchar
	,vote_date date
	,election_name text
);