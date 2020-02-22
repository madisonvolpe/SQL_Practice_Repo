SELECT *	
FROM 	
	(SELECT firstname, surname, ROUND(totalmins/60, -1) AS hours,
	   RANK () OVER (ORDER BY ROUND(totalmins/60,-1) DESC)
	FROM
		(SELECT memid, sum(mins) AS totalmins
	 	 FROM (SELECT memid, slots * 30 AS mins
	  	  	   FROM cd.bookings) as s1
	GROUP BY memid) s2
	JOIN cd.members AS m
	ON s2.memid = m.memid) s3
ORDER BY rank, surname, firstname 