-- Returning n Random Records from a Table
	-- each DBMS has a function that will create random order of rows, in postgres its random
	-- order by will sort rows randomly
	-- limit functionwill limit # of rows

select "ENAME","JOB"
from emp
order by random() limit 5;
