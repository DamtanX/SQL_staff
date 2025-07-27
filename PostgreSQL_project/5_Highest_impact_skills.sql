/*

What are the highest-impact skills to learn as a Data Analyst?

    • Identify the skills that are both in high demand and linked to high average salaries in Data Analyst roles
    • Focuses on remote job listings with disclosed salary information

This highlights the skills that provide the greatest career value by combining job market demand and strong 
earning potential, helping professionals prioritize the most strategic skills for growth in the data analysis field.

*/



SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary_yearly,
    COUNT(job_postings_fact.job_id) AS skill_count,
    skills_dim.type
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.job_work_from_home = true AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills,
    skills_dim.type
HAVING
    COUNT(job_postings_fact.job_id) > 25
ORDER BY 
    salary_yearly DESC
LIMIT 50

/*

Highest-Impact Skills for Data Analysts, Insights: 

    • Go stands out as the highest-paying skill ($115,320),
     followed by Snowflake ($112,948), and Azure ($111,225).

    • These are mostly cloud and programming technologies, 
    reflecting high demand in modern data infrastructure.

    • All cloud-related skills (Snowflake, Azure, AWS, Oracle) 
    have salaries over $100,000, confirming the strong value of 
    cloud expertise in today's job market.
*/