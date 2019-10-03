-- Sorting by multiple fields
	-- want to sort the rows from emp by DEPTNO asc, then salary desc

SELECT "EMPNO", "DEPTNO", "SAL", "ENAME", "JOB"
FROM EMP
ORDER BY "DEPTNO" asc, "SAL" desc;

-- ther order of precedence is from left to right, therefore deptno is sorted first then the salaries within each dept 