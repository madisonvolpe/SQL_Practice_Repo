SELECT *
FROM
	(SELECT facid, date_part('month', starttime) AS "month", sum(slots) AS "slots" 
	FROM cd.bookings
	WHERE date_part('year', starttime) = 2012
	GROUP BY facid, "month"

	UNION ALL 

	SELECT facid, NULL AS "month", sum(slots) AS "slots"
	FROM cd.bookings
	WHERE date_part('year',starttime) = '2012'
	GROUP BY facid

	UNION ALL 

	SELECT NULL AS "facid", NULL AS "month", sum(slots) AS "slots"
	FROM cd.bookings
	WHERE date_part('year', starttime) = 2012 ) AS s

ORDER BY facid, month