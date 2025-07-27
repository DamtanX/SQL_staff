 # Introduction

 Dive into the data job market! This project focuses on Data Analyst roles—exploring the highest-paying positions, the most in-demand skills, and where high salary meets high impact in data analytics.

 Curious about the SQL queries? Check out the [PostgreSQL_project](PostgreSQL_project) folder for all the code used in the analysis.
# Background

This project was driven by a clear goal: to better understand the data analyst job market and make it easier for others to identify valuable opportunities. I aimed to answer essential questions about salary, skills, and market demand by analyzing a real-world job postings dataset from Luke Barousse's [SQL course](https://www.lukebarousse.com/sql).

The dataset includes job titles, salaries, locations, and required skills—ideal for identifying trends and insights.

### Here are the five main questions that guided my analysis:

  1. What are the highest-paying Data Analyst roles?
  2. Which skills are most required for the highest-paying Data Analyst roles?
  3. What are the highest in-demand skills for data analysts?
  4. What are the highest-paying skills for Data Analysts?
  5. What are the highest-impact skills to learn as a Data Analyst?

 # Tools I Used

To explore these questions, I used a mix of powerful tools:

  - **SQL** – The foundation for extracting, filtering, and analyzing the data.
  - **PostgreSQL** – A robust database management system to manage job postings data.
  - **Visual Studio Code** – My preferred environment for writing and running SQL queries.
  - **Git & GitHub** – For version control, collaboration, and sharing all project files and scripts.
  - **Python (Pandas, Matplotlib, Seaborn)** – Used for processing exported query results, creating meaningful visualizations, and supporting in-depth analysis of the extracted data.

# The Analysis

Each question was answered through structured **SQL queries** and data exploration techniques. Here's how I tackled each:
## 1. What are the highest-paying Data Analyst roles?

I filtered and sorted data analyst roles based on average annual salary, focusing on remote positions. This provided a clear view of which roles offer the **Highest earnings** in the field.

```sql
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
```

### Top Data Analyst Roles in 2023 **Insights**:

   • **Extensive Salary Range:** The highest-paying data analyst positions offer salaries 
   between $184,000 and $650,000, highlighting the strong earning potential within the industry.

   • **Variety of Employers:** High-paying roles are available at companies like SmartAsset, Meta, 
   and AT&T, demonstrating widespread demand for data talent across multiple sectors.

   • **Diverse Job Titles:** From Data Analyst to Director of Analytics, the roles show significant 
   variation, reflecting the wide spectrum of responsibilities and expertise in the data analytics field.

![Highest_paying_roles.png)](visualization/pictures/Highest_paying_roles.png)  
*Visualization of the Top 15 Data Analyst jobs ranked by Salary using a Bar Chart. I performed this Visualisation using Python — check it out here:* visualization.ipynb[](visualization/visualization.ipynb)
