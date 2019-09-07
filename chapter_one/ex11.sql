-- Finding NULL Values
	-- to find rows that are null for a particular column 

select *
from emp
where "COMM" IS NULL 

-- selects all rows where commision is null. All columns are returned by * statement. 