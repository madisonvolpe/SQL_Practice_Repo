SELECT f.facid, sum(slots) AS "Total Slots"
FROM cd.facilities AS f
	 JOIN cd.bookings AS b
	 ON f.facid = b.facid 
WHERE date_part('month',starttime)=9 AND date_part('year',starttime)=2012
GROUP BY f.facid
ORDER BY "Total Slots"
