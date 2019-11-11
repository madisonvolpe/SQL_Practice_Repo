-- 3.7 - Determining whether Two Tables Have the Same Data -- 

(select "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO", count(*) as cnt
from V2
group by "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO"
EXCEPT 
select "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO", count(*) as cnt
from emp
group by "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO")
 -- This half of the query returns all the rows in V2 THAT do not appear in emp 
 -- The first select query before except returns the rows and how many times they are repeated in V2 
 -- In this case for example, 7521, WARD, SALESMAN, 7698, 1981-02-22, 1250, 500, 30, 2 is repeated twice
 -- The second select query after except does the same thing
 -- however the except clause limits the results to those rows in the first select statement before except
 -- that do not appear in the second select statement after except. 
 union all 
 (SELECT "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO", count(*) as cnt
 FROM emp
 GROUP BY "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO"
 EXCEPT
 SELECT "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO", count(*) as cnt
 FROM V2
 GROUP BY "EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO")
 -- the second part of this query after union all mirrors the 1st half 
 -- except now what is returned are the rows in emp that are NOT IN  V2
 -- The union all allows us to see both results:
 -- the rows in V2 that are not in emp  and the rows in emp that are not in V2
