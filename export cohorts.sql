@export on;
@export set filename="/Users/Garrett/Desktop/base.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_base_mail group by 1;

@export set filename="/Users/Garrett/Desktop/cons_base.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_cons_base_mail group by 1;

@export set filename="/Users/Garrett/Desktop/cons_gotv.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_cons_gotv_mail group by 1;

@export set filename="/Users/Garrett/Desktop/gotv.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_gotv_mail group by 1;

@export set filename="/Users/Garrett/Desktop/high-p.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_high_p_mail group by 1;

@export set filename="/Users/Garrett/Desktop/low-p.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_low_p_mail group by 1;

@export set filename="/Users/Garrett/Desktop/lpnt.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_lpnt_mail group by 1;

@export set filename="/Users/Garrett/Desktop/med-high-p.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_med_high_p_mail group by 1;

@export set filename="/Users/Garrett/Desktop/med-low-p.txt" CsvRowDelimiter=\r\n;
select dwid from cohorts.april2016_med_low_p_mail group by 1;

@export off;