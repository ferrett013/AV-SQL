select case
	when 2016-birth_year <=25 then '18-25'
	when 2016-birth_year > 25 and 2016-birth_year <=35 then '26-35'
	when 2016-birth_year > 35 and 2016-birth_year <=45 then '36-45'
	when 2016-birth_year > 45 and 2016-birth_year <=55 then '46-55'
	when 2016-birth_year > 55 and 2016-birth_year <=65 then '56-65'
	when 2016-birth_year >65 then '65+' 
	else null end
	,count(*)
	from voterfiles_sos.september2016
	where status_code= 'I'
	group by 1