drop table if exists shapefiles.precincts_geo_centroid;
create table shapefiles.precincts_geo_centroid as 
select county
,precinct_name
,precinct_van
,st_setsrid(st_makepoint(avg(st_x(geom)),avg(st_y(geom))),4269) as geom
from (
	select county
	,precinct_name
	,precinct_van
	,ST_Centroid(geom) as geom
	from shapefiles.precincts
) a
where precinct_name <> 9999999999
group by 1,2,3
;