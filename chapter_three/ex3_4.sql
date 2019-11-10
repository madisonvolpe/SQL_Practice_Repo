-- ex 3.4: Retrieving Values from One Table That Do Not Exist in Another -- 
-- finding values in source table that do not also exist in some target table 
-- following query selects dept numbers from dept table that do not exist in emp table 
-- the EXCEPT operator takes the first result set and removes from it all rows found in the second result set. 
-- The EXCEPT operator will return rows from the upper query (the query before except) that do not exist
-- in the lower query (the query after except).

select "DEPTNO" 
from dept
except 
select "DEPTNO"
from emp;