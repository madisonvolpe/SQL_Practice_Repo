-- 3.2 Combining related rows -- 
-- To return rows from multiple tables by joining on a known common column or joining on columns that share common values. 
-- Display the names of all employees om department 10 along with the location of each employee's department.
-- Data is stored in 2 separate tables then must use the "join" clause. 

select e."ENAME" AS Employee, d."LOC"
from emp AS e
INNER JOIN dept AS d
on e."DEPTNO" = d."DEPTNO"
WHERE e."DEPTNO" =10;
