--Create VSPC table--
--Leave this section in comments unless importing the locations for the first time--
/*
drop table if exists voting_locations.vspc_primary2016;
create table voting_locations.vspc_primary2016 (id int primary key
	,county text
	,location text
	,address text
	,schedule text
	,latitude numeric
	,longitude numeric
);

copy voting_locations.vspc_primary2016
	from '/Users/Garrett/Desktop/vspc.txt'
	with csv header delimiter as '	'
;

alter table voting_locations.vspc_primary2016 add column geom geometry;
update voting_locations.vspc_primary2016 set geom = st_setsrid(st_makepoint(longitude,latitude),4269);
--Create Dropbox table--
drop table if exists voting_locations.dropoff_primary2016;
create table voting_locations.dropoff_primary2016 (id int primary key
	,county text
	,location text
	,address text
	,schedule text
	,latitude numeric
	,longitude numeric
);

copy voting_locations.dropoff_primary2016
	from '/Users/Garrett/Desktop/dropoff.txt'
	with csv header delimiter as '	'
;

alter table voting_locations.dropoff_primary2016 add column geom geometry;
update voting_locations.dropoff_primary2016 set geom = st_setsrid(st_makepoint(longitude,latitude),4269);
*/

--Create assignment for VSPCs--
drop table if exists voting_locations.vspc_assignment_primary2016;
create table voting_locations.vspc_assignment_primary2016 as select *
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
		,st_distance(p.geom,st_setsrid(st_makepoint(l.longitude,l.latitude),4269)) as dist
		from shapefiles.precincts_centroid p
		inner join voting_locations.vspc_primary2016 l on btrim(p.countyname,' ') = btrim(l.county,' ')
	) j
)r
where r.rank = 1 and r.row = 1;
--Create assignment for Dropboxes--
drop table if exists voting_locations.dropoff_assignment_primary2016;
create table voting_locations.dropoff_assignment_primary2016 as select *
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
		,st_distance(p.geom,st_setsrid(st_makepoint(l.longitude,l.latitude),4269)) as dist
		from shapefiles.precincts_centroid p
		inner join voting_locations.dropoff_primary2016 l on btrim(p.countyname,' ') = btrim(l.county,' ')
	) j
)r
where r.rank = 1 and r.row = 1;

--Create table to visualize precinct location assignments (not neccesary)--
drop table if exists voting_locations.vspc_primary2016geo;
create table voting_locations.vspc_primary2016geo as select a.*, b.geom
from voting_locations.vspc_assignment_primary2016 a
join shapefiles.precincts b on a.precinct_int = b.precinct_name;

drop table if exists voting_locations.dropoff_primary2016geo;
create table voting_locations.dropoff_primary2016geo as select a.*, b.geom
from voting_locations.dropoff_assignment_primary2016 a
join shapefiles.precincts b on a.precinct_int = b.precinct_name;


--Individual level assignment--
drop table if exists voting_locations.vspc_individual_primary2016;
create table voting_locations.vspc_individual_primary2016 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
from voterfiles_van.june2016 a
join voting_locations.vspc_assignment_primary2016 b on a.vanprecinct = b.van_precinct;

drop table if exists voting_locations.dropoff_individual_primary2016;
create table voting_locations.dropoff_individual_primary2016 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
from voterfiles_van.june2016 a
join voting_locations.dropoff_assignment_primary2016 b on a.vanprecinct = b.van_precinct;

--Export to VAN upload files--
@export on;
@export set filename="/Users/Garrett/Desktop/vspc1.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_primary2016 order by loc_id, vanid asc limit 1000000;
@export set filename="/Users/Garrett/Desktop/vspc2.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_primary2016 order by loc_id, vanid asc offset 1000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/vspc3.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_primary2016 order by loc_id, vanid asc offset 2000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/vspc4.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_primary2016 order by loc_id, vanid asc offset 3000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/vspc5.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_primary2016 order by loc_id, vanid asc offset 4000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/vspc6.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.vspc_individual_primary2016 order by loc_id, vanid asc offset 5000000 limit 1000000;

@export set filename="/Users/Garrett/Desktop/dropbox1.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_primary2016 order by loc_id, vanid asc limit 1000000;
@export set filename="/Users/Garrett/Desktop/dropbox2.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_primary2016 order by loc_id, vanid asc offset 1000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/dropbox3.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_primary2016 order by loc_id, vanid asc offset 2000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/dropbox4.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_primary2016 order by loc_id, vanid asc offset 3000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/dropbox5.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_primary2016 order by loc_id, vanid asc offset 4000000 limit 1000000;
@export set filename="/Users/Garrett/Desktop/dropbox6.txt" CsvRowDelimiter=\r\n;
select vanid, location, address, schedule from voting_locations.dropoff_individual_primary2016 order by loc_id, vanid asc offset 5000000 limit 1000000;
@export off;