SELECT julianday( LEAD(date, 1, 0) OVER(ORDER BY date ASC) )
	- julianday(date) as days_diff from event