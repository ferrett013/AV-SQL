drop table if exists contact_history.v2015;
CREATE TABLE contact_history.v2015 (vanid integer
,dwid integer
,votername varchar
,resultshortname varchar
,createdby varchar
,canvassedby varchar
,iscanvasser boolean
,committeename varchar
,datecreated date
,datecanvassed date
,contacttypename varchar
,campaignname varchar
,content varchar
,inputtypename varchar);
COPY contact_history.v2015 FROM '/Users/Garrett/Desktop/export.txt' WITH CSV HEADER DELIMITER AS '	' encoding 'windows-1251';