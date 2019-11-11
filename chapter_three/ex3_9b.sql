-- ex 3.9 alternative -- 
-- this is an alternative solution for 3.9 that involves using subqueries 

select d."DEPTNO", 
d.total_sal,
sum(e."SAL" * case when eb.type = 1 then .1
   when eb.type = 2 then .2
   else .3 end) as total_bonus
from emp e, emp_bonus2 eb, (
select "DEPTNO", sum("SAL") as total_sal
from emp
where "DEPTNO" = 10
group by "DEPTNO") d
WHERE e."DEPTNO" = d."DEPTNO"
and e."EMPNO" = eb."EMPNO"
group by d."DEPTNO", d.total_sal

--the subquery in FROM clause, d, gives you the total sum of salaries in dept 10, which is 8750. 
--we then join the deptno from emp table on the deptno from the d subquery 
-- ^ this join would give you the employee deptno and connect it with the sum of total salaries, bc we 
-- joined with emp table we now have access to emp table's columns
-- when we join the emp table wth the emp_bonus2 table we are able to get the bonus for each employees , the total_sal
-- will be returned for each dept, so now like 7934, 7934, 7839, and 7782 will all be returned wih a total_sal for dept 10
-- as 8750 
-- we add the group_by on deptno and total sal, because these are grouping variables bc 8750 total_sal and
-- deptno = 10 are repeated for employees in dept 10.
-- that is why when we sum bonuses we are summing for dept10 and total sal 8750. 
-- 
