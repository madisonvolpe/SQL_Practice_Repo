SELECT name,
	   CASE WHEN SUM(revenue) > 14000 THEN 'high'
	   WHEN sum(revenue) < 14000 AND sum(revenue) > 300 THEN 'average'
	   ELSE 'low'
	   END AS revenue
FROM
	(SELECT name,
	   		CASE WHEN memid > 0 THEN membercost * slots
	   		ELSE guestcost * slots
	   		END AS revenue
	FROM cd.facilities AS f
	JOIN cd.bookings AS b
	ON f.facid = b.facid) AS s1
GROUP BY name
ORDER BY sum(revenue) desc, name ;