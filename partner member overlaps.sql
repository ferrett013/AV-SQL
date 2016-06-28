drop schema if exists 
research cascade;
create schema research;

create table research.partner_overlap_leg (vanid integer primary key
,dwid integer
,cd varchar
,sd varchar
,hd varchar
);

COPY research.partner_overlap_leg
FROM '/Users/Garrett/Desktop/StandardText20150925-9663784452.txt'
WITH CSV HEADER DELIMITER AS '	' encoding 'windows-1251';

create table research.partner_overlap (VANID integer
,DWID integer
,ActivistCodeID integer
,ActivistCodeType varchar
,ActivistCodeName varchar
,ActivistCodeDescription varchar
,DateCreated date
,DateCanvassed date
,Scope varchar
,CreatedBy varchar
,CanvassedBy varchar
,InputType varchar
,Committeename varchar
);

COPY research.partner_overlap
FROM '/Users/Garrett/Desktop/export1031091-11779286974.txt'
WITH CSV HEADER DELIMITER AS '	' encoding 'windows-1251';

select hd

,count(case when aft='x' and cea='x' then vanid else null end) as aft_cea
,count(case when aft='x' and circ='x' then vanid else null end) as aft_circ
,count(case when aft='x' and coco='x' then vanid else null end) as aft_coco
,count(case when aft='x' and cpa='x' then vanid else null end) as aft_cpa
,count(case when aft='x' and ctla='x' then vanid else null end) as aft_ctla
,count(case when aft='x' and greatered='x' then vanid else null end) as aft_greatered
,count(case when aft='x' and naral='x' then vanid else null end) as aft_naral
,count(case when aft='x' and newera='x' then vanid else null end) as aft_newera
,count(case when aft='x' and oneco='x' then vanid else null end) as aft_oneco
,count(case when aft='x' and pp='x' then vanid else null end) as aft_pp
,count(case when aft='x' and progressnow='x' then vanid else null end) as aft_progressnow

,count(case when cea='x' and aft='x' then vanid else null end) as cea_aft
,count(case when cea='x' and circ='x' then vanid else null end) as cea_circ
,count(case when cea='x' and coco='x' then vanid else null end) as cea_coco
,count(case when cea='x' and cpa='x' then vanid else null end) as cea_cpa
,count(case when cea='x' and ctla='x' then vanid else null end) as cea_ctla
,count(case when cea='x' and greatered='x' then vanid else null end) as cea_greatered
,count(case when cea='x' and naral='x' then vanid else null end) as cea_naral
,count(case when cea='x' and newera='x' then vanid else null end) as cea_newera
,count(case when cea='x' and oneco='x' then vanid else null end) as cea_oneco
,count(case when cea='x' and pp='x' then vanid else null end) as cea_pp
,count(case when cea='x' and progressnow='x' then vanid else null end) as cea_progressnow

,count(case when circ='x' and aft='x' then vanid else null end) as circ_aft
,count(case when circ='x' and cea='x' then vanid else null end) as circ_cea
,count(case when circ='x' and coco='x' then vanid else null end) as circ_coco
,count(case when circ='x' and cpa='x' then vanid else null end) as circ_cpa
,count(case when circ='x' and ctla='x' then vanid else null end) as circ_ctla
,count(case when circ='x' and greatered='x' then vanid else null end) as circ_greatered
,count(case when circ='x' and naral='x' then vanid else null end) as circ_naral
,count(case when circ='x' and newera='x' then vanid else null end) as circ_newera
,count(case when circ='x' and oneco='x' then vanid else null end) as circ_oneco
,count(case when circ='x' and pp='x' then vanid else null end) as circ_pp
,count(case when circ='x' and progressnow='x' then vanid else null end) as circ_progressnow

,count(case when coco='x' and aft='x' then vanid else null end) as coco_aft
,count(case when coco='x' and cea='x' then vanid else null end) as coco_cea
,count(case when coco='x' and circ='x' then vanid else null end) as coco_circ
,count(case when coco='x' and cpa='x' then vanid else null end) as coco_cpa
,count(case when coco='x' and ctla='x' then vanid else null end) as coco_ctla
,count(case when coco='x' and greatered='x' then vanid else null end) as coco_greatered
,count(case when coco='x' and naral='x' then vanid else null end) as coco_naral
,count(case when coco='x' and newera='x' then vanid else null end) as coco_newera
,count(case when coco='x' and oneco='x' then vanid else null end) as coco_oneco
,count(case when coco='x' and pp='x' then vanid else null end) as coco_pp
,count(case when coco='x' and progressnow='x' then vanid else null end) as coco_progressnow

,count(case when cpa='x' and aft='x' then vanid else null end) as cpa_aft
,count(case when cpa='x' and cea='x' then vanid else null end) as cpa_cea
,count(case when cpa='x' and circ='x' then vanid else null end) as cpa_circ
,count(case when cpa='x' and coco='x' then vanid else null end) as cpa_coco
,count(case when cpa='x' and ctla='x' then vanid else null end) as cpa_ctla
,count(case when cpa='x' and greatered='x' then vanid else null end) as cpa_greatered
,count(case when cpa='x' and naral='x' then vanid else null end) as cpa_naral
,count(case when cpa='x' and newera='x' then vanid else null end) as cpa_newera
,count(case when cpa='x' and oneco='x' then vanid else null end) as cpa_oneco
,count(case when cpa='x' and pp='x' then vanid else null end) as cpa_pp
,count(case when cpa='x' and progressnow='x' then vanid else null end) as cpa_progressnow

,count(case when ctla='x' and aft='x' then vanid else null end) as ctla_aft
,count(case when ctla='x' and cea='x' then vanid else null end) as ctla_cea
,count(case when ctla='x' and circ='x' then vanid else null end) as ctla_circ
,count(case when ctla='x' and coco='x' then vanid else null end) as ctla_coco
,count(case when ctla='x' and cpa='x' then vanid else null end) as ctla_cpa
,count(case when ctla='x' and greatered='x' then vanid else null end) as ctla_greatered
,count(case when ctla='x' and naral='x' then vanid else null end) as ctla_naral
,count(case when ctla='x' and newera='x' then vanid else null end) as ctla_newera
,count(case when ctla='x' and oneco='x' then vanid else null end) as ctla_oneco
,count(case when ctla='x' and pp='x' then vanid else null end) as ctla_pp
,count(case when ctla='x' and progressnow='x' then vanid else null end) as ctla_progressnow

,count(case when greatered='x' and aft='x' then vanid else null end) as greatered_aft
,count(case when greatered='x' and cea='x' then vanid else null end) as greatered_cea
,count(case when greatered='x' and circ='x' then vanid else null end) as greatered_circ
,count(case when greatered='x' and coco='x' then vanid else null end) as greatered_coco
,count(case when greatered='x' and cpa='x' then vanid else null end) as greatered_cpa
,count(case when greatered='x' and ctla='x' then vanid else null end) as greatered_ctla
,count(case when greatered='x' and naral='x' then vanid else null end) as greatered_naral
,count(case when greatered='x' and newera='x' then vanid else null end) as greatered_newera
,count(case when greatered='x' and oneco='x' then vanid else null end) as greatered_oneco
,count(case when greatered='x' and pp='x' then vanid else null end) as greatered_pp
,count(case when greatered='x' and progressnow='x' then vanid else null end) as greatered_progressnow

,count(case when naral='x' and aft='x' then vanid else null end) as naral_aft
,count(case when naral='x' and cea='x' then vanid else null end) as naral_cea
,count(case when naral='x' and circ='x' then vanid else null end) as naral_circ
,count(case when naral='x' and coco='x' then vanid else null end) as naral_coco
,count(case when naral='x' and cpa='x' then vanid else null end) as naral_cpa
,count(case when naral='x' and ctla='x' then vanid else null end) as naral_ctla
,count(case when naral='x' and greatered='x' then vanid else null end) as naral_greatered
,count(case when naral='x' and newera='x' then vanid else null end) as naral_newera
,count(case when naral='x' and oneco='x' then vanid else null end) as naral_oneco
,count(case when naral='x' and pp='x' then vanid else null end) as naral_pp
,count(case when naral='x' and progressnow='x' then vanid else null end) as naral_progressnow

,count(case when newera='x' and aft='x' then vanid else null end) as newera_aft
,count(case when newera='x' and cea='x' then vanid else null end) as newera_cea
,count(case when newera='x' and circ='x' then vanid else null end) as newera_circ
,count(case when newera='x' and coco='x' then vanid else null end) as newera_coco
,count(case when newera='x' and cpa='x' then vanid else null end) as newera_cpa
,count(case when newera='x' and ctla='x' then vanid else null end) as newera_ctla
,count(case when newera='x' and greatered='x' then vanid else null end) as newera_greatered
,count(case when newera='x' and naral='x' then vanid else null end) as newera_naral
,count(case when newera='x' and oneco='x' then vanid else null end) as newera_oneco
,count(case when newera='x' and pp='x' then vanid else null end) as newera_pp
,count(case when newera='x' and progressnow='x' then vanid else null end) as newera_progressnow

,count(case when oneco='x' and aft='x' then vanid else null end) as oneco_aft
,count(case when oneco='x' and cea='x' then vanid else null end) as oneco_cea
,count(case when oneco='x' and circ='x' then vanid else null end) as oneco_circ
,count(case when oneco='x' and coco='x' then vanid else null end) as oneco_coco
,count(case when oneco='x' and cpa='x' then vanid else null end) as oneco_cpa
,count(case when oneco='x' and ctla='x' then vanid else null end) as oneco_ctla
,count(case when oneco='x' and greatered='x' then vanid else null end) as oneco_greatered
,count(case when oneco='x' and naral='x' then vanid else null end) as oneco_naral
,count(case when oneco='x' and newera='x' then vanid else null end) as oneco_newera
,count(case when oneco='x' and pp='x' then vanid else null end) as oneco_pp
,count(case when oneco='x' and progressnow='x' then vanid else null end) as oneco_progressnow

,count(case when pp='x' and aft='x' then vanid else null end) as pp_aft
,count(case when pp='x' and cea='x' then vanid else null end) as pp_cea
,count(case when pp='x' and circ='x' then vanid else null end) as pp_circ
,count(case when pp='x' and coco='x' then vanid else null end) as pp_coco
,count(case when pp='x' and cpa='x' then vanid else null end) as pp_cpa
,count(case when pp='x' and ctla='x' then vanid else null end) as pp_ctla
,count(case when pp='x' and greatered='x' then vanid else null end) as pp_greatered
,count(case when pp='x' and naral='x' then vanid else null end) as pp_naral
,count(case when pp='x' and newera='x' then vanid else null end) as pp_newera
,count(case when pp='x' and oneco='x' then vanid else null end) as pp_oneco
,count(case when pp='x' and progressnow='x' then vanid else null end) as pp_progressnow

,count(case when progressnow='x' and aft='x' then vanid else null end) as progressnow_aft
,count(case when progressnow='x' and cea='x' then vanid else null end) as progressnow_cea
,count(case when progressnow='x' and circ='x' then vanid else null end) as progressnow_circ
,count(case when progressnow='x' and coco='x' then vanid else null end) as progressnow_coco
,count(case when progressnow='x' and cpa='x' then vanid else null end) as progressnow_cpa
,count(case when progressnow='x' and ctla='x' then vanid else null end) as progressnow_ctla
,count(case when progressnow='x' and greatered='x' then vanid else null end) as progressnow_greatered
,count(case when progressnow='x' and naral='x' then vanid else null end) as progressnow_naral
,count(case when progressnow='x' and newera='x' then vanid else null end) as progressnow_newera
,count(case when progressnow='x' and oneco='x' then vanid else null end) as progressnow_oneco
,count(case when progressnow='x' and pp='x' then vanid else null end) as progressnow_pp

from (
	select vanid
	,max(aft) as aft
	,max(cea) as cea
	,max(circ) as circ
	,max(coco) as coco
	,max(cpa) as cpa
	,max(ctla) as ctla
	,max(greatered) as greatered
	,max(naral) as naral
	,max(newera) as newera
	,max(oneco) as oneco
	,max(pp) as pp
	,max(progressnow) as progressnow
	from (
		select vanid
		,case when ActivistCodeName = 'Member(AFT)' then 'x' else null end as aft
		,case when ActivistCodeName = 'Member(CEA)' then 'x' else null end as cea
		,case when ActivistCodeName = 'Member(CIRCAF)' then 'x' else null end as circ
		,case when ActivistCodeName = 'Member(CoCo)' then 'x' else null end as coco
		,case when ActivistCodeName = 'Member(CPA)' then 'x' else null end as cpa
		,case when ActivistCodeName = 'Member(CTLA)' then 'x' else null end as ctla
		,case when ActivistCodeName = 'Member(GreaterEd)' then 'x' else null end as greatered
		,case when ActivistCodeName = 'Member(NARAL)' then 'x' else null end as naral
		,case when ActivistCodeName = 'Member(NewEra)' then 'x' else null end as newera
		,case when ActivistCodeName = 'Member(OneCO)' then 'x' else null end as oneco
		,case when ActivistCodeName = 'Member(PP)' then 'x' else null end as pp
		,case when ActivistCodeName = 'Member(Progress Now)' then 'x' else null end as progressnow
		from (
			select vanid, ActivistCodeName
			from research.partner_overlap
			group by 1,2
		) a
	) a
	group by 1
) a
join research.partner_overlap_leg using (vanid)
group by 1
order by 1
;

select sd

,count(case when aft='x' and cea='x' then vanid else null end) as aft_cea
,count(case when aft='x' and circ='x' then vanid else null end) as aft_circ
,count(case when aft='x' and coco='x' then vanid else null end) as aft_coco
,count(case when aft='x' and cpa='x' then vanid else null end) as aft_cpa
,count(case when aft='x' and ctla='x' then vanid else null end) as aft_ctla
,count(case when aft='x' and greatered='x' then vanid else null end) as aft_greatered
,count(case when aft='x' and naral='x' then vanid else null end) as aft_naral
,count(case when aft='x' and newera='x' then vanid else null end) as aft_newera
,count(case when aft='x' and oneco='x' then vanid else null end) as aft_oneco
,count(case when aft='x' and pp='x' then vanid else null end) as aft_pp
,count(case when aft='x' and progressnow='x' then vanid else null end) as aft_progressnow

,count(case when cea='x' and aft='x' then vanid else null end) as cea_aft
,count(case when cea='x' and circ='x' then vanid else null end) as cea_circ
,count(case when cea='x' and coco='x' then vanid else null end) as cea_coco
,count(case when cea='x' and cpa='x' then vanid else null end) as cea_cpa
,count(case when cea='x' and ctla='x' then vanid else null end) as cea_ctla
,count(case when cea='x' and greatered='x' then vanid else null end) as cea_greatered
,count(case when cea='x' and naral='x' then vanid else null end) as cea_naral
,count(case when cea='x' and newera='x' then vanid else null end) as cea_newera
,count(case when cea='x' and oneco='x' then vanid else null end) as cea_oneco
,count(case when cea='x' and pp='x' then vanid else null end) as cea_pp
,count(case when cea='x' and progressnow='x' then vanid else null end) as cea_progressnow

,count(case when circ='x' and aft='x' then vanid else null end) as circ_aft
,count(case when circ='x' and cea='x' then vanid else null end) as circ_cea
,count(case when circ='x' and coco='x' then vanid else null end) as circ_coco
,count(case when circ='x' and cpa='x' then vanid else null end) as circ_cpa
,count(case when circ='x' and ctla='x' then vanid else null end) as circ_ctla
,count(case when circ='x' and greatered='x' then vanid else null end) as circ_greatered
,count(case when circ='x' and naral='x' then vanid else null end) as circ_naral
,count(case when circ='x' and newera='x' then vanid else null end) as circ_newera
,count(case when circ='x' and oneco='x' then vanid else null end) as circ_oneco
,count(case when circ='x' and pp='x' then vanid else null end) as circ_pp
,count(case when circ='x' and progressnow='x' then vanid else null end) as circ_progressnow

,count(case when coco='x' and aft='x' then vanid else null end) as coco_aft
,count(case when coco='x' and cea='x' then vanid else null end) as coco_cea
,count(case when coco='x' and circ='x' then vanid else null end) as coco_circ
,count(case when coco='x' and cpa='x' then vanid else null end) as coco_cpa
,count(case when coco='x' and ctla='x' then vanid else null end) as coco_ctla
,count(case when coco='x' and greatered='x' then vanid else null end) as coco_greatered
,count(case when coco='x' and naral='x' then vanid else null end) as coco_naral
,count(case when coco='x' and newera='x' then vanid else null end) as coco_newera
,count(case when coco='x' and oneco='x' then vanid else null end) as coco_oneco
,count(case when coco='x' and pp='x' then vanid else null end) as coco_pp
,count(case when coco='x' and progressnow='x' then vanid else null end) as coco_progressnow

,count(case when cpa='x' and aft='x' then vanid else null end) as cpa_aft
,count(case when cpa='x' and cea='x' then vanid else null end) as cpa_cea
,count(case when cpa='x' and circ='x' then vanid else null end) as cpa_circ
,count(case when cpa='x' and coco='x' then vanid else null end) as cpa_coco
,count(case when cpa='x' and ctla='x' then vanid else null end) as cpa_ctla
,count(case when cpa='x' and greatered='x' then vanid else null end) as cpa_greatered
,count(case when cpa='x' and naral='x' then vanid else null end) as cpa_naral
,count(case when cpa='x' and newera='x' then vanid else null end) as cpa_newera
,count(case when cpa='x' and oneco='x' then vanid else null end) as cpa_oneco
,count(case when cpa='x' and pp='x' then vanid else null end) as cpa_pp
,count(case when cpa='x' and progressnow='x' then vanid else null end) as cpa_progressnow

,count(case when ctla='x' and aft='x' then vanid else null end) as ctla_aft
,count(case when ctla='x' and cea='x' then vanid else null end) as ctla_cea
,count(case when ctla='x' and circ='x' then vanid else null end) as ctla_circ
,count(case when ctla='x' and coco='x' then vanid else null end) as ctla_coco
,count(case when ctla='x' and cpa='x' then vanid else null end) as ctla_cpa
,count(case when ctla='x' and greatered='x' then vanid else null end) as ctla_greatered
,count(case when ctla='x' and naral='x' then vanid else null end) as ctla_naral
,count(case when ctla='x' and newera='x' then vanid else null end) as ctla_newera
,count(case when ctla='x' and oneco='x' then vanid else null end) as ctla_oneco
,count(case when ctla='x' and pp='x' then vanid else null end) as ctla_pp
,count(case when ctla='x' and progressnow='x' then vanid else null end) as ctla_progressnow

,count(case when greatered='x' and aft='x' then vanid else null end) as greatered_aft
,count(case when greatered='x' and cea='x' then vanid else null end) as greatered_cea
,count(case when greatered='x' and circ='x' then vanid else null end) as greatered_circ
,count(case when greatered='x' and coco='x' then vanid else null end) as greatered_coco
,count(case when greatered='x' and cpa='x' then vanid else null end) as greatered_cpa
,count(case when greatered='x' and ctla='x' then vanid else null end) as greatered_ctla
,count(case when greatered='x' and naral='x' then vanid else null end) as greatered_naral
,count(case when greatered='x' and newera='x' then vanid else null end) as greatered_newera
,count(case when greatered='x' and oneco='x' then vanid else null end) as greatered_oneco
,count(case when greatered='x' and pp='x' then vanid else null end) as greatered_pp
,count(case when greatered='x' and progressnow='x' then vanid else null end) as greatered_progressnow

,count(case when naral='x' and aft='x' then vanid else null end) as naral_aft
,count(case when naral='x' and cea='x' then vanid else null end) as naral_cea
,count(case when naral='x' and circ='x' then vanid else null end) as naral_circ
,count(case when naral='x' and coco='x' then vanid else null end) as naral_coco
,count(case when naral='x' and cpa='x' then vanid else null end) as naral_cpa
,count(case when naral='x' and ctla='x' then vanid else null end) as naral_ctla
,count(case when naral='x' and greatered='x' then vanid else null end) as naral_greatered
,count(case when naral='x' and newera='x' then vanid else null end) as naral_newera
,count(case when naral='x' and oneco='x' then vanid else null end) as naral_oneco
,count(case when naral='x' and pp='x' then vanid else null end) as naral_pp
,count(case when naral='x' and progressnow='x' then vanid else null end) as naral_progressnow

,count(case when newera='x' and aft='x' then vanid else null end) as newera_aft
,count(case when newera='x' and cea='x' then vanid else null end) as newera_cea
,count(case when newera='x' and circ='x' then vanid else null end) as newera_circ
,count(case when newera='x' and coco='x' then vanid else null end) as newera_coco
,count(case when newera='x' and cpa='x' then vanid else null end) as newera_cpa
,count(case when newera='x' and ctla='x' then vanid else null end) as newera_ctla
,count(case when newera='x' and greatered='x' then vanid else null end) as newera_greatered
,count(case when newera='x' and naral='x' then vanid else null end) as newera_naral
,count(case when newera='x' and oneco='x' then vanid else null end) as newera_oneco
,count(case when newera='x' and pp='x' then vanid else null end) as newera_pp
,count(case when newera='x' and progressnow='x' then vanid else null end) as newera_progressnow

,count(case when oneco='x' and aft='x' then vanid else null end) as oneco_aft
,count(case when oneco='x' and cea='x' then vanid else null end) as oneco_cea
,count(case when oneco='x' and circ='x' then vanid else null end) as oneco_circ
,count(case when oneco='x' and coco='x' then vanid else null end) as oneco_coco
,count(case when oneco='x' and cpa='x' then vanid else null end) as oneco_cpa
,count(case when oneco='x' and ctla='x' then vanid else null end) as oneco_ctla
,count(case when oneco='x' and greatered='x' then vanid else null end) as oneco_greatered
,count(case when oneco='x' and naral='x' then vanid else null end) as oneco_naral
,count(case when oneco='x' and newera='x' then vanid else null end) as oneco_newera
,count(case when oneco='x' and pp='x' then vanid else null end) as oneco_pp
,count(case when oneco='x' and progressnow='x' then vanid else null end) as oneco_progressnow

,count(case when pp='x' and aft='x' then vanid else null end) as pp_aft
,count(case when pp='x' and cea='x' then vanid else null end) as pp_cea
,count(case when pp='x' and circ='x' then vanid else null end) as pp_circ
,count(case when pp='x' and coco='x' then vanid else null end) as pp_coco
,count(case when pp='x' and cpa='x' then vanid else null end) as pp_cpa
,count(case when pp='x' and ctla='x' then vanid else null end) as pp_ctla
,count(case when pp='x' and greatered='x' then vanid else null end) as pp_greatered
,count(case when pp='x' and naral='x' then vanid else null end) as pp_naral
,count(case when pp='x' and newera='x' then vanid else null end) as pp_newera
,count(case when pp='x' and oneco='x' then vanid else null end) as pp_oneco
,count(case when pp='x' and progressnow='x' then vanid else null end) as pp_progressnow

,count(case when progressnow='x' and aft='x' then vanid else null end) as progressnow_aft
,count(case when progressnow='x' and cea='x' then vanid else null end) as progressnow_cea
,count(case when progressnow='x' and circ='x' then vanid else null end) as progressnow_circ
,count(case when progressnow='x' and coco='x' then vanid else null end) as progressnow_coco
,count(case when progressnow='x' and cpa='x' then vanid else null end) as progressnow_cpa
,count(case when progressnow='x' and ctla='x' then vanid else null end) as progressnow_ctla
,count(case when progressnow='x' and greatered='x' then vanid else null end) as progressnow_greatered
,count(case when progressnow='x' and naral='x' then vanid else null end) as progressnow_naral
,count(case when progressnow='x' and newera='x' then vanid else null end) as progressnow_newera
,count(case when progressnow='x' and oneco='x' then vanid else null end) as progressnow_oneco
,count(case when progressnow='x' and pp='x' then vanid else null end) as progressnow_pp

from (
	select vanid
	,max(aft) as aft
	,max(cea) as cea
	,max(circ) as circ
	,max(coco) as coco
	,max(cpa) as cpa
	,max(ctla) as ctla
	,max(greatered) as greatered
	,max(naral) as naral
	,max(newera) as newera
	,max(oneco) as oneco
	,max(pp) as pp
	,max(progressnow) as progressnow
	from (
		select vanid
		,case when ActivistCodeName = 'Member(AFT)' then 'x' else null end as aft
		,case when ActivistCodeName = 'Member(CEA)' then 'x' else null end as cea
		,case when ActivistCodeName = 'Member(CIRCAF)' then 'x' else null end as circ
		,case when ActivistCodeName = 'Member(CoCo)' then 'x' else null end as coco
		,case when ActivistCodeName = 'Member(CPA)' then 'x' else null end as cpa
		,case when ActivistCodeName = 'Member(CTLA)' then 'x' else null end as ctla
		,case when ActivistCodeName = 'Member(GreaterEd)' then 'x' else null end as greatered
		,case when ActivistCodeName = 'Member(NARAL)' then 'x' else null end as naral
		,case when ActivistCodeName = 'Member(NewEra)' then 'x' else null end as newera
		,case when ActivistCodeName = 'Member(OneCO)' then 'x' else null end as oneco
		,case when ActivistCodeName = 'Member(PP)' then 'x' else null end as pp
		,case when ActivistCodeName = 'Member(Progress Now)' then 'x' else null end as progressnow
		from (
			select vanid, ActivistCodeName
			from research.partner_overlap
			group by 1,2
		) a
	) a
	group by 1
) a
join research.partner_overlap_leg using (vanid)
group by 1
order by 1
;