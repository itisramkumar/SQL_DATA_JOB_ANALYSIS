/*
1. What are the top-paying jobs for my role?

Identify the top 10 highest-paying Data Analyst roles that are available remotely.
Focuses on job postings with specified salaries (remove nulls).

*/

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
LIMIT 10;

