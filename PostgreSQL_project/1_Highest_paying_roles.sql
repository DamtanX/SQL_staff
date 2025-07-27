/*

What are the highest-paying Data Analyst roles?
   • Identify the top 10 highest-paying remote Data Analyst positions
   • Focus only on job listings that include specified salary data (exclude null values)
   • Include company names for the top 15 roles
   • Purpose: To spotlight the most lucrative opportunities for Data Analysts, 
   emphasizing both earning potential and remote work flexibility.

*/

SELECT
    job_title AS title,
    ROUND(salary_year_avg, 0) AS salary_yearly,
    company_dim.name AS company_Name,
    job_posted_date::DATE
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

/*

Top Data Analyst Roles in 2023 Insights:

   • Extensive Salary Range: The highest-paying data analyst positions offer salaries 
   between $184,000 and $650,000, highlighting the strong earning potential within the industry.

   • Variety of Employers: High-paying roles are available at companies like SmartAsset, Meta, 
   and AT&T, demonstrating widespread demand for data talent across multiple sectors.

   • Diverse Job Titles: From Data Analyst to Director of Analytics, the roles show significant 
   variation, reflecting the wide spectrum of responsibilities and expertise in the data analytics field.

*/