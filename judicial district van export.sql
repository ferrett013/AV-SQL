drop table if exists research.judicial_districts;
create table research.judicial_districts as
select voter_id, district_name from voterfiles_sos.octobermid2016 a
join voterfiles_sos.split_octobermid2016 b on a.precinct = b.precinct_code::text and a.split=b.split_code
where district_type='Judicial'
;

@export on;
@export set filename="/Users/Garrett/Desktop/judicial1.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 1';

@export set filename="/Users/Garrett/Desktop/judicial2.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 2';

@export set filename="/Users/Garrett/Desktop/judicial3.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 3';

@export set filename="/Users/Garrett/Desktop/judicial4.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 4';

@export set filename="/Users/Garrett/Desktop/judicial5.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 5';

@export set filename="/Users/Garrett/Desktop/judicial6.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 6';

@export set filename="/Users/Garrett/Desktop/judicial7.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 7';

@export set filename="/Users/Garrett/Desktop/judicial8.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 8';

@export set filename="/Users/Garrett/Desktop/judicial9.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 9';

@export set filename="/Users/Garrett/Desktop/judicial10.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 10';

@export set filename="/Users/Garrett/Desktop/judicial11.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 11';

@export set filename="/Users/Garrett/Desktop/judicial12.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 12';

@export set filename="/Users/Garrett/Desktop/judicial13.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 13';

@export set filename="/Users/Garrett/Desktop/judicial14.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 14';

@export set filename="/Users/Garrett/Desktop/judicial15.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 15';

@export set filename="/Users/Garrett/Desktop/judicial16.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 16';

@export set filename="/Users/Garrett/Desktop/judicial17.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 17';

@export set filename="/Users/Garrett/Desktop/judicial18.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 18';

@export set filename="/Users/Garrett/Desktop/judicial19.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 19';

@export set filename="/Users/Garrett/Desktop/judicial20.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 20';

@export set filename="/Users/Garrett/Desktop/judicial21.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 21';

@export set filename="/Users/Garrett/Desktop/judicial22.csv" CsvRowDelimiter=\r\n;
select vanid, district_name from research.judicial_districts a 
join voterfiles_van.octobermid2016 b on a.voter_id = b.statefileid
where district_name = 'JUDICIAL 22';