drop table if exists shapefiles.june2016geom;
drop table if exists shapefiles.precincts_pop_centroid;
drop table if exists shapefiles.june2016precinctmatch;
drop table if exists shapefiles.precincts_centroid;

--Create Geo Table of voterfile--
create table shapefiles.june2016geom as select vanid
,countyname
,vanprecinct
,(substring(vanprecinct from 6 for 1)||substring(vanprecinct from 11 for 2)||substring(vanprecinct from 17 for 2)||substring(vanprecinct from 25 for 2)||substring(vanprecinct from 31 for 3))::numeric as precinct_int
,longitude
,latitude
,st_setsrid(st_makepoint(longitude,latitude),4269) as geom
from voterfiles_van.june2016
;

alter table shapefiles.june2016geom add column id serial primary key;
create index idx_geom on shapefiles.june2016geom using gist(geom);

--Create table for spatial match to precincts--
create table shapefiles.june2016precinctmatch as select vanid, countyname, precinct_int, precinct_name as shape_precinct, vanprecinct as van_precinct, longitude, latitude, a.geom
from shapefiles.june2016geom a, shapefiles.precincts b
where st_contains(b.geom,a.geom)
;

--Delete geocodes outside of their precinct assignment--
delete from shapefiles.june2016precinctmatch where precinct_int <> shape_precinct;

--Create centroid by averaging geocodes--
create table shapefiles.precincts_pop_centroid as select countyname
,van_precinct
,precinct_int
,avg(longitude) as longitude
,avg(latitude) as latitude
,st_setsrid(st_makepoint(avg(longitude),avg(latitude)),4269) as geom
from shapefiles.june2016precinctmatch
where precinct_int <> 9999999999
group by 1,2,3
order by 1,2,3;

alter table shapefiles.precincts_pop_centroid add column id serial primary key;
create index pop_centroid_idx on shapefiles.precincts_pop_centroid using gist(geom);

--Exclude those without a precinct assignment--
delete from shapefiles.precincts_pop_centroid where van_precinct is null;

--Create table of population centroid and add in geo centroids where they don't exist--
create table shapefiles.precincts_centroid as select countyname, van_precinct, precinct_int, longitude, latitude, geom from shapefiles.precincts_pop_centroid;
insert into shapefiles.precincts_centroid select county as countyname
,precinct_van as van_precinct
,precinct_name as precinct_int
,st_x(a.geom) as longitude
,st_y(a.geom) as latitude
,a.geom
from shapefiles.precincts_geo_centroid a
left join shapefiles.precincts_pop_centroid b on a.precinct_name=b.precinct_int
where b.precinct_int is null;

select count(*) from shapefiles.precincts_centroid;
select count(*) from shapefiles.precincts_geo_centroid;
select count(*) from shapefiles.precincts_pop_centroid;