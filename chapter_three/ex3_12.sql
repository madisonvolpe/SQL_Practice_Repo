-- 3.12 - Using Nulls in Operations and Comparisons

-- Use function like coalesce to transform NULL value into a real value that can be used in standard evaluation 

select "ENAME", "COMM"
from emp
where coalesce("COMM", 0) < (select "COMM"
						   from emp where "ENAME" = 'WARD')