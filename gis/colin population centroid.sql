
----------DBF table from ArcGIS----------
create table sp_co_oconnorc.geoprecincts14 (FID int, Countyid int, County varchar(50), CD int,SD int, HD int, Prec2012 varchar(15), P3 int, OBJECTID_1 int, Lat float, Long float);
copy sp_co_oconnorc.geoprecincts14 
from local 'C:\Users\Colin\Documents\CDP\General 2014\VoterProtection\GeoPrecincts14.csv' 
with delimiter E'\,' skip 1 abort on error;

---------Voting Population from analytics_co.person----------
create table sp_co_oconnorc.geovotingpop14 (county_n varchar(20), vanprecid int, lat float, long float, voters int);
Insert into sp_co_oconnorc.geovotingpop14 (county_n, vanprecid, lat, long, voters)
select p.county_name, p.VANPrecinctID, AVG(latitude), AVG(longitude), count(p.PersonID) as 'people'
from analytics_co.person p
where p.is_merged = false and p.is_current_reg = true and p.reg_voter_flag = true
group by p.county_name, p.VANPrecinctID
order by p.county_name, p.VANPrecinctID
;

-----------Current APPROVED VOTING LOCATIONS General 2014-----------
create table sp_co_oconnorc.geogenlocations14 (id int, name varchar(200), type varchar(200), address varchar(150), city varchar(60), state char(2), zip varchar(12), county varchar(50), latitude float, longitude float);
copy sp_co_oconnorc.geogenlocations14 
from local 'C:\Users\Colin\Documents\CDP\General 2014\VoterProtection\2014 Gen Approved VSPCs\VotingLoc_LD918.txt' 
with delimiter E'\t'  skip 1 abort on error;

------------CALC Precinct Centroid-----------
select *
FROM (
SELECT j.id, j.name, j.Countyid, j.Prec2012, j.Dist, RANK()
                OVER (PARTITION BY j.Prec2012 ORDER BY j.Dist) AS RANK
                FROM (
select p.*,l.*, sqrt(power((p.Lat-l.latitude),2)+power((p.Long-l.longitude),2)) Dist
from sp_co_oconnorc.geoprecincts14 p
inner join sp_co_oconnorc.geogenlocations14 l on btrim(p.County,' ') = btrim(l.county,' ')
) j
)r
Where r.RANK = 1;

-------------CALC Pop Centroid-----------
select *
FROM (
SELECT j.id, j.name, j.county_n, j.vanprecid, j.Dist, RANK()
                OVER (PARTITION BY j.vanprecid ORDER BY j.Dist) AS RANK
                FROM (
select p.*,l.*, sqrt(power((p.lat-l.latitude),2)+power((p.long-l.longitude),2)) Dist
from sp_co_oconnorc.geovotingpop14 p
inner join sp_co_oconnorc.geogenlocations14 l on btrim(p.county_n,' ') = btrim(l.county,' ')
) j
)r
Where r.RANK = 1;
