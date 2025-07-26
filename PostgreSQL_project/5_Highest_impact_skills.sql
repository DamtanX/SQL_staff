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
    COUNT(job_postings_fact.job_id) AS skill_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.job_work_from_home = true AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
HAVING
    COUNT(job_postings_fact.job_id) > 10
ORDER BY 
    salary_yearly DESC
LIMIT 50

/*

Highest-Impact Skills for Data Analysts, Insights: 

        • Go ($115K), Confluence ($114K), and Hadoop ($113K) top the list, though with 
        relatively low usage counts — suggesting niche but highly lucrative skills.

        • Snowflake ($113K, 37 jobs) and Azure ($111K, 34 jobs) stand out for combining
         both high salaries and decent demand, making them strategic skills to learn.

        • Python ($101K, 236) and Tableau ($99K, 230) appear frequently while still 
        offering solid pay — a great balance of popularity and profitability.

*/