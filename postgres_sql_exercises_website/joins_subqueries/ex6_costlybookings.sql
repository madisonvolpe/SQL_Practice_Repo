SELECT firstname||' '|| surname AS member, name AS facility,
	CASE 
	WHEN m.memid > 0 THEN membercost * slots
	ELSE guestcost * slots 
	END AS cost	
FROM cd.facilities AS f
JOIN cd.bookings AS b
ON f.facid = b.facid 
JOIN cd.members AS m
ON b.memid = m.memid
WHERE ((m.memid = 0 AND slots * guestcost > 30)  or
	  (m.memid > 0 AND slots * membercost >30))
	  AND 
	  date_trunc('day', starttime) = '2012-09-14'
ORDER BY cost DESC_