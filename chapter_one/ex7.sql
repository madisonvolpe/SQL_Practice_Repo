-- Concatenating Column Values 
 -- if you want to create a statement with info from two different columns 
 -- || in postgres concatenates values from two different columns 
 
 SELECT "ENAME" ||' WORKS AS A '|| "JOB"
 	from emp
	WHERE "DEPTNO" = 10;