DROP TABLE IF EXISTS voterfiles_sos.denver_votehistory_june2015;
CREATE TABLE voterfiles_sos.denver_votehistory_june2015 (VOTER_ID integer
	,ELECTION_TYPE varchar
	,ELECTION_DATE date
	,ELECTION_DESCRIPTION varchar
	,VOTING_METHOD varchar
	,PARTY varchar
	,COUNTY_NAME varchar

);
COPY voterfiles_sos.denver_votehistory_june2015 FROM '/Users/Garrett/Desktop/20150914_EX002_Master_Voting_History.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';

DROP TABLE IF EXISTS voterfiles_sos.denver_voterdetails_june2015;
CREATE TABLE voterfiles_sos.denver_voterdetails_june2015 (VOTER_ID integer
	,COUNTY varchar
	,FIRST_NAME varchar
	,MIDDLE_NAME varchar
	,LAST_NAME varchar
	,NAME_SUFFIX varchar
	,REGISTRATION_DATE date
	,EFFECTIVE_DATE date
	,LAST_UPDATED_DATE date
	,OLD_VOTER_ID varchar
	,PHONE_NUM varchar
	,HOUSE_NUM varchar
	,HOUSE_SUFFIX varchar
	,PRE_DIR varchar
	,STREET_NAME varchar
	,STREET_TYPE varchar
	,POST_DIR varchar
	,UNIT_TYPE varchar
	,UNIT_NUM varchar
	,RESIDENTIAL_ADDRESS varchar
	,RESIDENTIAL_CITY varchar
	,RESIDENTIAL_STATE varchar
	,RESIDENTIAL_ZIP_CODE varchar
	,RESIDENTIAL_ZIP_PLUS varchar
	,MAILING_ADDRESS_1 varchar
	,MAILING_ADDRESS_2 varchar
	,MAILING_ADDRESS_3 varchar
	,MAILING_CITY varchar
	,MAILING_STATE varchar
	,MAILING_ZIP_CODE varchar
	,MAILING_ZIP_PLUS varchar
	,MAILING_COUNTRY varchar
	,VOTER_STATUS varchar
	,STATUS_REASON varchar
	,PARTY varchar
	,GENDER varchar
	,BIRTH_YEAR integer
	,PRECINCT_CODE numeric
	,PRECINCT_NAME numeric
	,FEDERAL varchar
	,CONGRESSIONAL varchar
	,STATEWIDE varchar
	,STATE_BOARD_OF_EDUCATION_AT_LARGE varchar
	,STATE_BOARD_OF_EDUCATION varchar
	,UNIVERSITY_OF_COLORADO_REGENTS_AT_LARGE varchar
	,UNIVERSITY_OF_COLORADO_REGENTS varchar
	,STATE_SENATE varchar
	,STATE_HOUSE varchar
	,JUDICIAL varchar
	,REGIONAL_TRANSPORTATION_DISTRICT varchar
	,COUNTYWIDE varchar
	,COUNCIL varchar
	,SCHOOL_DISTRICT varchar
	,METRO_DISTRICT varchar
	,SCIENTIFIC_CULTURAL_FACILITIES varchar

);
COPY voterfiles_sos.denver_voterdetails_june2015 FROM '/Users/Garrett/Desktop/20150914_EX002_Master_Voter_Detail.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';