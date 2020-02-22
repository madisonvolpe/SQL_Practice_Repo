SELECT RANK() OVER (ORDER BY joindate) AS row_number,
       firstname, surname
FROM cd.members; 

-- or 

SELECT ROW_NUMBER() OVER (ORDER BY joindate),
       firstname, surname
FROM cd.members; 
