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








    
