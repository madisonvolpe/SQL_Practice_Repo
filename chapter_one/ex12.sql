-- Transforming Nulls into Real Values 
	-- instead of returning Null return a 0 can use COALESCE for all DBMS 
	-- COALESCE returns the non-null value for a row, but if it is null - it will return the value you specify in coalesce

select coalesce("COMM", 0)
	from emp