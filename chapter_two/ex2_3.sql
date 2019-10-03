-- Sorting by substrings 
	-- you want the results of a query to be sorted by specific parts of a string
	-- return employee name and job from table EMP and sort by the last two characters in the job field 

SELECT "ENAME", "JOB"
FROM emp 
ORDER BY substr("JOB", length("JOB")-1)