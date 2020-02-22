SELECT facid, total
FROM 
	(SELECT facid, total,
	   RANK() OVER (ORDER BY total desc)
	FROM	
		(SELECT facid, SUM(slots) AS total
	 	 FROM cd.bookings
	 	 GROUP BY facid ) as s1) as s2
WHERE rank = 1