USE research;

#First and LastName of Professors working on Research with a budget less than $1.000.000
#1st Approcah
SELECT Professors.FirstName,
       Professors.LastName
FROM Professors
INNER JOIN ResearchWorks 
ON Professors.ResearchWork = ResearchWorks.ResearchID
WHERE ResearchWorks.Budget < 1000000;

#2nd Approach
SELECT Professors.FirstName,
       Professors.LastName
FROM Professors
WHERE ResearchWork IN (SELECT ResearchID 
					   FROM ResearchWorks
                       WHERE Budget < 1000000);

#ResearchWork with a budget larger than the average of all budgets
SELECT ResearchTitle
FROM ResearchWorks
WHERE Budget > (SELECT AVG(Budget)
                FROM ResearchWorks);
                
#Select the first and last names of Professors working on research with second to the lowest budget.
SELECT FirstName, 
       LastName
FROM Professors
WHERE ResearchWork = (SELECT ResearchID
                      FROM (SELECT *
                            FROM ResearchWorks
                            ORDER BY Budget 
                            LIMIT 1 OFFSET 1) as sub);