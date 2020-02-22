SELECT name, sum(revenue) AS "revenue"
FROM (SELECT name,
	CASE WHEN m.memid > 0 THEN membercost * slots 
	ELSE guestcost * slots
	END AS revenue
FROM cd.facilities AS f
	JOIN cd.bookings AS b
	ON f.facid = b.facid
	JOIN cd.members AS m
	ON b.memid = m.memid ) as s
GROUP BY name
ORDER BY sum(revenue);