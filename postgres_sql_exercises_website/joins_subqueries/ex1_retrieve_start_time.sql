SELECT b.starttime
FROM cd.members AS m
INNER JOIN cd.bookings AS b
ON m.memid = b.memid 
WHERE m.surname = 'Farrell' AND m.firstname = 'David'