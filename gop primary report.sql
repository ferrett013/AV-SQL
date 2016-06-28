@export on;
@export set filename="/Users/Garrett/Desktop/GOP Primary Export.xlsx" Format="xls" ExcelFileFormat="ooxml" ExcelSheetName="GOP Primary Report";
select vote_date as "Vote Date", count(*) as "Ballots Returned" from (
	select party, received as vote_date from early_voters.ce18_primary2016
	union all
	select party, vote_date from early_voters.ce19_primary2016
) a
where party = 'Republican'
group by 1 order by 1