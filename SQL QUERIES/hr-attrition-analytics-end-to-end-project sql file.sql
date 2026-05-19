
--1. How many total employees are present in the organization?
SELECT COUNT(*) AS Total_Employees
from hr_analysis;

--2. How many employees are currently active in the company?
SELECT COUNT(*) AS Active_Employees
FROM hr_analysis
WHERE attrition ='No';

--3. How many employees left the organization?
SELECT COUNT(*) AS Total_Attrition
FROM hr_analysis
WHERE attrition ='Yes';

--4. What is the overall employee attrition rate?
SELECT 
ROUND(
(SUM (CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),2
) AS attrition_rate
from hr_analysis;

--5. What is the average age of employees?
SELECT ROUND(AVG(age),0) AS Average_Age
fROM hr_analysis;

--6. Which department has the highest employee attrition?
SELECT department, COUNT(*) AS attrition_count
FROM hr_analysis
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY attrition_count DESC;

--7. How does experience in the current role impact attrition?
SELECT years_in_currentrole,
COUNT(*) AS attrition_count
FROM hr_analysis
WHERE attrition ='Yes' 
GROUP BY years_in_currentrole
ORDER BY attrition_count DESC;

--8. Does work-life balance impact employee attrition?
SELECT 
work_life_balance,
ROUND((SUM(CASE WHEN attrition ='Yes' THEN 1 ELSE 0 END) *100.0 )/COUNT (*),2) AS attrition_rate
FROM hr_analysis 
GROUP BY work_life_balance
ORDER BY work_life_balance;


--9. Which job roles experience the highest attrition?
SELECT
job_role,
COUNT(*) AS attrition_count
FROM hr_analysis
WHERE attrition = 'Yes'
GROUP BY job_role
ORDER BY attrition_count DESC;

--10. Does salary hike percentage influence attrition?
SELECT 
CASE
  WHEN percent_salary_hike BETWEEN 9 AND 11 THEN '9'
  WHEN percent_salary_hike BETWEEN 12 AND 14 THEN '12'
  WHEN percent_salary_hike BETWEEN 15 AND 17 THEN '15'
  WHEN percent_salary_hike BETWEEN 18 AND 20 THEN '18'
  WHEN percent_salary_hike BETWEEN 21 AND 23 THEN '21'
  ELSE '24'
  END AS salary_hike_group,
ROUND(SUM(CASE WHEN attrition = 'Yes'  THEN 1 ELSE 0 END )* 100.0 /COUNT(*),2) AS attrition_rate
FROM hr_analysis
GROUP BY salary_hike_group
ORDER BY salary_hike_group ASC ;

--11. Which age groups have the highest attrition rate?

SELECT 
      CASE 
	       WHEN age BETWEEN 10 AND 19 THEN 10
		   WHEN age BETWEEN 20 AND 29 THEN 20
		   WHEN age BETWEEN 30 AND 39 THEN 30
		   WHEN age BETWEEN 40 AND 49 THEN 40
		   WHEN age BETWEEN 50 AND 59 THEN 50  
		END AS age_group,
		ROUND(SUM(CASE WHEN attrition ='Yes' THEN 1 ELSE 0 END)*100.0/ COUNT(*),2) AS attrition_rate
		from hr_analysis
GROUP BY
    CASE 
	     WHEN age BETWEEN  10 AND 19 THEN 10 
		 WHEN age BETWEEN  20 AND 29 THEN 20
		 WHEN age BETWEEN  30 AND 39 THEN 30
		 WHEN age BETWEEN  40 AND 49 THEN 40
		 WHEN age BETWEEN  50 AND 59 THEN 50 
END
ORDER BY 1;
			 
--12. Which education background has the highest attrition?
SELECT
education_field,
COUNT(*) AS attrition_count
FROM hr_analysis
WHERE attrition ='Yes'
GROUP BY education_field
ORDER BY attrition_count DESC;

--13. Does business travel affect employee attrition?
SELECT
business_travel,
COUNT(*) AS attrition_count
FROM hr_analysis
WHERE attrition ='Yes'
GROUP BY business_travel
ORDER BY attrition_count DESC;

--14. How does job satisfaction affect employee attrition?
SELECT
job_satisfaction,
ROUND((SUM(CASE WHEN attrition ='Yes' THEN 1 ELSE 0 END )* 100.0)/COUNT(*),2 ) AS attrition_rate
FROM hr_analysis
GROUP BY job_satisfaction
ORDER BY job_satisfaction;


--15. Does overtime increase employee attrition?
SELECT
over_time,
COUNT(*) AS attrition_count,
ROUND(COUNT(*) *100.0/(SELECT COUNT(*) FROM hr_analysis WHERE attrition = 'Yes'),2) AS Attrition_percentage
FROM hr_analysis
WHERE attrition ='Yes'
GROUP BY over_time;

--16. Does travel distance from home affect attrition?
SELECT
     CASE 
	      WHEN distance_from_home BETWEEN 0 AND 4 THEN 0
		  WHEN distance_from_home BETWEEN 5 AND 9 THEN 5
		  WHEN distance_from_home BETWEEN 10 AND 14 THEN 10
		  WHEN distance_from_home BETWEEN 15 AND 19 THEN 15
		  WHEN distance_from_home BETWEEN 20 AND 24 THEN 20
		       ELSE 25 
		  END AS Distance_group,
		  ROUND(
                SUM(CASE WHEN attrition ='Yes' THEN 1 ELSE 0 END)*100.0/ COUNT(*),0) AS attrition_rate_percentage
				FROM hr_analysis
	GROUP BY 
	        CASE 
			     WHEN distance_from_home BETWEEN 0 AND 4 THEN 0
				 WHEN distance_from_home BETWEEN 5 AND 9 THEN 5
				 WHEN distance_from_home BETWEEN 10 AND 14 THEN 10
				 WHEN distance_from_home BETWEEN 15 AND 19 THEN 15
				 WHEN distance_from_home BETWEEN 20 AND 24 THEN 20
				 ELSE 25 
			END 

    ORDER BY 1;
				 
--17. Does workplace environment satisfaction influence attrition?
SELECT
environment_satisfaction,
ROUND((SUM (CASE WHEN attrition ='Yes' THEN 1 ELSE 0 END )*100.0)/COUNT(*),2) AS attrition_rate
FROM hr_analysis
GROUP BY environment_satisfaction
ORDER BY environment_satisfaction;
