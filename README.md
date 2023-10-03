# interval
Demo of Slightly Advanced SQL

Given a table of events with a column of dates. 

```
-- A simple SQLite3 table with an auto incrementing id and a date field.
-- There is no 'date' field in SQLite3 as available in other RDBMS
-- TEXT is often used as date 

CREATE TABLE "event" (
	"id"	INTEGER,
	"date"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
```

You would like to get information such as how often an event happen. 
What is the maximum and minimum number of days between the events?
You cannot use simplistic SQL statements to get answers.


![screenshot](https://github.com/alexcmak/interval/blob/main/images/problem.png)

First, you will need the dates in order, then you will need another "column" that calculate the number of days between each event.
Given that table, you can use functions such as AVG(), MAX() and MIN()

```
SELECT julianday( LEAD(date, 1, 0) OVER(ORDER BY date ASC) )
	- julianday(date) as days_diff from event
```


![screenshot](https://github.com/alexcmak/interval/blob/main/images/interval_column.png)

Then you will need some fancy SQL constructs:

```
WITH intervals AS (
SELECT 
       julianday( LEAD(date, 1, 0) 
       OVER(ORDER BY date ASC) ) - julianday(date) as days_diff
FROM event
)
SELECT AVG(days_diff) FROM intervals WHERE days_diff > 0
```


![screenshot](https://github.com/alexcmak/interval/blob/main/images/average.png)
