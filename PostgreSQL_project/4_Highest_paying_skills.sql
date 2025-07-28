
/*

What are the highest-paying skills for Data Analysts?

    • Analyze the average annual salary linked to each skill in Data Analyst job postings.
    • Include only positions with a specified salary, regardless of location (remote or on-site).
    • Purpose: To uncover which skills contribute most to higher salaries in data analyst roles,
     helping professionals prioritize the most financially valuable competencies to develop.

*/

SELECT  
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS skill_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
        job_title_short = 'Data Analyst'AND
        salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY skill_salary DESC
LIMIT 30


/*

 Highest-Paying Data Analyst Skills, Insights:

    • SVN tops the list with a staggering average salary of $400,000, suggesting niche
     or legacy tools can sometimes yield very high compensation when demand outpaces supply.

    • Specialized or emerging tech skills like Solidity ($179K), DataRobot ($155K), and 
    MXNet ($149K) are highly valued, indicating that expertise in cutting-edge AI/ML tools
     and blockchain tech can significantly boost earning potential.

    • DevOps & Infrastructure tools such as Terraform ($146K), Puppet ($129K), and Ansible
     ($124K) also appear among top-paying skills, showing the value of cross-functional and
      automation capabilities in data roles.

*/