select extract(hour from vote_date)||'-'||extract(hour from vote_date)+1 as hour, count(*) from early_voters.ce19_2016_timestamp where vote_date::date = '2016-11-08' group by 1 order by 2 desc