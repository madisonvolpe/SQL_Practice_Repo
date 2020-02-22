SELECT b.starttime, f.name
FROM cd.bookings AS b
INNER JOIN cd.facilities AS f
ON b.facid = f.facid 
WHERE f.name IN ('Tennis Court 1', 'Tennis Court 2') AND
	  date_trunc('day', starttime) = '2012-09-21 00:00:00'
ORDER BY starttime