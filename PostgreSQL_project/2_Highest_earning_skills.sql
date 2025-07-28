/*

Which skills are most required for the highest-paying Data Analyst roles?

    • I analyzed the top 10 highest-paying remote Data Analyst job postings
     (with specified salaries) to uncover which technical skills are most commonly required.

    • For each role, I extracted the listed skills, counted how often each one appeared, 
    and then sorted them by frequency in descending order.
    
    • I also calculated the average annual salary associated with each skill across these top-paying roles.

     This provides valuable insight into which skills are most in demand among the best-paying
   positions, helping job seekers prioritize the tools and technologies that lead to higher salaries.

*/

WITH highest_paying_roles AS (
    SELECT
        job_id,
        job_title AS title,
        salary_year_avg AS salary_yearly
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        salary_year_avg IS NOT NULL AND
        job_title_short = 'Data Analyst' AND
        job_work_from_home = true
    ORDER BY 
    salary_year_avg DESC,
    job_id
    LIMIT 15
)

SELECT  
    skills_dim.skills,
    COUNT(skills_dim.skills) AS skill_count,
    ROUND(AVG(highest_paying_roles.Salary_Yearly), 0) AS Salary_Yearly,
    skills_dim.type
FROM 
    highest_paying_roles
INNER JOIN skills_job_dim ON highest_paying_roles.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY 
    skills_dim.type,
    skills_dim.skills
    
ORDER BY 
    skill_count DESC


/*

Top Skills in High-Paying Data Analyst Jobs (2023) Insights:

    • SQL (12 mentions) and Python (11 mentions) are the most frequently required skills,
     showing their continued dominance in the data field.

    • Tableau and R also appear prominently, emphasizing the need for data visualization 
    and statistical analysis tools.

    • AWS leads with the highest average salary ($222K), followed by Databricks ($213K) 
    and Oracle ($203K), highlighting the importance of cloud platforms in modern data environments.
     
*/