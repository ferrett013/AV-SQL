drop table if exists voting_locations.van_locations;
create table voting_locations.van_locations (vanid int primary key
	,dwid int
	,vspc_location text
	,vspc_address text
	,vspc_schedule text
	,dropoff_location text
	,dropoff_address text
	,dropoff_schedule text
);

copy voting_locations.van_locations
	from '/Users/Garrett/Desktop/import1.txt'
	with csv header delimiter as '	'
;

select count(case when vspc_location is null then 1 else null end) as vspc_loc
,count(case when vspc_address is null then 1 else null end) as vspc_add
,count(case when vspc_schedule is null then 1 else null end) as vspc_sch
from voting_locations.van_locations a
join voting_locations.vspc_individual_primary2016 b using (vanid)
where b.location is not null and b.address is not null and b.schedule is not null;
;

select count(case when dropoff_location is null then 1 else null end) as dropoff_loc
,count(case when dropoff_address is null then 1 else null end) as dropoff_add
,count(case when dropoff_schedule is null then 1 else null end) as dropoff_add
from voting_locations.van_locations a
join voting_locations.dropoff_individual_primary2016 b using (vanid)
where b.location is not null and b.address is not null and b.schedule is not null;


--Export Missing Fields--

/*@export on;
@export set filename="/Users/Garrett/Desktop/vspcscehdule.txt" CsvRowDelimiter=\r\n;
select vanid
,b.schedule
from voting_locations.van_locations a
join voting_locations.vspc_individual_primary2016 b using (vanid)
where b.location is not null and b.address is not null and b.schedule is not null and a.vspc_schedule is null;
*/

--Delete production tables--
/*
drop table if exists shapefiles.june2016geom;
drop table if exists shapefiles.june2016precinctmatch;
drop table if exists shapefiles.precincts_geo_centroid;
drop table if exists shapefiles.precincts_pop_centroid;
drop table if exists voting_locations.dropoff_individual_primary2016;
drop table if exists voting_locations.dropoff_primary2016geo;
drop table if exists voting_locations.vspc_individual_primary2016;
drop table if exists voting_locations.vspc_primary2016geo;
*/