@stop on error;
DROP TABLE IF EXISTS survey_responses.lfp_id_2014;
CREATE TABLE survey_responses.lfp_id_2014 (VANID integer
,DWID integer
,FirstName varchar
,MiddleName varchar
,LastName varchar
,SurveyQuestionId integer
,SurveyResponseId integer
,Cycle integer
,SurveyQuestionType varchar
,SurveyQuestionLongName varchar
,SurveyResponseName varchar
,DateCreated date
,DateCanvassed date
,ContactType varchar
,CreatedBy varchar
,CanvassedBy varchar
,IsCanvasser boolean
,InputType varchar
,CommitteeName varchar
);

COPY survey_responses.lfp_id_2014 FROM '/Users/Garrett/Desktop/export1031091-16092333353.txt' WITH CSV HEADER DELIMITER AS '	' encoding 'windows-1251';