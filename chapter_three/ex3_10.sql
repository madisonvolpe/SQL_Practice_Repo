-- 3.11 Returning Missing Data from Multiple Tables

-- If you want to return data that does not match in either table use a "FULL Outer JOIN"

select d."DEPTNO", d."DNAME", e."ENAME"
from dept d full outer join emp2 e
on d."DEPTNO" = e."DEPTNO"

-- this returns departments that have no employees (dept 40) and employees that have no departments (yoda)