USE Hospital;

SELECT * FROM Health;

-------------QUESTIONS-------------
--1. Unique Patient Count.
SELECT DISTINCT(COUNT(Patient_ID)) AS 'Unique_Patient_Count'
FROM Health;

--2. Average Age of Patient’s.
SELECT AVG(Age) AS 'Avg_Age_Patient' 
FROM Health;

--3. Patient Count by Gender.
SELECT Gender,COUNT(Patient_ID) AS 'No_Of_Patient'
FROM Health
GROUP BY Gender
ORDER BY No_Of_Patient DESC;

--4. Average Treatment cost by Department.
SELECT Department,ROUND(AVG(Treatment_Cost),2) AS 'Avg_Treat_Cost'
FROM Health
GROUP BY Department;


--5. (Min-Max) Satisfaction score by Diagnosis.
SELECT Diagnosis,
       MAX(Satisfaction_Score) AS 'Max_Satisfaction_Score',
	   MIN(Satisfaction_Score) AS 'Min_Satisfaction_Score'
FROM Health
GROUP BY Diagnosis;

--6. Patient Visits per city.
SELECT DISTINCT(City),Patient_ID,Visit_Date
FROM Health;

--7. Follow-up Status Distribution (%).
SELECT DISTINCT(Follow_Up),COUNT(Follow_UP) AS 'Num_Of_Follow_UP'
FROM Health
GROUP BY Follow_Up;

--8.Department with Highest Number of visits.
SELECT Department,COUNT(Visit_Date) AS 'No_Of_Visit'
FROM Health
GROUP BY Department
ORDER BY No_Of_Visit DESC;

--9.City with Highest Average Treatment Cost.
SELECT City,ROUND(AVG(Treatment_Cost),2) AS 'Avg_Treatment_Cost'
FROM Health
GROUP BY City
ORDER BY Avg_Treatment_Cost DESC;

--10. Correlation between age and treatment cost (Approximate using COVAR and STDEV).

--11. Patients with Satisfactory score > 8.
SELECT Patient_ID,Satisfaction_Score 
FROM Health
WHERE Satisfaction_Score > 8
ORDER BY Satisfaction_Score;

--12. Average cost for Follow-up patients.
SELECT Follow_Up, ROUND(AVG(Treatment_Cost),2) AS 'Avg_Cost'
FROM Health
GROUP BY Follow_Up;

--13. Diagnosis Distribution type by department.
SELECT Department,Diagnosis
FROM Health;

--14. Diagnosis with Highest total Treatment cost.
SELECT DISTINCT(Diagnosis),Treatment_Cost
FROM Health
ORDER BY Treatment_Cost DESC;

--15. Top 5 Most Expensive Treatments.
SELECT TOP 5 Treatment_Cost
FROM Health;


--16. Create a column to extract the year from the visit date.

--Create a New Column 'Year'
ALTER TABLE Health ADD Year INT;

--Add Data into Column 'Year'
UPDATE Health
SET Year = YEAR(Visit_Date);

--17. Find the Number of Visits per year .
SELECT Year,COUNT(Visit_Date) AS 'No_of_Visits'
FROM Health
GROUP BY Year;

--18. What is the median treatment cost by gender and diagnosis.


--19. Add a column locating if cost > 10000 is “High” or “Low”.

--Add a column 'locating'
ALTER TABLE Health ADD Locating TEXT;

--Add data into column 'locating'
UPDATE Health
SET Locating = CASE
               WHEN Treatment_Cost > 10000 THEN 'High'
			   ELSE 'Low'
			   END;


--20.What Percentage of patients are from “Cardiology”.
SELECT Department,ROUND(SUM(Treatment_Cost)/COUNT(Treatment_Cost),2)*100 AS 'Percentage_Patients'
FROM Health
WHERE Department = 'Cardiology'
GROUP BY Department;

--21. What are the top 3 departments with the lowest satisfaction scores.
SELECT TOP 3 Department,Satisfaction_Score
FROM Health
ORDER BY Satisfaction_Score;

--22.Which age group (by decades) has the highest number of visits.
SELECT TOP 1 Age,COUNT(Visit_Date) AS 'No_of_visit'
FROM Health
GROUP BY Age;


--23.Gender has the Highest Average Satisfaction scores.
SELECT TOP 1 Gender,AVG(Satisfaction_Score) AS 'Avg_Satisfaction_Score'
FROM Health
GROUP BY Gender
ORDER BY Avg_Satisfaction_Score DESC;

--24. How many patient’s visited in 2023 alone.
SELECT COUNT(Visit_Date) AS 'No_of_Visit',Year
FROM Health
WHERE Year = 2023
GROUP BY Year;

--25. Create a PIVOT : Average cost by gender and department.
