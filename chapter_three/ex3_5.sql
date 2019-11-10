-- ex 3.5: Retrieving Rows from One Table That Do Not Correspond to Rows in Another -- 
-- Will need to use joins here
-- We are trying to see rows in the dept table that are not represented in the emp table.
-- We take the dept table and apply a left outer join with emp table.
-- A left outerjoin (same as the left join) returns all records from the left table dept even if there is no match in 
-- the right table emp 
-- Applying the left outer join returns all records from dept that match with emp on deptno. If there was no match for 
-- d.deptno = e.deptno, the dept number will still remain and there will be no corresponding e.deptno.
select d.*
from dept as d
left outer join emp as e
on d."DEPTNO" = e."DEPTNO"
where e."DEPTNO" is null;