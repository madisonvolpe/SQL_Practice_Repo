-- Finding Rows That Satisfy Multiple Conditions
	-- Use a WHERE clause in combo w. OR and AND clauses

select * 
from emp
where "DEPTNO" = 10 
	or "COMM" is not null
	or "SAL" <= 2000 AND "DEPTNO" = 20; 