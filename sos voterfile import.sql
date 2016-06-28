@stop on error;
DROP TABLE IF EXISTS voterfiles_sos.junemid2016;
CREATE TABLE voterfiles_sos.junemid2016 (VOTER_ID integer primary key
,COUNTY_CODE char(2)
,COUNTY text
,LAST_NAME text
,FIRST_NAME text
,MIDDLE_NAME text
,NAME_SUFFIX text
,VOTER_NAME text
,STATUS_CODE char(1)
,PRECINCT_NAME char(10)
,ADDRESS_LIBRARY_ID text
,HOUSE_NUM text
,HOUSE_SUFFIX text
,PRE_DIR text
,STREET_NAME text
,STREET_TYPE text
,POST_DIR text
,UNIT_TYPE text
,UNIT_NUM text
,ADDRESS_NON_STD text
,RESIDENTIAL_ADDRESS text
,RESIDENTIAL_CITY text
,RESIDENTIAL_STATE char(2)
,RESIDENTIAL_ZIP_CODE char(5)
,RESIDENTIAL_ZIP_PLUS char(4)
,EFFECTIVE_DATE date
,REGISTRATION_DATE date
,STATUS text
,STATUS_REASON text
,BIRTH_YEAR integer
,GENDER text
,PRECINCT char(10)
,SPLIT text
,VOTER_STATUS_ID char(1)
,PARTY char(3)
,PARTY_AFFILIATION_DATE date
,PHONE_NUM text
,MAIL_ADDR1 text
,MAIL_ADDR2 text
,MAIL_ADDR3 text
,MAILING_CITY text
,MAILING_STATE char(2)
,MAILING_ZIP_CODE char(5)
,MAILING_ZIP_PLUS char(4)
,MAILING_COUNTRY text
,SPL_ID	integer
,PERMANENT_MAIL_IN_VOTER char(3)
,CONGRESSIONAL text
,STATE_SENATE text
,STATE_HOUSE text
,ID_REQUIRED char(1)
);
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part1.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part2.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part3.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part4.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part5.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part6.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part7.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part8.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part9.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part10.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part11.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part12.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part13.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/Registered_Voters_List_ Part14.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';

SELECT COUNT(*) FROM voterfiles_sos.april2016;
SELECT COUNT(*) FROM voterfiles_sos.may2016;
SELECT COUNT(*) FROM voterfiles_sos.maymid2016;
SELECT COUNT(*) FROM voterfiles_sos.junemid2016;
SELECT COUNT(*) FROM voterfiles_sos.junemid2016;