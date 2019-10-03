-- Dealing with Nulls When Sorting 
	-- want to specfify that nulls are sorted last or first

-- Sorts nulls at bottom 
SELECT "ENAME", "SAL", "COMM"
FROM emp
ORDER BY 3;

-- Sorts null first
SELECT "ENAME", "SAL", "COMM"
FROM emp
ORDER BY 3 desc;

-- Conditional sort, nulls displayed differently
-- the inner query creates a variable that will flag null values and non null values
-- the outer query will order by this new variable, is_null, we can do this because is_null does not have to be in 
-- select statement and we can still order by it. 
-- by putting is_null desc, then all non nulls will be sorted first
SELECT "ENAME", "SAL", "COMM"
FROM (
SELECT "ENAME", "SAL", "COMM",
	   CASE WHEN "COMM" IS NULL THEN 0 ELSE 1 END AS is_null
FROM EMP) x
ORDER BY is_null desc, "COMM";

-- We can do this sorting by COMM desc along with is null desc will again display non nulls at the top
-- Also Comm will be sorted from highest to lowest
SELECT "ENAME", "SAL", "COMM"
FROM (
SELECT "ENAME", "SAL", "COMM", 
		CASE WHEN "COMM" IS NULL THEN 0 ELSE 1 END AS is_null
FROM EMP) x 
ORDER BY is_null desc, "COMM" desc;

-- We can also sort by nulls first and make COMM desc
SELECT "ENAME", "SAL", "COMM"
FROM (
SELECT "ENAME", "SAL", "COMM",
		CASE WHEN "COMM" IS NULL THEN 0 ELSE 1 END AS is_null
FROM emp) X
ORDER BY is_null, "COMM" desc;










