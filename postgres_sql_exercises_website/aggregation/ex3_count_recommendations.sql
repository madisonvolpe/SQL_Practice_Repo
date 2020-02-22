SELECT recommendedby, COUNT(recommendedby)
FROM cd.members
GROUP BY recommendedby
HAVING recommendedby IS NOT NULL
ORDER BY recommendedby

