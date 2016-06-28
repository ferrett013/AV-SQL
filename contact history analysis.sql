@export on;
@export set filename ="/Users/Garrett/Desktop/HDWalk.xls" Format="xls";

SELECT hd
,COUNT(CASE WHEN resultshortname='Canvassed' THEN 1 ELSE NULL END) AS "Canvassed"
,COUNT(CASE WHEN resultshortname='Come Back' THEN 1 ELSE NULL END) AS "Come Back"
,COUNT(CASE WHEN resultshortname='Deceased' THEN 1 ELSE NULL END) AS "Deceased"
,COUNT(CASE WHEN resultshortname='Do Not Solicit' THEN 1 ELSE NULL END) AS "Do Not Solicit"
,COUNT(CASE WHEN resultshortname='Do Not Walk' THEN 1 ELSE NULL END) AS "Do Not Walk"
,COUNT(CASE WHEN resultshortname='Inaccessible' THEN 1 ELSE NULL END) AS "Inaccessible"
,COUNT(CASE WHEN resultshortname='Language Barrier' THEN 1 ELSE NULL END) AS "Language Barrier"
,COUNT(CASE WHEN resultshortname='Moved' THEN 1 ELSE NULL END) AS "Moved"
,COUNT(CASE WHEN resultshortname='Non-Address' THEN 1 ELSE NULL END) AS "Non-Address"
,COUNT(CASE WHEN resultshortname='Not Home' THEN 1 ELSE NULL END) AS "Not Home"
,COUNT(CASE WHEN resultshortname='Refused' THEN 1 ELSE NULL END) AS "Refused"
,COUNT(CASE WHEN resultshortname NOT IN ('Canvassed','Come Back','Deceased','Do Not Solicit','Do Not Walk','Inaccessible','Language Barrier','Moved','Non-Address','Not Home','Refused') THEN 1 ELSE NULL END) AS "Other"
,COUNT(*) AS "Total"
FROM (
	SELECT hd
	,resultshortname
	FROM contact_history.cdp2014 a
	JOIN (
		SELECT statefileid, MAX(hd) AS hd
		FROM voterfiles_van.vanid_statefileid_august2015
		WHERE vanid IS NOT NULL
		GROUP BY 1
	)b USING (statefileid)
	WHERE contacttypename = 'Walk'


	UNION ALL
	SELECT hd
	,resultshortname
	FROM contact_history.v2014 a
	JOIN voterfiles_van.vanid_statefileid_august2015 b USING (vanid)
	WHERE contacttypename = 'Walk'
) a
GROUP BY 1
ORDER BY 1
;

@export set filename ="/Users/Garrett/Desktop/HDPhone.xls" Format="xls";

SELECT hd
,COUNT(CASE WHEN resultshortname='Busy' THEN 1 ELSE NULL END) AS "Busy"
,COUNT(CASE WHEN resultshortname='Call Back' THEN 1 ELSE NULL END) AS "Call Back"
,COUNT(CASE WHEN resultshortname='Canvassed' THEN 1 ELSE NULL END) AS "Canvassed"
,COUNT(CASE WHEN resultshortname='Deceased' THEN 1 ELSE NULL END) AS "Deceased"
,COUNT(CASE WHEN resultshortname='Disconnected' THEN 1 ELSE NULL END) AS "Disconnected"
,COUNT(CASE WHEN resultshortname='Do Not Call' THEN 1 ELSE NULL END) AS "Do Not Call"
,COUNT(CASE WHEN resultshortname='Language Barrier' THEN 1 ELSE NULL END) AS "Language Barrier"
,COUNT(CASE WHEN resultshortname='Left Message' THEN 1 ELSE NULL END) AS "Left Message"
,COUNT(CASE WHEN resultshortname='Moved' THEN 1 ELSE NULL END) AS "Moved"
,COUNT(CASE WHEN resultshortname='Refused' THEN 1 ELSE NULL END) AS "Refused"
,COUNT(CASE WHEN resultshortname='Wrong Number' THEN 1 ELSE NULL END) AS "Wrong Number"
,COUNT(CASE WHEN resultshortname='Not Home' THEN 1 ELSE NULL END) AS "Not Home"
,COUNT(CASE WHEN resultshortname NOT IN ('Busy','Call Back','Canvassed','Deceased','Disconnected','Do Not Call','Language Barrier','Left Message','Moved','Refused','Wrong Number','Not Home') THEN 1 ELSE NULL END) AS "Other"
,COUNT(*) AS "Total"
FROM (
	SELECT hd
	,resultshortname
	FROM contact_history.v2014 a
	JOIN voterfiles_van.vanid_statefileid_august2015 b USING (vanid)
	WHERE contacttypename = 'Phone'
) a
GROUP BY 1
ORDER BY 1
;

@export set filename ="/Users/Garrett/Desktop/SDWalk.xls" Format="xls";

SELECT sd
,COUNT(CASE WHEN resultshortname='Canvassed' THEN 1 ELSE NULL END) AS "Canvassed"
,COUNT(CASE WHEN resultshortname='Come Back' THEN 1 ELSE NULL END) AS "Come Back"
,COUNT(CASE WHEN resultshortname='Deceased' THEN 1 ELSE NULL END) AS "Deceased"
,COUNT(CASE WHEN resultshortname='Do Not Solicit' THEN 1 ELSE NULL END) AS "Do Not Solicit"
,COUNT(CASE WHEN resultshortname='Do Not Walk' THEN 1 ELSE NULL END) AS "Do Not Walk"
,COUNT(CASE WHEN resultshortname='Inaccessible' THEN 1 ELSE NULL END) AS "Inaccessible"
,COUNT(CASE WHEN resultshortname='Language Barrier' THEN 1 ELSE NULL END) AS "Language Barrier"
,COUNT(CASE WHEN resultshortname='Moved' THEN 1 ELSE NULL END) AS "Moved"
,COUNT(CASE WHEN resultshortname='Non-Address' THEN 1 ELSE NULL END) AS "Non-Address"
,COUNT(CASE WHEN resultshortname='Not Home' THEN 1 ELSE NULL END) AS "Not Home"
,COUNT(CASE WHEN resultshortname='Refused' THEN 1 ELSE NULL END) AS "Refused"
,COUNT(CASE WHEN resultshortname NOT IN ('Canvassed','Come Back','Deceased','Do Not Solicit','Do Not Walk','Inaccessible','Language Barrier','Moved','Non-Address','Not Home','Refused') THEN 1 ELSE NULL END) AS "Other"
,COUNT(*) AS "Total"
FROM (
	SELECT sd
	,resultshortname
	FROM contact_history.cdp2014 a
	JOIN (
		SELECT statefileid, MAX(sd) AS sd
		FROM voterfiles_van.vanid_statefileid_august2015
		WHERE vanid IS NOT NULL
		GROUP BY 1
	) b USING (statefileid)	WHERE contacttypename = 'Walk'
	UNION ALL
	SELECT sd
	,resultshortname
	FROM contact_history.v2014 a
	JOIN voterfiles_van.vanid_statefileid_august2015 b USING (vanid)
	WHERE contacttypename = 'Walk'
) a
GROUP BY 1
ORDER BY 1
;

@export set filename ="/Users/Garrett/Desktop/SDPhone.xls" Format="xls";

SELECT sd
,COUNT(CASE WHEN resultshortname='Busy' THEN 1 ELSE NULL END) AS "Busy"
,COUNT(CASE WHEN resultshortname='Call Back' THEN 1 ELSE NULL END) AS "Call Back"
,COUNT(CASE WHEN resultshortname='Canvassed' THEN 1 ELSE NULL END) AS "Canvassed"
,COUNT(CASE WHEN resultshortname='Deceased' THEN 1 ELSE NULL END) AS "Deceased"
,COUNT(CASE WHEN resultshortname='Disconnected' THEN 1 ELSE NULL END) AS "Disconnected"
,COUNT(CASE WHEN resultshortname='Do Not Call' THEN 1 ELSE NULL END) AS "Do Not Call"
,COUNT(CASE WHEN resultshortname='Language Barrier' THEN 1 ELSE NULL END) AS "Language Barrier"
,COUNT(CASE WHEN resultshortname='Left Message' THEN 1 ELSE NULL END) AS "Left Message"
,COUNT(CASE WHEN resultshortname='Moved' THEN 1 ELSE NULL END) AS "Moved"
,COUNT(CASE WHEN resultshortname='Refused' THEN 1 ELSE NULL END) AS "Refused"
,COUNT(CASE WHEN resultshortname='Wrong Number' THEN 1 ELSE NULL END) AS "Wrong Number"
,COUNT(CASE WHEN resultshortname='Not Home' THEN 1 ELSE NULL END) AS "Not Home"
,COUNT(CASE WHEN resultshortname NOT IN ('Busy','Call Back','Canvassed','Deceased','Disconnected','Do Not Call','Language Barrier','Left Message','Moved','Refused','Wrong Number','Not Home') THEN 1 ELSE NULL END) AS "Other"
,COUNT(*) AS "Total"
FROM (
	SELECT sd
	,resultshortname
	FROM contact_history.v2014 a
	JOIN voterfiles_van.vanid_statefileid_august2015 b USING (vanid)
	WHERE contacttypename = 'Phone'
) a
GROUP BY 1
ORDER BY 1
;

@export off;