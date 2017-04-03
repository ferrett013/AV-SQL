select committeename, datecanvassed-extract(dow from datecanvassed+2)::int as "reporting_week", count(*)
	from contact_history.v2016 where contacttypename = 'Walk' 
	group by 1,2 order by 1,2