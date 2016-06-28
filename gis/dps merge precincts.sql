CREATE TABLE school_districts.denver AS
SELECT district
,ST_MULTI(ST_UNION(geom)) AS geom
FROM shapefiles.precincts a
INNER JOIN public.denver_district_precincts b ON a.precinct_name = b.precinct
GROUP BY 1
ORDER BY 1