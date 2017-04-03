	drop table if exists contact_history.lfp_today;
	create table contact_history.lfp_today (vanid text
		,latitude numeric
		,longitude numeric
		,elapsedsurveytime int
		,canvasser text
		,datetime_canvassed timestamp
		,canvass_result text
		,issue_id text
		,introduce_candidate text
		,candidatea_id text
		,candidatea_id_strong text
		,candidatea_lean text
		,candidateb_id text
		,candidateb_id_strong text
		,candidateb_lean text
		,pledge_card text
		,vote_plan text
		,ballot_received text
		,close text
		,cell_phone text
		,email text
		,cd int
		,sd int
		,hd int
	);

	copy contact_history.lfp_today from '/users/garrett/desktop/StateLeg_Results_160822.csv' with csv header delimiter as ',';

	select count(*) from contact_history.lfp_today;
	select * from contact_history.lfp_today;

	@export on;
	@export set filename="/Users/Garrett/Desktop/lfpexport.txt" CsvRowDelimiter=\r\n ShowNullAs="";
	select distinct vanid
	,canvasser
	,datetime_canvassed::date as date_canvassed
	,canvass_result
	,coalesce(case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidatea_id||candidatea_id_strong||candidatea_lean
		,case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidatea_id||candidatea_lean
		,case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidatea_id||candidatea_id_strong
		,case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidatea_id
	) as candidatea_id
	,coalesce(case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidateb_id||candidateb_id_strong||candidateb_lean
		,case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidateb_id||candidateb_lean
		,case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidateb_id||candidateb_id_strong
		,case when hd=17 then '17' when hd=25 then '25' when hd=23 then '23' when hd=28 then '28' when hd=33 then '33' when hd=59 then '59' else sd::text||hd::text end||candidateb_id
	) as candidateb_id
	,ballot_received
	,vote_plan
	,'x' as "Y"
	from contact_history.lfp_today
	where right(vanid,1)<>'U'
	;
	@export off;

	/*insert into contact_history.lfp_pass1 select vanid, latitude
		,longitude
		,elapsedsurveytime
		,canvasser
		,datetime_canvassed
		,canvass_result
		,issue_id
		,introduce_candidate
		,candidatea_id
		,pledge_card
		,vote_plan
		,close
		,cell_phone
		,email
		,cd
		,sd
		,hd
		,candidatea_id_strong
		,candidatea_lean
		,candidateb_id
		,candidateb_id_strong
		,candidateb_lean
		,ballot_received
		from contact_history.lfp_today;