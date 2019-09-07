-- Referencing an Aliased Column in the WHERE Clause 
	-- in order to use an alias in a where clause, you must wrap your query in an inline view!

select *
	from (
	select "SAL" as Salary, "COMM" AS Commission
	from emp) x
where salary < 5000;

-- So WHERE clause is evaluated before SELECT clause, so if you put Aliases in SELECT clause and then reference them
-- in the WHERE clause it will not work bc technically they do not exist yet. HOWEVER,
-- the FROM clause is evaluated before the WHERE clause, therefore by putting the aliased columns in a from clause 
-- they are evaluated before the WHERE clause. Now you can reference the aliased column names in the outer clause. 

