SELECT firstname ||' '|| surname AS member, facility
FROM cd.members AS m 
JOIN
   (SELECT DISTINCT memid, name AS facility
    FROM cd.bookings AS b
    JOIN
      (SELECT facid, name
       FROM cd.facilities
       WHERE name IN ('Tennis Court 1', 'Tennis Court 2')) AS t
    ON b.facid = t.facid) AS mt
ON m.memid = mt.memid
ORDER BY member; 
