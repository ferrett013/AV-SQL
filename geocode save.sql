select distinct vhhid
,vaddress
,vcity
,vstate
,vzip5
,vzip4
from voterfiles_van.july2016 a
join voterfiles_van.july2016_active b using (vanid)
where latitude is null and longitude is null and
countyname in ('Adams',
'Arapahoe',
'Boulder',
'Broomfield',
'Denver',
'Douglas',
'El Paso',
'Garfield',
'Jefferson',
'La Plata',
'Larimer',
'Mesa',
'Pueblo',
'Weld')
order by 1
offset 117500
limit 2500