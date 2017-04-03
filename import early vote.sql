drop table if exists early_voters.ce18_primary2016;
create table early_voters.ce18_primary2016 (jurisdiction varchar
	,voter_id integer primary key
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

copy early_voters.ce18_primary2016
	from '/Users/Garrett/Desktop/CE-018_MailBallotsReturned_28Jun_600009087_20160630_091002.txt'
	with csv header delimiter as ','
;


drop table if exists early_voters.ce19_primary2016;
create table early_voters.ce19_primary2016 (jurisdiction varchar
	,voter_id integer primary key
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

copy early_voters.ce19_primary2016
	from '/Users/Garrett/Desktop/CE-019_InPersonVoting_28Jun_600009087_20160630_092501.txt'
	with csv header delimiter as ','
;

@export on;
@export set filename="/Users/Garrett/Desktop/mail.txt" CsvRowDelimiter=\r\n;
select voter_id, received from early_voters.ce18_primary2016;
@export set filename="/Users/Garrett/Desktop/in-person.txt" CsvRowDelimiter=\r\n;
select voter_id, vote_date from early_voters.ce19_primary2016;
@export off;

select count(*) from early_voters.ce18_primary2016;
select count(*) from early_voters.ce19_primary2016;