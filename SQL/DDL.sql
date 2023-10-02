-- A simple SQLite3 table with an auto incrementing id and a date field.
-- There is no 'date' field in SQLite3 as available in other RDBMS
-- TEXT is often used as date 

CREATE TABLE "event" (
	"id"	INTEGER,
	"date"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);