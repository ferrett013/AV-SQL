select b.cohort as old_cohort, a.cohort as new_cohort, count(*)
from cohorts.june2016 a
left join (
	select dwid, 'base' as cohort from cohorts.april2016_base_mail
	union all
	select dwid, 'cons base' as cohort from cohorts.april2016_cons_base_mail
	union all
	select dwid, 'cons gotv' as cohort from cohorts.april2016_cons_gotv_mail
	union all
	select dwid, 'gotv' as cohort from cohorts.april2016_gotv_mail
	union all
	select dwid, 'high p' as cohort from cohorts.april2016_high_p_mail
	union all
	select dwid, 'low p' as cohort from cohorts.april2016_low_p_mail
	union all
	select dwid, 'lpnt' as cohort from cohorts.april2016_lpnt_mail
	union all
	select dwid, 'med high p' as cohort from cohorts.april2016_med_high_p_mail
	union all
	select dwid, 'med low p' as cohort from cohorts.april2016_med_low_p_mail
) b using (dwid)
group by 1,2
order by 1,2