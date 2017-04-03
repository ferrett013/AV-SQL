@stop on error;
drop table if exists voterfiles_sos.april2017;
create table voterfiles_sos.april2017 (voter_id integer primary key
,county_code char(2)
,county text
,last_name text
,first_name text
,middle_name text
,name_suffix text
,voter_name text
,status_code char(1)
,precinct_name char(10)
,address_library_id text
,house_num text
,house_suffix text
,pre_dir text
,street_name text
,street_type text
,post_dir text
,unit_type text
,unit_num text
,address_non_std text
,residential_address text
,residential_city text
,residential_state char(2)
,residential_zip_code char(5)
,residential_zip_plus char(4)
,effective_date date
,registration_date date
,status text
,status_reason text
,birth_year integer
,gender text
,precinct char(10)
,split text
,voter_status_id char(1)
,party char(3)
,party_affiliation_date date
,phone_num text
,mail_addr1 text
,mail_addr2 text
,mail_addr3 text
,mailing_city text
,mailing_state char(2)
,mailing_zip_code char(5)
,mailing_zip_plus char(4)
,mailing_country text
,spl_id	integer
,permanent_mail_in_voter char(3)
,congressional text
,state_senate text
,state_house text
,id_required char(1)
);
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part1.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part2.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part3.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part4.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part5.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part6.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part7.txt' with csv header delimiter as ',' encoding 'windows-1251';
copy voterfiles_sos.april2017 from '/users/garrett/desktop/ex-003 master voter list/Registered_Voters_List_ Part8.txt' with csv header delimiter as ',' encoding 'windows-1251';


select count(*) from voterfiles_sos.march2017;
select count(*) from voterfiles_sos.april2017;