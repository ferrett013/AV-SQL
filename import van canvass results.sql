drop table if exists contact_history.v2016;
create table contact_history.v2016 (vanid integer
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
copy contact_history.v2016 from '/users/garrett/desktop/import.txt' with csv header delimiter as '	' encoding 'windows-1251';