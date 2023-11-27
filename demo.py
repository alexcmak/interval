# demo average interval window function
import sqlite3
try:

	conn = sqlite3.connect('history.db3')

	select_sql = """WITH intervals AS (
	SELECT 
	       julianday( LEAD(date, 1, 0) 
	       OVER(ORDER BY date ASC) ) - julianday(date) as days_diff
	FROM event
	)
	SELECT AVG(days_diff) FROM intervals WHERE days_diff > 0"""

	cursor = conn.execute(select_sql)
	average = cursor.fetchone()

	print('Average is {0}'.format(average[0]))

	conn.close()
except sqlite3.Error as error:
	print('Program failed: ', error)
	if conn:
		conn.close()
