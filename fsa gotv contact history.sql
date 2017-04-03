drop table if exists contact_history.fsa_week;
create table contact_history.fsa_week (subjectid int
,vanid text
,campaign_name text
,script_name text
,grutransid int
,latitude numeric
,longitude numeric
,survey_start_time timestamp
,survey_end_time timestamp
,elapsedsurveytime int
,canvasser text
,securitygroup text
,crewname text
,datetime_canvassed timestamp
,canvass_result text
,subjectsal text
,subjectsuffix text
,firstname text
,lastname text
,email text
,phone text
,cell text
,address text
,apt text
,city text
,state text
,zip text
,geoname text
,blank_1 text
,blank_2 text
,blank_3 text
,blank_4 text
,blank_5 text
,blank_6 text
,blank_7 text
,blank_8 text
,blank_9 text
,blank_10 text
,blank_11 text
,blank_12 text
,blank_13 text
,blank_14 text
,blank_15 text
,blank_16 text
,blank_17 text
,blank_18 text
,blank_19 text
,blank_20 text
,blank_21 text
,president_id text
,president_reid text
,president_lean text
,last_name_2 text
,issue text
,address2 text
,pledge_confirm text
,apartment2 text
,pledge_card1 text
,vote_plan_1 text
,vote_plan_2 text
,loc text
,drop_address text
,city2 text
,drop_sched text
,plan_question text
,date_voting text
,e_day text
,state2 text
,phone_email text
,pledge_email text
,pledge_phone text
,zip2 text
,home_ph text
,cell_ph text
,voter_id_3 text
,voter_id_4 text
,lean2 text
,other_issue text
,delivered_persuade text
,drop_location text
,pledge_card_ask_2 text
,gender text
,cd text
,sd text
,hd text
,dwid text
,target text
,age text
,office_code text
,drop_name2 text
,drop_addr2 text
,drop_sched2 text
,date_canvassed text
,pass text
,vote_plan_formatted text
);

copy contact_history.fsa_week from '/users/garrett/desktop/FSA_1108.csv' with csv header delimiter as ',';

select count(*) from contact_history.fsa_week;
select * from contact_history.fsa_week;

@export on;
@export set filename="/Users/Garrett/Desktop/fsa_weekexport.txt" CsvRowDelimiter=\r\n ShowNullAs="";
select distinct vanid
,canvasser
,datetime_canvassed::date as date_canvassed
,canvass_result
,issue
,coalesce(president_id||president_reid||president_lean
 ,president_id||president_lean
 ,president_id||president_reid
 ,president_id
) as president_id
,pledge_phone as cell_phone
,pledge_email as email
,pledge_card1
,coalesce(plan_question) as vote_plan
,'x' as "Y"
from contact_history.fsa_week
where right(vanid,1)<>'U'
;
@export off;

/*insert into contact_history.fsa_gotv2 select *
from contact_history.fsa_week;