--Create VSPC table--
--Leave this section in comments unless importing the locations for the first time--
/*
drop table if exists voting_locations.vspc_general2016;
create table voting_locations.vspc_general2016 (id int primary key
	,county text
	,location text
	,address text
	,schedule text
	,latitude numeric
	,longitude numeric
	,wave text
);

copy voting_locations.vspc_general2016
	from '/Users/Garrett/Desktop/vspcmatch.txt'
	with csv header delimiter as '	'
;

alter table voting_locations.vspc_general2016 add column geom geometry;
update voting_locations.vspc_general2016 set geom = st_setsrid(st_makepoint(longitude,latitude),4269);
alter table voting_locations.vspc_general2016 add column row_num serial;
--Create Dropbox table--
drop table if exists voting_locations.dropoff_general2016;
create table voting_locations.dropoff_general2016 (id int primary key
	,county text
	,location text
	,address text
	,schedule text
	,latitude numeric
	,longitude numeric
	,wave text
);

copy voting_locations.dropoff_general2016
	from '/Users/Garrett/Desktop/dropoffmatch.txt'
	with csv header delimiter as '	'
;

alter table voting_locations.dropoff_general2016 add column geom geometry;
update voting_locations.dropoff_general2016 set geom = st_setsrid(st_makepoint(longitude,latitude),4269);
alter table voting_locations.dropoff_general2016 add column row_num serial;
*/

--Create assignment for VSPCs--
drop table if exists voting_locations.vspc_assignment_general2016;
create table voting_locations.vspc_assignment_general2016 as select *
from (
	select j.*
	,row_number()
        over (partition by j.van_precinct order by j.dist asc) as row
    ,rank()
        over (partition by j.van_precinct order by j.dist asc) as rank
    from (
		select p.countyname as prec_county
		,p.van_precinct
		,p.precinct_int
		,l.id
		,l.county as loc_county
		,l.location
		,l.address
		,l.schedule
		,l.row_num
		,st_distance(p.geom,st_setsrid(st_makepoint(l.longitude,l.latitude),4269)) as dist
		from shapefiles.precincts_centroid p
		inner join voting_locations.vspc_general2016 l on btrim(p.countyname,' ') = btrim(l.county,' ')
	) j
)r
where r.rank = 1 and r.row = 1;
--Create assignment for Dropboxes--
drop table if exists voting_locations.dropoff_assignment_general2016;
create table voting_locations.dropoff_assignment_general2016 as select *
from (
	select j.*
	,row_number()
        over (partition by j.van_precinct order by j.dist asc) as row
    ,rank()
        over (partition by j.van_precinct order by j.dist asc) as rank
    from (
		select p.countyname as prec_county
		,p.van_precinct
		,p.precinct_int
		,l.id
		,l.county as loc_county
		,l.location
		,l.address
		,l.schedule
		,l.row_num
		,st_distance(p.geom,st_setsrid(st_makepoint(l.longitude,l.latitude),4269)) as dist
		from shapefiles.precincts_centroid p
		inner join voting_locations.dropoff_general2016 l on btrim(p.countyname,' ') = btrim(l.county,' ')
	) j
)r
where r.rank = 1 and r.row = 1;

--Create table to visualize precinct location assignments (not neccesary)--
drop table if exists voting_locations.vspc_general2016geo;
create table voting_locations.vspc_general2016geo as select a.*, b.geom
from voting_locations.vspc_assignment_general2016 a
join shapefiles.precincts b on a.precinct_int = b.precinct_name;

drop table if exists voting_locations.dropoff_general2016geo;
create table voting_locations.dropoff_general2016geo as select a.*, b.geom
from voting_locations.dropoff_assignment_general2016 a
join shapefiles.precincts b on a.precinct_int = b.precinct_name;


--Individual level assignment--
drop table if exists voting_locations.vspc_individual_general2016;
create table voting_locations.vspc_individual_general2016 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
,b.row_num
from voterfiles_van.octobermid2016 a
join voting_locations.vspc_assignment_general2016 b on a.vanprecinct = b.van_precinct;

drop table if exists voting_locations.dropoff_individual_general2016;
create table voting_locations.dropoff_individual_general2016 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
,b.row_num
from voterfiles_van.octobermid2016 a
join voting_locations.dropoff_assignment_general2016 b on a.vanprecinct = b.van_precinct;

--Check Devisions--
select row_num, count(*) from voting_locations.vspc_individual_general2016 group by 1 order by 1;
select row_num, count(*) from voting_locations.dropoff_individual_general2016 group by 1 order by 1;


--Export to VAN upload files--
@export on;
@export set filename="/Users/Garrett/Desktop/vspc1.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_general2016 where row_num <50 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/vspc2.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_general2016 where row_num >=50 and row_num < 100 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/vspc3.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_general2016 where row_num >=100 and row_num < 150 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/vspc4.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_general2016 where row_num >=150 and row_num < 200 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/vspc5.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_general2016 where row_num >=200 and row_num < 250 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/vspc6.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_general2016 where row_num >=250 order by loc_id, vanid asc;


@export set filename="/Users/Garrett/Desktop/dropoff1.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_general2016 where row_num <50 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/dropoff2.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_general2016 where row_num >=50 and row_num < 100 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/dropoff3.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_general2016 where row_num >=100 and row_num < 150 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/dropoff4.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_general2016 where row_num >=150 and row_num < 200 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/dropoff5.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_general2016 where row_num >=200 and row_num < 250 order by loc_id, vanid asc;
@export set filename="/Users/Garrett/Desktop/dropoff6.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_general2016 where row_num >=250 order by loc_id, vanid asc;
@export off;