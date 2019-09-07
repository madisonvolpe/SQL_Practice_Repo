-- Using Conditional Logic in a SELECT Statement 
	-- typically use a CASE WHEN expression
	-- performs IF-ELSE operations on values in SELECT statement 

select "ENAME", "SAL",
	case when "SAL" <= 2000 then 'UNDERPAID'
		 when "SAL" >= 4000 then 'OVERPAID'
		 else 'OK'
	end as Status
from emp;

-- CASE WHEN can be used in SELECT statement
	