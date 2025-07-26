/*

What are the highest in-demand skills for data analysts?

    • Use an inner join between job postings and the skills tables, similar to the previous query.
    • Identify the top 10 most in-demand skills across all job postings for data analysts.
    • Focus on the full dataset without filtering by salary or remote options.

     This helps reveal the top 10 most sought-after skills in the job market,
   giving job seekers a clear view of which skills are most valuable to develop.

*/

SELECT  
    skills_dim.skills,
    COUNT(skills) AS skill_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere'
GROUP BY
    skills_dim.skills
ORDER BY skill_count DESC
LIMIT 10

/*

 Top Highest In-Demand Skills for Data Analysts, Insights:

    • SQL leads by a wide margin with 7,291 mentions, confirming its essential role in data analysis.
    • Excel remains a core skill with 4,611 postings, highlighting its continued relevance.
    • Python is highly sought after (4,330), emphasizing the demand for programming and automation skills.

*/