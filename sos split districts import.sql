DROP TABLE IF EXISTS voterfiles_sos.split_junemid2016;
CREATE TABLE voterfiles_sos.split_junemid2016 (COUNTY text
,PRECINCT_CODE numeric
,SPLIT_CODE text
,DISTRICT_CODE text
,DISTRICT_TYPE text
,DISTRICT_NAME text
);

COPY voterfiles_sos.split_junemid2016 FROM '/Users/Garrett/Desktop/EX-003 Master Voter List/SPLIT_DISTRICTS_06_15_2016_04_19_27.TXT' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
SELECT COUNT(*) FROM voterfiles_sos.split_junemid2016;