drop table if exists voterfiles_van.december2016;
create table voterfiles_van.december2016 (vanid int primary key
,dwid int
,statefileid int
,lastname text
,firstname text
,middlename text
,suffix text
,party text
,sex text
,race text
,age int
,dob date
,datereg date
,vaddress text
,vcity text
,vstate text
,vzip5 text
,vzip4 text
,vhhid int
,maddresss text
,mcity text
,mstate text
,mzip5 text
,mzip4 text
,mhhid int
,homephone numeric
,cellphone numeric
,preferredemail text
,cd int
,sd int
,hd int
,countyname text
,vanprecinct text
,schooldistrictname text
,maritalstatus text
,medianhhincome int
,cat_partisan_2014 numeric
,cat_vprop_2014 numeric
,votepropensity numeric
,cat_activist_2015 numeric
,cat_ideology_2015 numeric
,cat_marital_2015 text
,cat_partisan_2015 numeric
,cat_vprop_2015 numeric
,chinese_confidence numeric
,filipino numeric
,japanese numeric
,korean numeric
,southasian numeric
,vietnamese numeric
,bl_ethnicity text
,bl_turnout numeric
,cat_age_2016 text
,cat_child_2016 text
,cat_deadwood_2016 text
,cat_ideology_2016 numeric
,cat_income_2016 text
,cat_marital_2016 text
,cat_partisan_2016 numeric
,cat_clintonsup_2016 numeric
,cat_raceconf_2016 numeric
,cat_tktsplt_2016 numeric
,cat_vci_2016 numeric
,cat_vprop_2016 numeric
,cat_vprop2_2016 numeric
,civ_naral7in10 numeric
,civ_minwage_ballcompl numeric
,civ_minwage_def numeric
,civ_minwage_gotv numeric
,civ_minwage_pers numeric
,civ_minwage_supp numeric
,civ_minwage_turnout numeric
,avgotv_model numeric
,ld_partisanship numeric
,ld_polattention numeric
,ld_turnout numeric
,latitude numeric
,longitude numeric
,nam text
,cohorts_20160629 text
,clr_canvass text
,cohorts_20160803 text
,reg_status text
,cohorts_20160909 text
,cohorts_20160914 text
,clr_universe_penetration text
,cffw_canvass text
,vote_history text
);
copy voterfiles_van.december2016 from '/users/garrett/desktop/import2.txt' with csv header delimiter as '	' encoding 'windows-1251';

select count(*) from voterfiles_van.december2016;