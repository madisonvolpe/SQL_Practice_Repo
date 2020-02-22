SELECT surname, firstname, m.memid, min(starttime)
FROM cd.members AS m
	JOIN cd.bookings AS b
	ON m.memid = b.memid 
WHERE date_trunc('day', starttime) > '2012-09-01'
GROUP BY surname, firstname, m.memid
ORDER BY m.memid