-- Stacking One Rowset Atop Another 
	-- Use Union All, a set operation, to combine rows from multiple tables
	-- To Use UNIONAL ALL, the select lists must have the same number of cols, and these cols must have 
	-- Same datatype
	-- UNION ALL includes duplicates and UNION filters out duplicates 
SELECT "ENAME" AS ename_and_dname, "DEPTNO"
FROM EMP 
WHERE "DEPTNO" = 10
UNION ALL
SELECT "DNAME", "DEPTNO"
FROM DEPT; 