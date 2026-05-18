/*
2. What are the skills required for these top-paying roles?
*/

SELECT
    jf.job_id,
    jf.job_title,
    sd.skills,
    jf.salary_year_avg as Pay_scale
FROM
    skills_dim as sd
    INNER JOIN skills_job_dim as sj on sd.skill_id = sj.skill_id
    INNER JOIN job_postings_fact as jf on sj.job_id = jf.job_id
WHERE
    jf.job_title_short='Data Analyst'
    AND jf.salary_year_avg IS NOT NULL
ORDER BY
    Pay_scale DESC


/*
If you would like to uise CTEs
SEE BELOW
*/
WITH top_paying_jobs as(
    SELECT
        job_id,
        job_title,
        name as Company_name,
        job_location,
        salary_year_avg as Pay_scale,
        job_schedule_type,
        job_posted_date::DATE
    FROM
        job_postings_fact
        LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location= 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
    INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    Pay_scale DESC


/*
Here are the key insights from your 2023 top-paying Data Analyst roles dataset:

Most In-Demand Skills
SQL → appeared 8 times
Python → appeared 7 times
Tableau → appeared 6 times
R → appeared 4 times
Snowflake / Pandas / Excel → appeared 3 times each

This shows that:

SQL is still the backbone of analytics roles
Python is becoming mandatory for higher-paying analytical work
Visualization tools like Tableau remain highly valued
Cloud + big data ecosystems are increasingly important
Highest Paying Skills

Skills associated with the highest average salaries included:

Databricks
PySpark
Jupyter
Hadoop
Azure
AWS
Power BI

Insight:
Traditional analytics alone is no longer enough for top salaries.
The market is rewarding people who combine:

Analytics
Cloud engineering
Big data processing
Data storytelling


[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "pay_scale": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "pay_scale": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "pay_scale": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "pay_scale": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "pay_scale": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "pay_scale": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "pay_scale": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "pay_scale": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "pay_scale": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "pay_scale": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "pay_scale": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "pay_scale": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "pay_scale": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "pay_scale": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "pay_scale": "184000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "pay_scale": "184000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "pay_scale": "184000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09",
    "skills": "r"
  }
]
*/





    
