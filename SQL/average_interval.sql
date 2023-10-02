WITH intervals AS (
SELECT 
       julianday( LEAD(date, 1, 0) 
       OVER(ORDER BY date ASC) ) - julianday(date) as days_diff
FROM event
)
SELECT AVG(days_diff) FROM intervals WHERE days_diff > 0
