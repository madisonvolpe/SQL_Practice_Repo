SELECT * 
FROM
	(SELECT name,
	   RANK() OVER (ORDER BY total_rev DESC)
	 FROM
		(SELECT name, 
	       		sum(revenue) AS total_rev	
		 FROM	
			(SELECT name,
	   	 		CASE WHEN memid > 0 THEN membercost * slots 
	     		ELSE guestcost * slots 
	     		END AS revenue
	 	 	FROM cd.facilities as f
	 	 	JOIN cd.bookings as b
	 	  		ON f.facid = b.facid) as s1
		 GROUP BY name) as s2 ) AS s3
WHERE rank < 4;