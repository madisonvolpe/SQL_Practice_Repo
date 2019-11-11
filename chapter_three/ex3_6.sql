-- 3.6 Adding joins to a Query Without Interfering with Outer joins -- 
-- You have three tables (emp, dept, and emp_bonus) - you want to return a final table that gives:
-- a list of all employees, where they are located, and the date they received a bonus...if they received one
-- the problem is it's easy to join employees to dept to get location, bc if you inner join them all emplpyees are returned
-- and their locations, but if you inner_join with emp_bonus, bc not all employees received a bonus, the list of employees
-- returned would not have all employees. 

select e."ENAME", d."LOC", eb."RECEIVED"
from emp AS e 
inner join 
dept AS d
on e."DEPTNO" = d."DEPTNO"
left outer join 
emp_bonus as eb
on e."EMPNO" = eb."EMPNO"
order by 2;

-- If we join emp to dept, we will get a join that returns all employees and the locations they belong to. IF this table becomes
-- the left table in a left outer join with emp_bonus
-- it will return all employees, their location, and the date a bonus was received. 
-- if a employee did not receive a bonus, they and their locations will still be returned, received date is null
-- left outer joins return all rows in left table even if there is no matches in the right table! 