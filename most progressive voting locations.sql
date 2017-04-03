@export on;
@export set filename="/Users/Garrett/Desktop/2016-11-07 progressive dropoff.txt" ShowNullAs="";
select id, location, address, schedule
,avg(cat_vci_2016) as avg_vci
,avg(cat_vprop2_2016) as avg_vprop
,avg(avgotv_model) as avg_gotv
,avg(cat_partisan_2016) as avg_partisanship
from voting_locations.dropoff_assignment_general2016 a
join ( 
	select vanprecinct as van_precinct, cat_vci_2016, cat_vprop2_2016, avgotv_model, cat_partisan_2016
	from voterfiles_van.octobermid2016
) b using (van_precinct)
group by 1,2,3,4
order by 5 desc
;
@export set filename="/Users/Garrett/Desktop/2016-11-07 progressive vspc.txt" ShowNullAs="";
select id, location, address, schedule
,avg(cat_vci_2016) as avg_vci
,avg(cat_vprop2_2016) as avg_vprop
,avg(avgotv_model) as avg_gotv
,avg(cat_partisan_2016) as avg_partisanship
from voting_locations.vspc_assignment_general2016 a
join ( 
	select vanprecinct as van_precinct, cat_vci_2016, cat_vprop2_2016, avgotv_model, cat_partisan_2016
	from voterfiles_van.octobermid2016
) b using (van_precinct)
group by 1,2,3,4
order by 5 desc