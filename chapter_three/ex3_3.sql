-- ex3.3: Finding rows in common between 2 tables -- 
-- we have a view V that contains the names, jobs, and salaries of employees that are clerks
-- If we intersect the emp table we will select the records from emp that are only clerks 
-- we can then use a subquery in where to return just the clerk records from emp, however we are able to return more column headings
-- such as empno, deptno 
select "EMPNO", "ENAME", "JOB", "SAL", "DEPTNO"
from emp
where("ENAME", "JOB", "SAL") in (
SELECT "ENAME", "JOB", "SAL"
FROM emp 
INTERSECT
SELECT "ENAME", "JOB", "SAL"
FROM V);