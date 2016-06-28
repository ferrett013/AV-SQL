CREATE TABLE roads.road_meters_precinct AS
SELECT precinct_name, SUM(len_meters)
FROM roads.tertiary_roads_buffer, shapefiles.precincts
WHERE ST_Within(tertiary_roads_buffer.geom, precincts.geom)
GROUP BY 1
;