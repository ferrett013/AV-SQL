drop table if exists contact_history.voter_education1;
create table contact_history.voter_education1 (vanid int
        ,envname text
        ,mcity text
        ,mstate text
        ,mzip5 text
        ,mzip4 text
        ,maddress text
        ,dwid int
);

copy contact_history.voter_education1
        from '/users/garrett/desktop/import.txt'
        with csv header delimiter as '	'
;

drop table if exists contact_history.voter_education_sd;
create table contact_history.voter_education_sd (sd int
        ,sd_candidate_raw text
        ,sd_candidate text
);

copy contact_history.voter_education_sd
        from '/users/garrett/desktop/sd.csv'
        with csv header delimiter as ','
;

drop table if exists contact_history.voter_education_hd;
create table contact_history.voter_education_hd (hd int
        ,hd_candidate_raw text
        ,hd_candidate text
);

copy contact_history.voter_education_hd
        from '/users/garrett/desktop/hd.csv'
        with csv header delimiter as ',';
;

drop table if exists contact_history.voter_education;
create table contact_history.voter_education as select a.*, b.sd, b.hd, c.sd_candidate, d.hd_candidate
	,e.van_precinct as vspc_van_precinct, e.loc_id as vspc_loc_id, e.location as vspc_location, e.address as vspc_address, e.schedule as vspc_schedule
	,f.van_precinct as dropoff1_van_precinct, f.loc_id as dropoff1_loc_id, f.location as dropoff1_location, f.address as dropoff1_address, f.schedule as dropoff1_schedule
	,g.van_precinct as dropoff2_van_precinct, g.loc_id as dropoff2_loc_id, g.location as dropoff2_location, g.address as dropoff2_address, g.schedule as dropoff2_schedule
	,h.van_precinct as dropoff3_van_precinct, h.loc_id as dropoff3_loc_id, h.location as dropoff3_location, h.address as dropoff3_address, h.schedule as dropoff3_schedule
from contact_history.voter_education1 a
join voterfiles_van.october2016 b using (vanid)
left join contact_history.voter_education_sd c using (sd)
left join contact_history.voter_education_hd d using (hd)
left join voting_locations.vspc_individual_general2016rank1 e using (vanid)
left join voting_locations.dropoff_individual_general2016rank1 f using (vanid)
left join voting_locations.dropoff_individual_general2016rank2 g using (vanid)
left join voting_locations.dropoff_individual_general2016rank3 h using (vanid)
;

alter table contact_history.voter_education add column candidate text;
update contact_history.voter_education set candidate = coalesce(sd_candidate||' & '||hd_candidate,sd_candidate,hd_candidate);

select vanid, dwid, envname, maddress, mcity, mstate ,mzip5, mzip4, sd, hd, candidate
	,vspc_loc_id, vspc_location, vspc_address, vspc_schedule
	,dropoff1_loc_id, dropoff1_location, dropoff1_address, dropoff1_schedule
	,dropoff2_loc_id, dropoff2_location, dropoff2_address, dropoff2_schedule
	,dropoff3_loc_id, dropoff3_location, dropoff3_address, dropoff3_schedule
from contact_history.voter_education
where vspc_loc_id is not null
;

@export on;
@export set filename="/Users/Garrett/Desktop/2016-10-20 Voter Education Universe.txt" ShowNullAs="";
select vanid, dwid, envname, maddress, mcity, mstate ,mzip5, mzip4, sd, hd, candidate
	,vspc_loc_id, vspc_location, vspc_address, vspc_schedule
	,dropoff1_loc_id, dropoff1_location, dropoff1_address, dropoff1_schedule
	,dropoff2_loc_id, dropoff2_location, dropoff2_address, dropoff2_schedule
	,dropoff3_loc_id, dropoff3_location, dropoff3_address, dropoff3_schedule
from contact_history.voter_education
where vspc_loc_id is not null
;

