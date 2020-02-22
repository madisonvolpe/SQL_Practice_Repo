SELECT m.firstname AS memfname, m.surname AS memsname, r.recfname, r.recsname
FROM cd.members AS m
LEFT JOIN
(SELECT firstname AS recfname, surname AS recsname, memid AS recid
FROM cd.members
WHERE memid IN (
SELECT DISTINCT recommendedby
FROM cd.members )) AS r
ON m.recommendedby  = r.recid
ORDER BY m.surname, m.firstname

