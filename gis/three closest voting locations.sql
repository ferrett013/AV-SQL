--Create VSPC table--
--Leave this section in comments unless importing the locations for the first time--

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


--Create assignment for VSPCs--
drop table if exists voting_locations.vspc_assignment_general2016_rank1;
create table voting_locations.vspc_assignment_general2016_rank1 as select *
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
		where l.wave in ('Wave 1','Wave 2','Wave 3')
	) j
)r
where r.rank = 1 and r.row = 1;
--Create assignment for Dropboxes--
drop table if exists voting_locations.dropoff_assignment_general2016ranked;
create table voting_locations.dropoff_assignment_general2016ranked as select *
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
		where l.wave in ('Wave 1','Wave 2','Wave 3')
	) j
)r
where r.rank in (1,2,3) and r.row in (1,2,3);

drop table if exists voting_locations.dropoff_assignment_general2016rank1;
create table voting_locations.dropoff_assignment_general2016rank1 as
	select * from voting_locations.dropoff_assignment_general2016ranked where rank = 1;

drop table if exists voting_locations.dropoff_assignment_general2016rank2;
create table voting_locations.dropoff_assignment_general2016rank2 as
	select * from voting_locations.dropoff_assignment_general2016ranked where rank = 2;

drop table if exists voting_locations.dropoff_assignment_general2016rank3;
create table voting_locations.dropoff_assignment_general2016rank3 as
	select * from voting_locations.dropoff_assignment_general2016ranked where rank = 3;


--Individual level assignment--
drop table if exists voting_locations.vspc_individual_general2016rank1;
create table voting_locations.vspc_individual_general2016rank1 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
,b.row_num
from voterfiles_van.october2016 a
join voting_locations.vspc_assignment_general2016_rank1 b on a.vanprecinct = b.van_precinct;

drop table if exists voting_locations.dropoff_individual_general2016rank1;
create table voting_locations.dropoff_individual_general2016rank1 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
,b.row_num
from voterfiles_van.october2016 a
join voting_locations.dropoff_assignment_general2016rank1 b on a.vanprecinct = b.van_precinct;

drop table if exists voting_locations.dropoff_individual_general2016rank2;
create table voting_locations.dropoff_individual_general2016rank2 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
,b.row_num
from voterfiles_van.october2016 a
join voting_locations.dropoff_assignment_general2016rank2 b on a.vanprecinct = b.van_precinct;

drop table if exists voting_locations.dropoff_individual_general2016rank3;
create table voting_locations.dropoff_individual_general2016rank3 as select a.vanid
,b.prec_county
,b.van_precinct
,b.id as loc_id
,b.location
,b.address
,b.schedule
,b.row_num
from voterfiles_van.october2016 a
join voting_locations.dropoff_assignment_general2016rank3 b on a.vanprecinct = b.van_precinct;