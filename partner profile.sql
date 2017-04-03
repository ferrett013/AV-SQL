drop table if exists partner_profiles.sierra;

create table partner_profiles.sierra (vanid int, dwid int, voter_id int);

copy partner_profiles.sierra
from '/Users/Garrett/Desktop/import.txt'
with csv header delimiter as '	'
;

select vote_date, count(*) from partner_profiles.sierra a
join (select voter_id, received as vote_date from early_voters.ce18_2016 a
union all
select voter_id, vote_date from early_voters.ce19_2016 b
) b using (voter_id)
group by 1 order by 1
;

drop table if exists partner_profiles.sierra_map;

create table partner_profiles.sierra_map as
select b.name as countyname, coalesce(mem_count,0) as mem_count, geom from shapefiles.counties b 
left join (
        select countyname, count(*) as mem_count from partner_profiles.sierra a
        join voterfiles_van.december2016 b using (vanid)
        where reg_status in ('Active','Inactive')
        group by 1 order by 1
) a on b.name=a.countyname
order by 1
;

select * from partner_profiles.sierra_map;