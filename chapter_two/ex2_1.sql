-- Returning Query Results in a Specified Order 
	-- You want to return the names, jobs, and salaries of employees that work in dept 10 from lowest to highest

SELECT "ENAME", "JOB", "SAL"
FROM emp
WHERE "DEPTNO" = 10
ORDER BY "SAL" asc;