--3.9 - Performing Joins When Using Aggregates
 
-- If you are computing aggregates across joins you have to be careful, bc duplicates can be returned because of a join.
-- For example if we join emp to emp_bonus2, employee id 7934 received two bonuses. However, he only has one salary 1300. 
-- But if we join with emp_bonus 2, 1300 would be repeated twice because 7934 received two bonuses. So the sum of salary would
-- be 1600, when in fact its only 1300.
-- To avoid this problem, we can use DISTINCT in the call to the aggregate function  or we can perform an aggregation 
-- in an line view before joining -- the aggregation would be correct because you are doing it after joining

select "DEPTNO", 
sum(DISTINCT "SAL") as total_sal,
sum(bonus) as total_bonus
from (
SELECT e."EMPNO",
	   e."ENAME",
	   e."SAL",
	   e."DEPTNO",
	   e."SAL" * CASE WHEN eb.type = 1 then .1
					  WHEN eb.type = 2 then .2
                      ELSE .3 end as bonus
FROM emp AS e
INNER JOIN emp_bonus2 AS eb
ON e."EMPNO" = eb."EMPNO"
WHERE e."DEPTNO" = 10) x
GROUP BY "DEPTNO"

-- the subquery in from gives a list of all employee ids in dept 10 that had a bonus 
-- when joining the emp to emp_bonus2 we can see that employee 7934 had two bonuses
-- the outer query then selects the dept no and sums the total distinct salaries and sum of bonuses by dept no 