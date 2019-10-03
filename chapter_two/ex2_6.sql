-- Sorting on a Dependent Key 
	-- IF JOB = SALESMAN THEN SORT BY COMM, but if not SORT BY salary
	-- You can slove this by using a CASE expression in the ORDER BY clause 
SELECT "ENAME", "SAL", "JOB", "COMM"
FROM emp
ORDER BY case when "JOB" = 'SALESMAN' then "COMM" else "SAL" end; 

