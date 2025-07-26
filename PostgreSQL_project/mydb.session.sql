SELECT * 
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

WITH januar_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM januar_jobs;

SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM 
        job_postings_fact
    WHERE 
        job_no_degree_mention = true
) 
ORDER BY 
        company_id


WITH temp_table AS(
    SELECT 
        company_id,
        COUNT(company_id) AS total_count
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT 
    company_dim.name AS company_name,
    temp_table.total_count
FROM company_dim
LEFT JOIN temp_table ON company_dim.company_id = temp_table.company_id
ORDER BY total_count DESC







SELECT 
    skills_dim.skills,
    COUNT(skills_job_dim.skill_id) AS skill_count
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_location = 'Anywhere'
GROUP BY skills_dim.skills
ORDER BY skill_count DESC
LIMIT 5;


WITH temp_table AS(
    SELECT
         skill_id,
         COUNT(job_postings_fact.job_id) AS skill_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
        job_work_from_home = true AND 
        job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT 
    skills_dim.skills,
    skill_count

FROM skills_dim
INNER JOIN temp_table ON skills_dim.skill_id = temp_table.skill_id

ORDER BY skill_count DESC
LIMIT 5;








