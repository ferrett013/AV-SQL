drop table if exists contact_history.fsa_persuasion;
create table contact_history.fsa_persuasion (subjectid int
,vanid text
,campaignname text
,scriptname text
,grutransactionid int
,latitude numeric
,longitude numeric
,surveystarttime timestamp
,surveyendtime timestamp
,elapsedsurveytime int
,canvasser text
,securitygroup text
,crewname text
,datetime_canvassed timestamp 
,canvass_result text
,subjectsalutation text
,subjectsuffix text
,subjectfirstname text
,subjectlastname text
,subjectemail text
,subjectphone bigint
,subjectcellphone int
,subjectaddress text
,subjectapartment text
,subjectcity text
,subjectstate text
,subjectzip text
,subjecttract text
,externalid2 text
,externalid3 text
,salefinalamount text
,salepaymenttype text
,salerecurringtype text
,saleoverallstatus text
,calendarname text
,resourcename text
,appointmentstartdate text
,appointmentenddate text
,recipientname text
,recipientaddress text
,recipientaddress2 text
,recipientcity text
,recipientzip text
,recipientsalutation text
,recipientemail text
,recipientstate text
,recipienttargetzipcodes text
,first_name text
,contactinfo text
,president_id text
,president_reid text
,president_lean text
,senate_id text
,senate_reid text
,senate_lean text
,last_name text
,issue text
,other_issue text
,address text
,delivered_persuasion_message text
,apartment text
,pledge_card1 text
,pledge_card2 text
,vote_plan1 text
,pledge_email text
,pledge_cellphone text
,vote_plan2 text
,city text
,state text
,zip text
,home text
,cell text
,gender text
,cd int
,sd int
,hd int
,dwid int
,target text
,age int
,office_code text
,datecanvassed date
);

copy contact_history.fsa_persuasion from '/users/garrett/desktop/FSA_Persuasion_1010.csv' with csv header delimiter as ',';

select count(*) from contact_history.fsa_persuasion;
select * from contact_history.fsa_persuasion;

@export on;
@export set filename="/Users/Garrett/Desktop/fsa_persuasionexport.txt" CsvRowDelimiter=\r\n ShowNullAs="";
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
,coalesce(senate_id||senate_reid||senate_lean
	,senate_id||senate_lean
	,senate_id||senate_reid
	,senate_id
) as senate_id
,pledge_cellphone as cell_phone
,pledge_email as email
,coalesce(pledge_card1||pledge_card2,pledge_card1,pledge_card2) as pledge2vote
,coalesce(vote_plan1||vote_plan2,vote_plan1,vote_plan2) as vote_plan
,'x' as "Y"
from contact_history.fsa_persuasion
where right(vanid,1)<>'U'
;
@export off;

/*insert into contact_history.fsa select subjectid
,vanid
,campaignname
,scriptname
,grutransactionid
,latitude
,longitude
,surveystarttime
,surveyendtime
,elapsedsurveytime
,canvasser
,datetime_canvassed 
,canvass_result
,subjectsalutation
,subjectsuffix
,subjectfirstname
,subjectlastname
,subjectemail
,subjectphone
,subjectcellphone
,subjectaddress
,subjectapartment
,subjectcity
,subjectstate
,subjectzip
,subjecttract
,externalid2
,externalid3
,salefinalamount
,salepaymenttype
,salerecurringtype
,saleoverallstatus
,calendarname
,resourcename
,appointmentstartdate
,appointmentenddate
,recipientname
,recipientaddress
,recipientaddress2
,recipientcity
,recipientzip
,recipientsalutation
,recipientemail
,recipientstate
,recipienttargetzipcodes
,first_name
,contactinfo
,president_id
,president_reid
,president_lean
,senate_id
,senate_reid
,senate_lean
,last_name
,issue
,other_issue
,address
,delivered_persuasion_message
,apartment
,pledge_card1
,pledge_card2
,vote_plan1
,pledge_email
,pledge_cellphone
,vote_plan2
,city
,state
,zip
,home
,cell
,gender
,cd
,sd
,hd
,dwid
,target
,age
,office_code
,null as check_for_literature_delivery
,datecanvassed
,securitygroup
,crewname
	from contact_history.fsa_persuasion;