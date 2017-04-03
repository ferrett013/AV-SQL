drop table if exists public.survey_questions2016;
create table public.survey_questions2016 (vanid int
,dwid int
,firstname text
,middlename text
,lastname text
,surveyquestionid int
,surveyresponseid int
,cycle int
,surveyquestiontype text
,surveyquestionlongname text
,surveyresponsename text
,datecreated date
,datecanvassed date
,contacttype text
,createdby text
,canvassedby text
,iscanvasser boolean
,inputtype text
,committeename text
);

copy public.survey_questions2016 from '/Users/Garrett/Desktop/import2.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-1788165532.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-4418999996.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-4772556592.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-6021955229.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-6476349436.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-10587358882.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-12207208213.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-14086978941.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-14486312651.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-15624331428.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-15979190224.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-20729619236.txt' with csv header delimiter as '	';
copy public.survey_questions2016 from '/Users/Garrett/Desktop/export1031091-21308336193.txt' with csv header delimiter as '	';

drop table if exists public.contact_history2016;
create table public.contact_history2016 (VANID int
,DWID int
,VoterName text
,ResultShortName text
,CreatedBy text
,CanvassedBy text
,IsCanvasser boolean
,CommitteeName text
,DateCreated date
,DateCanvassed date
,ContactTypeName text
,InputTypeName text
);

copy public.contact_history2016
from '/Users/Garrett/Desktop/import2.txt'
with csv header delimiter as '	'
;

select committeename, count(*) from public.contact_history2016 where contacttypename = 'Walk'
and committeename not in ('America Votes','Fair Share Alliance','Inactive Test','NARAL CO','SEIU MPO','CoCo (c4)')
and canvassedby not in ('Canvasser, Circ Pueblo','Canvasser, Circ Weld','Canvasser, Cog Vended','Canvasser, Cog Vended','Canvasser, Cpa')
group by 1 order by 1