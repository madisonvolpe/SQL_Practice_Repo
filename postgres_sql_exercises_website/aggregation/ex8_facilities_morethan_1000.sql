SELECT facid, sum(slots) AS "Total Slots"
FROM cd.bookings
GROUP BY facid
HAVING sum(slots) > 1000
ORDER BY facid