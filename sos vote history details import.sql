DROP TABLE IF EXISTS voterfiles_sos.votehistory_details_nov2015;
CREATE TABLE voterfiles_sos.votehistory_details_nov2015 (VOTER_ID	int primary key
,COUNTY	text
,FIRST_NAME	text
,MIDDLE_NAME	text
,LAST_NAME	text
,NAME_SUFFIX	text
,REGISTRATION_DATE	date
,EFFECTIVE_DATE	date
,LAST_UPDATED_DATE	date
,OLD_VOTER_ID	text
,HOUSE_NUM	text
,HOUSE_SUFFIX	text
,PRE_DIR	text
,STREET_NAME	text
,STREET_TYPE	text
,POST_DIR	text
,UNIT_TYPE	text
,UNIT_NUM	text
,RESIDENTIAL_ADDRESS	text
,RESIDENTIAL_CITY	text
,RESIDENTIAL_STATE	text
,RESIDENTIAL_ZIP_CODE	text
,RESIDENTIAL_ZIP_PLUS	text
,MAILING_ADDRESS_1	text
,MAILING_ADDRESS_2	text
,MAILING_ADDRESS_3	text
,MAILING_CITY	text
,MAILING_STATE	text
,MAILING_ZIP_CODE	text
,MAILING_ZIP_PLUS	text
,MAILING_COUNTRY	text
,VOTER_STATUS	text
,STATUS_REASON	text
,PARTY	text
,GENDER	text
,BIRTH_YEAR	int
,PRECINCT_CODE	text
,PRECINCT_NAME	text
,FEDERAL	text
,CONGRESSIONAL	int
,STATEWIDE	text
,STATE_BOARD_OF_EDUCATION_AT_LARGE	text
,STATE_BOARD_OF_EDUCATION	text
,UNIVERSITY_OF_COLORADO_REGENTS_AT_LARGE	text
,UNIVERSITY_OF_COLORADO_REGENTS	text
,STATE_SENATE	int
,STATE_HOUSE	int
,JUDICIAL	text
,REGIONAL_TRANSPORTATION_DISTRICT	text
,CONSOLIDATED_REGIONAL_TRANSPORTATION	text
,COUNTY_COMMISSIONER	text
,COUNTYWIDE	text
,MUNICIPALITY	text
,CITY_2	text
,CITY_WARD_PRECINCT	text
,CITY_SUB	text
,COUNCIL	text
,CITY_WARD_DISTRICT	text
,SCHOOL_DISTRICT	text
,SCHOOL_PRECINCT	text
,COMMUNITY_COLLEGE_JUNIOR_COLLEGE_2	text
,COMMUNITY_COLLEGE_JUNIOR_COLLEGE	text
,AIRPORT_AUTHORITY	text
,AMBULANCE	text
,AMBULANCE_2	text
,ANNEXATION	text
,BOND_DEBT_AND_DEBT_SERVICE	text
,BOND_DEBT_AND_DEBT_SERVICE_2	text
,BUSINESS_IMPROVEMENT_DISTRICT	text
,CEMETERY2	text
,CEMETERY	text
,CONSERVATION_DISTRICT	text
,CONSERVATION_2	text
,CONSERVATION_3	text
,COUNTY_HOUSING_AUTHORITY	text
,COUNTY_ROAD	text
,DC_CAP_RESERVE	text
,DC_DEBT_SERVICE	text
,DC_INSURANCE_RESERVE	text
,DEVELOPMENT_AUTHORITY	text
,DOWNTOWN_DEVELOPMENT_AUTHORITY	text
,DRAINAGE	text
,DRAINAGE_AND_FLOOD_CONTROL	text
,DRAINAGE_AND_FLOOD_CONTROL_2	text
,EMERGENCY_TELEPHONE_SERVICE_AUTHORITY	text
,FIRE_PROTECTION_DISTRICT	text
,FIRE_PROTECTION_2	text
,FIRE_PROTECTION_3	text
,FIRE_PROTECTION_SUB	text
,FOOTBALL_STADIUM	text
,GENERAL_IMPROVEMENT_DISTRICT	text
,GROUND_WATER_MANAGEMENT	text
,GROUNDWATER_MANAGEMENT_2	text
,HEALTH_SERVICE_HOSPITAL_AUTHORITY	text
,HIGHWAY_AUTHORITY	text
,HOSPITAL_AUTHORITY	text
,HOSPITAL_AUTHORITY_2	text
,HOUSING_AUTHORITY	text
,IMPROVEMENT2	text
,IRRIGATION	text
,LAW_ENFORCEMENT_AUTHORITY	text
,LIBRARY_DISTRICT	text
,LIBRARY_SUB	text
,LOCAL_IMPROVEMENT	text
,LOCAL_MARKETING_DISTRICT	text
,MAJOR_LEAGUE_BASEBALL_STADIUM	text
,METRO_DISTRICT	text
,METRO_DISTRICT_2	text
,METROPOLITAN_3	text
,METROPOLITAN_SUB	text
,MISC_GENERAL_IMPROVEMENT	text
,MISC_OTHER	text
,PARK_AND_RECREATION_DISTRICT	text
,PARK_AND_RECREATION_DISTRICT_2	text
,PARK_AND_RECREATION_DISTRICT_3	text
,PARK_AND_RECREATION_DISTRICT_4	text
,PARK_AND_RECREATION_DISTRICT_5	text
,PARK_AND_RECREATION_SUB	text
,PROPOSED_DISTRICT	text
,PROPOSED_DISTRICT_2	text
,PUBLIC_IMPROVEMENT_DISTRICT	text
,PUBLIC_IMPROVEMENT_DISTRICT_2	text
,RECREATION_TRANSLATOR	text
,REGIONAL_HOUSING_AUTHORITY	text
,REGIONAL_SERVICE_AUTHORITY	text
,RIVER_POWER_AUTHORITY	text
,ROAD_AND_BRIDGE	text
,SANITATION_DISTRICT	text
,SANITATION_DISTRICT_2	text
,SCIENTIFIC_CULTURAL_FACILITIES	text
,SCIENTIFIC_CULTURAL_FACILITIES_SUB	text
,SEWER_IMPROVEMENT_DISTRICT	text
,SOIL_CONSERVATION_TAX_AREA	text
,SPECIAL_IMPROVEMENT_DISTRICT	text
,SPECIAL_IMPROVEMENT_MAINTENANCE	text
,TAX_AREA	text
,TRANSPORTATION_AUTHORITY_2	text
,TRANSPORTATION_AUTHORITY_DISTRICT	text
,UNINCORPORATED	text
,UNINCORPORATED_2	text
,URBAN_RENEWAL_REINVESTMENT_AUTHORITY	text
,WATER_AND_SANITATION_DISTRICT	text
,WATER_AND_SANITATION_DISTRICT_2	text
,WATER_AND_SANITATION_DISTRICT_3	text
,WATER_CONSERVANCY	text
,WATER_CONSERVANCY_2	text
,WATER_CONSERVANCY_3	text
,WATER_CONSERVATION	text
,WATER_CONSERVATION_2	text
,WATER_DISTRICT	text
,WATER_DISTRICT_2	text
,WATER_DISTRICT_SUB	text
,WATER_QUALITY_AUTHORITY	text
,WEED_AND_PEST_CONTROL	text
);

COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed1.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed2.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed3.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed4.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed5.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed6.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed7.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed8.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed9.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed10.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed11.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed12.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed13.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed14.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed15.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed16.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed17.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed18.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed19.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed20.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed21.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed22.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed23.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed24.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';
COPY voterfiles_sos.votehistory_details_nov2015 FROM '/Users/Garrett/Desktop/11.23.2015/processed25.txt' WITH CSV HEADER DELIMITER AS ',' encoding 'windows-1251';

SELECT COUNT(*) FROM voterfiles_sos.votehistory_details_nov2015;
@beep;