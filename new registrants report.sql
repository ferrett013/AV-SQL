@export on;
@export set filename ="/Users/Garrett/Desktop/Picked Up.xls" Format="xls";
SELECT a.congressional AS "CD"
,a.county AS "County"
,a.state_senate AS "SD"
,a.state_house AS "HD"

,COUNT(CASE WHEN a.registration_date >= '2015-10-01' AND a.party = 'DEM' THEN 1 ELSE NULL END) AS new_reg_dem
,COUNT(CASE WHEN a.registration_date >= '2015-10-01' AND a.party = 'REP' THEN 1 ELSE NULL END) AS new_reg_rep
,COUNT(CASE WHEN a.registration_date >= '2015-10-01' AND a.party = 'UAF' THEN 1 ELSE NULL END) AS new_reg_uaf
,COUNT(CASE WHEN a.registration_date >= '2015-10-01' AND a.party IN ('ACN','GRN','LBR','UNI') THEN 1 ELSE NULL END) AS new_reg_3rd

,COUNT(CASE WHEN a.registration_date < '2015-10-01' AND a.party = 'DEM' THEN 1 ELSE NULL END) AS re_reg_dem
,COUNT(CASE WHEN a.registration_date < '2015-10-01' AND a.party = 'REP' THEN 1 ELSE NULL END) AS re_reg_rep
,COUNT(CASE WHEN a.registration_date < '2015-10-01' AND a.party = 'UAF' THEN 1 ELSE NULL END) AS re_reg_uaf
,COUNT(CASE WHEN a.registration_date < '2015-10-01' AND a.party IN ('ACN','GRN','LBR','UNI') THEN 1 ELSE NULL END) AS re_reg_3rd

FROM voterfiles_sos.november2015 a
LEFT JOIN voterfiles_sos.october2015 b USING (voter_id)
WHERE b.voter_id IS NULL
GROUP BY 1,2,3,4
ORDER BY 1,2,3,4
;

@export set filename ="/Users/Garrett/Desktop/Dropped.xls" Format="xls";
SELECT a.congressional AS "CD"
,a.county AS "County"
,a.state_senate AS "SD"
,a.state_house AS "HD"

,COUNT(CASE WHEN a.party = 'DEM' THEN 1 ELSE NULL END) AS dropped_dem
,COUNT(CASE WHEN a.party = 'REP' THEN 1 ELSE NULL END) AS dropped_rep
,COUNT(CASE WHEN a.party = 'UAF' THEN 1 ELSE NULL END) AS dropped_uaf
,COUNT(CASE WHEN a.party IN ('ACN','GRN','LBR','UNI') THEN 1 ELSE NULL END) AS dropped_3rd

FROM voterfiles_sos.october2015 a
LEFT JOIN voterfiles_sos.november2015 b USING (voter_id)
WHERE b.voter_id IS NULL
GROUP BY 1,2,3,4
ORDER BY 1,2,3,4
;

@export set filename ="/Users/Garrett/Desktop/Total.xls" Format="xls";
SELECT a.congressional AS "CD"
,a.county AS "County"
,a.state_senate AS "SD"
,a.state_house AS "HD"

,COUNT(CASE WHEN a.party = 'DEM' THEN 1 ELSE NULL END) AS total_dem
,COUNT(CASE WHEN a.party = 'REP' THEN 1 ELSE NULL END) AS total_rep
,COUNT(CASE WHEN a.party = 'UAF' THEN 1 ELSE NULL END) AS total_uaf
,COUNT(CASE WHEN a.party IN ('ACN','GRN','LBR','UNI') THEN 1 ELSE NULL END) AS total_3rd

FROM voterfiles_sos.november2015 a
GROUP BY 1,2,3,4
ORDER BY 1,2,3,4
;

@export off;

SELECT party, registrants FROM (
	SELECT CASE WHEN party IN ('ACN','GRN','LBR','UNI') THEN '3rd Party'
		WHEN party = 'DEM' THEN 'Democratic'
		WHEN party = 'REP' THEN 'Republican'
		WHEN party = 'UAF' THEN 'Unaffiliated'
		ELSE party END AS party
	,COUNT(*) AS registrants FROM voterfiles_sos.november2015 a
	GROUP BY 1
) a
ORDER BY CASE WHEN party = 'Democratic' THEN 1
	WHEN party = 'Republican' THEN 2
	WHEN party = 'Unaffiliated' THEN 3
	WHEN party = '3rd Party' THEN 4
END;

@beep;