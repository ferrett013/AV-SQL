@export on;
@export set filename="/Users/Garrett/Desktop/2016-10-17 GOTV Precinct Counts.txt" ShowNullAs="";
select vanprecinct, count(*) as gotv, avg(cat_vprop2_2016) as avg_vprop
from early_voters.gotv2016 a
left join voterfiles_van.octobermid2016 b using (vanid)
group by 1 order by 1