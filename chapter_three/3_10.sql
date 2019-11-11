-- 3.10 Performing Outer Joins When Using Aggregates -- 

-- When we join emp to emp_bonus3 and want a sum of all salaries and bonuses from dept10
-- we have to be careful bc we want salaries to be just counted once 

select "DEPTNO",
	   sum(distinct "SAL") as total_sal,
	   sum(bonus) as total_bonus 
from (
select e."EMPNO",
	   e."ENAME",
       e."SAL",
       e."DEPTNO", 
       e."SAL" * case when eb."TYPE" is null then 0
                    when eb."TYPE" = 1 then .1
                    when eb."TYPE" = 2 then .2
					else .3 end as bonus 
from emp e left outer join emp_bonus3 eb
on (e."EMPNO" = eb."EMPNO")
where e."DEPTNO" = 10) x
group by "DEPTNO"

-- within the subquery in FROM we are joining the emp table to the bonus table, all employees from emp in dept 10
-- are returned whether or not they received a bonus. 
-- note that by left outer join, employee 7934 will be returned twice because they received to bonuses.
-- this would affect total salary bc they have the same salary and this would be double counted in the sum, therefore
-- in the outer query we apply the distinct function tothe sum of salary
