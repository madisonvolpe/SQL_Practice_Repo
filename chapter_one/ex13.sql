-- Searching for Patterns
	-- can use LIKE with % , where you place % matters
	-- %ER% - will match if er is anywhere
	-- %ER - will match if ends with ER
	-- ER% - will match if it begins with ER 

SELECT "ENAME", "JOB"
FROM emp
WHERE "DEPTNO" in (10,20)
 and ("ENAME" LIKE '%I%' or "JOB" LIKE '%ER');

-- selects 