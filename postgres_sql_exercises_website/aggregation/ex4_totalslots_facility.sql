SELECT f.facid, SUM(slots) AS "Total Slots"
FROM cd.facilities AS f
	 JOIN cd.bookings AS b
	 ON f.facid = b.facid
GROUP BY f.facid
ORDER BY facid