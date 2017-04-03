drop table if exists voterfiles_sos.votehistory_details_december2016;
create table voterfiles_sos.votehistory_details_december2016 (voter_id int primary key
,county text
,first_name text
,middle_name text
,last_name text
,name_suffix text
,registration_date date
,effective_date date
,last_updated_date date
,old_voter_id text
,phone_num text
,house_num text
,house_suffix text
,pre_dir text
,street_name text
,street_type text
,post_dir text
,unit_type text
,unit_num text
,residential_address text
,residential_city text
,residential_state text
,residential_zip_code text
,residential_zip_plus text
,mailing_address_1 text
,mailing_address_2 text
,mailing_address_3 text
,mailing_city text
,mailing_state text
,mailing_zip_code text
,mailing_zip_plus text
,mailing_country text
,voter_status text
,status_reason text
,party text
,gender text
,birth_year int
,precinct_code text
,precinct_name text
,federal text
,congressional int
,statewide text
,state_board_of_education_at_large text
,state_board_of_education text
,university_of_colorado_regents_at_large text
,university_of_colorado_regents text
,state_senate int
,state_house int
,judicial text
,regional_transportation_district text
,consolidated_regional_transportation text
,county_commissioner text
,countywide text
,municipality text
,city_2 text
,city_ward_precinct text
,city_sub text
,council text
,city_ward_district text
,school_district text
,school_precinct text
,community_college_junior_college_2 text
,community_college_junior_college text
,airport_authority text
,ambulance text
,ambulance_2 text
,annexation text
,bond_debt_and_debt_service text
,bond_debt_and_debt_service_2 text
,business_improvement_district text
,cemetery2 text
,cemetery text
,conservation_district text
,conservation_2 text
,conservation_3 text
,county_housing_authority text
,county_road text
,dc_cap_reserve text
,dc_debt_service text
,dc_insurance_reserve text
,development_authority text
,downtown_development_authority text
,drainage text
,drainage_and_flood_control text
,drainage_and_flood_control_2 text
,emergency_telephone_service_authority text
,fire_protection_district text
,fire_protection_2 text
,fire_protection_3 text
,fire_protection_sub text
,football_stadium text
,general_improvement_district text
,ground_water_management text
,groundwater_management_2 text
,health_service_hospital_authority text
,highway_authority text
,hospital_authority text
,hospital_authority_2 text
,housing_authority text
,improvement2 text
,irrigation text
,law_enforcement_authority text
,library_district text
,library_sub text
,local_improvement text
,local_marketing_district text
,major_league_baseball_stadium text
,metro_district text
,metro_district_2 text
,metropolitan_3 text
,metropolitan_sub text
,misc_general_improvement text
,misc_other text
,park_and_recreation_district text
,park_and_recreation_district_2 text
,park_and_recreation_district_3 text
,park_and_recreation_district_4 text
,park_and_recreation_district_5 text
,park_and_recreation_sub text
,proposed_district text
,proposed_district_2 text
,public_improvement_district text
,public_improvement_district_2 text
,recreation_translator text
,regional_housing_authority text
,regional_service_authority text
,river_power_authority text
,road_and_bridge text
,sanitation_district text
,sanitation_district_2 text
,scientific_cultural_facilities text
,scientific_cultural_facilities_sub text
,sewer_improvement_district text
,soil_conservation_tax_area text
,special_improvement_district text
,special_improvement_maintenance text
,tax_area text
,transportation_authority_2 text
,transportation_authority_district text
,unincorporated text
,unincorporated_2 text
,urban_renewal_reinvestment_authority text
,water_and_sanitation_district text
,water_and_sanitation_district_2 text
,water_and_sanitation_district_3 text
,water_conservancy text
,water_conservancy_2 text
,water_conservancy_3 text
,water_conservation text
,water_conservation_2 text
,water_district text
,water_district_2 text
,water_district_sub text
,water_quality_authority text
,weed_and_pest_control text
);

copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part7_12_05_2016_01_32_15.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part9_12_05_2016_01_34_21.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part12_12_05_2016_01_37_31.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part13_12_05_2016_01_38_33.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part24_12_05_2016_01_50_27.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part3_12_05_2016_01_28_09.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part4_12_05_2016_01_29_11.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part5_12_05_2016_01_30_12.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part6_12_05_2016_01_31_13.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part10_12_05_2016_01_35_23.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part22_12_05_2016_01_48_14.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part15_12_05_2016_01_40_42.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part18_12_05_2016_01_43_55.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part2_12_05_2016_01_27_08.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part20_12_05_2016_01_46_05.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part1_12_05_2016_13_14_06.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part8_12_05_2016_01_33_18.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part21_12_05_2016_01_47_10.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part26_12_05_2016_01_52_40.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part23_12_05_2016_01_49_20.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part25_12_05_2016_01_51_33.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part14_12_05_2016_01_39_38.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part19_12_05_2016_01_45_00.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part11_12_05_2016_01_36_27.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part16_12_05_2016_01_41_47.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part17_12_05_2016_01_42_51.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_details_december2016 from '/users/garrett/desktop/Master_Voting_History_List_Voter_Details_ Part27_12_05_2016_01_53_46.txt' with csv header delimiter as ',' encoding 'windows-1251';


select count(*) from voterfiles_sos.votehistory_details_december2016;
@beep;