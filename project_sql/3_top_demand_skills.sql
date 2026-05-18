/*
3. What are the most 10 in-demand skills for my role?
*/

WITH top_skills as (
SELECT

    sd.skill_id,
    count(*) as skill_count

FROM
    skills_dim as sd
    INNER JOIN skills_job_dim as sj on sd.skill_id = sj.skill_id
    INNER JOIN job_postings_fact as jf on sj.job_id = jf.job_id
WHERE
    jf.job_work_from_home = TRUE
    AND jf.job_title_short = 'Data Analyst'
GROUP BY
    sd.skill_id
)

SELECT 
    sd.skill_id,
    sd.skills,
    top_skills.skill_count
FROM
    top_skills
    INNER JOIN skills_dim as sd  on top_skills.skill_id = sd.skill_id

ORDER BY 
    top_skills.skill_count DESC;


/*
THE SIMPLER VERSION BELOW
*/

SELECT
    sd.skill_id,
    sd.skills,
    count(*) as skill_count
FROM
    skills_dim as sd 
    INNER JOIN skills_job_dim as sj on sd.skill_id = sj.skill_id
    INNER JOIN job_postings_fact as jf on sj.job_id = jf.job_id

WHERE
    jf.job_work_from_home = TRUE
    AND jf.job_title_short = 'Data Analyst'

GROUP BY 
    sd.skill_id
ORDER BY 
    skill_count DESC
LIMIT 10;

/*
The Biggest Truth from This Dataset

The highest employability does NOT come from knowing one tool deeply.

It comes from combining:

SQL + Visualization
SQL + Python
Python + Cloud
Analytics + Communication

The market is rewarding hybrid professionals.

A person who only knows Excel may survive.

A person who knows:

SQL
Python
BI tools
cloud basics

will dominate hiring pipelines over the next 5 years.


[
  {
    "skill_id": 0,
    "skills": "sql",
    "skill_count": "7291"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "skill_count": "4611"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "skill_count": "4330"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "skill_count": "3745"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "skill_count": "2609"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "skill_count": "2142"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "skill_count": "933"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "skill_count": "933"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "skill_count": "868"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "skill_count": "821"
  }
]
*/