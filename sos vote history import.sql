drop table if exists voterfiles_sos.votehistory_december2016;
create table voterfiles_sos.votehistory_december2016 (
voter_id integer,
election_type varchar,
election_date date,
election_description varchar,
voting_method varchar,
party varchar,
county_name varchar
);
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part1_12_05_2016_13_54_26.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part2_12_05_2016_01_56_47.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part3_12_05_2016_01_57_23.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part4_12_05_2016_01_57_59.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part5_12_05_2016_01_58_35.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part6_12_05_2016_01_59_11.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part7_12_05_2016_01_59_48.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part8_12_05_2016_02_00_23.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part9_12_05_2016_02_01_00.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part10_12_05_2016_02_01_36.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part11_12_05_2016_02_02_15.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part12_12_05_2016_02_02_50.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part13_12_05_2016_02_03_54.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part14_12_05_2016_02_05_07.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part15_12_05_2016_02_06_22.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part16_12_05_2016_02_07_39.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part17_12_05_2016_02_08_55.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part18_12_05_2016_02_10_14.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part19_12_05_2016_02_11_32.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part20_12_05_2016_02_12_51.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part21_12_05_2016_02_14_10.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part22_12_05_2016_02_15_26.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part23_12_05_2016_02_16_42.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part24_12_05_2016_02_17_59.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part25_12_05_2016_02_19_18.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part26_12_05_2016_02_20_38.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part27_12_05_2016_02_22_01.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part28_12_05_2016_02_23_21.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part29_12_05_2016_02_24_39.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part30_12_05_2016_02_25_57.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part31_12_05_2016_02_27_11.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part32_12_05_2016_02_28_23.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.votehistory_december2016 from '/users/garrett/desktop/Master_Voting_History_List_ Part33_12_05_2016_02_29_34.txt' with csv header delimiter as ',' encoding 'windows-1251';