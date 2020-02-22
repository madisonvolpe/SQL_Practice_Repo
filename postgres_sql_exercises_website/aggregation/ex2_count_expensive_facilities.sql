SELECT SUM(highcost) AS count
FROM (SELECT DISTINCT name, guestcost,
				CASE WHEN guestcost > 10 THEN 1
				ELSE 0 
				END AS highcost
FROM cd.facilities ) as s