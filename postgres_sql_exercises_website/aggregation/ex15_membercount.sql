SELECT (SELECT count(memid) FROM cd.members),firstname, surname 
FROM cd.members
ORDER BY joindate