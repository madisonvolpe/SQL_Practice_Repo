SELECT facid, name, round("Total Minutes" / 60::decimal,2)
FROM 
	(SELECT facid, name, sum(minutes) AS "Total Minutes"
	FROM 
		(SELECT f.facid, name, slots, slots * 30 AS "minutes"
	  	 FROM cd.bookings AS b 
	  	 JOIN cd.facilities AS f
	     ON b.facid = f.facid) as s
	GROUP BY facid, name
	ORDER BY facid) as s2