drop table if exists cohorts.june2016;

create table cohorts.june2016 (dwid int primary key
,cohort text
);

copy cohorts.june2016 from '/users/garrett/desktop/2016-06-29 cohorts.txt' with csv header delimiter as '	';

select cohort, count(*) from cohorts.june2016 group by 1 order by 1;

@export on;
@export set filename="/Users/Garrett/Desktop/Base.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='Base';
@export set filename="/Users/Garrett/Desktop/Cons Base.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='Cons Base';
@export set filename="/Users/Garrett/Desktop/Cons GOTV.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='Cons GOTV';
@export set filename="/Users/Garrett/Desktop/GOTV.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='GOTV';
@export set filename="/Users/Garrett/Desktop/High P.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='High P';
@export set filename="/Users/Garrett/Desktop/LPNT.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='LPNT';
@export set filename="/Users/Garrett/Desktop/Low P.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='Low P';
@export set filename="/Users/Garrett/Desktop/MedP, High.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='MedP, High';
@export set filename="/Users/Garrett/Desktop/MedP, Low.txt" CsvRowDelimiter=\r\n;
select * from cohorts.june2016 where cohort='MedP, Low';