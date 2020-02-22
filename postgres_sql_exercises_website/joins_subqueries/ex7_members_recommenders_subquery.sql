SELECT DISTINCT m.firstname ||' '|| m.surname AS member, 
       (SELECT  r.firstnsme ||' '|| r.surname AS recommender
		FROM cd.members AS r
		WHERE r.memid=m.recommendedby)
FROM cd.members AS m
ORDER BY m; 
