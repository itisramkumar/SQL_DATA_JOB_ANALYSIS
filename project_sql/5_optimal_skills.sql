/*
5. What are the most optimal skills to learn?
*/

WITH skill_demand  as(
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
    AND jf.salary_year_avg IS NOT NULL

GROUP BY 
    sd.skill_id

),avg_sal as(
SELECT
    sd.skill_id,
    sd.skills,
    ROUND(AVG(jf.salary_year_avg),0) as pay_scale

FROM 
    skills_dim as sd 
    INNER JOIN skills_job_dim as sj on sd.skill_id = sj.skill_id
    INNER JOIN job_postings_fact as jf on sj.job_id = jf.job_id

WHERE
    jf.job_title_short = 'Data Analyst'
    AND jf.salary_year_avg IS NOT NULL
    AND jf.job_work_from_home = TRUE

GROUP BY
    sd.skill_id

)

SELECT
    skill_demand.skill_id,
    skill_demand.skills,
    skill_count,
    pay_scale
FROM
    skill_demand
    INNER JOIN avg_sal on skill_demand.skill_id = avg_sal.skill_id
WHERE
    skill_count>10
ORDER BY
    pay_scale DESC, 
    skill_count DESC
LIMIT 25;
    
/*
THE SIMPLER VERSION BELOW FOR YOUR CONVINIENCE
*/

SELECT
    sd.skill_id,
    sd.skills,
    count(sj.job_id) as skill_count,
    ROUND(AVG(jf.salary_year_avg),0) as avg_sal

FROM
    skills_dim as sd 
    INNER JOIN skills_job_dim as sj on sd.skill_id = sj.skill_id
    INNER JOIN job_postings_fact as jf on sj.job_id = jf.job_id

WHERE
    jf.job_title_short = 'Data Analyst'
    AND jf.job_work_from_home = TRUE
    AND jf.salary_year_avg IS NOT NULL

GROUP BY
    sd.skill_id
HAVING
    count(sj.job_id)>10
ORDER BY
    avg_sal DESC,
    skill_count DESC
LIMIT 25;

/*

Final Conclusion

The highest-paying and most strategically valuable analysts are no longer “report creators.”

They are becoming:

cloud-enabled analysts
analytics engineers
data infrastructure professionals
AI-assisted decision specialists

The 2026–2030 Analyst Archetype

Your dataset strongly suggests that the future successful analyst will look like this:

Capability	Skill Examples
Data Querying	SQL, NoSQL
Automation	Python, R
Visualization	Tableau, Looker, Qlik
Cloud Platforms	AWS, Azure, BigQuery
Data Engineering Awareness	Spark, Hadoop, Snowflake
Workflow Collaboration	Jira, Confluence
System Thinking	Go, Java

[
  {
    "skill_id": 8,
    "skills": "go",
    "skill_count": "27",
    "avg_sal": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "skill_count": "11",
    "avg_sal": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "skill_count": "22",
    "avg_sal": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "skill_count": "37",
    "avg_sal": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "skill_count": "34",
    "avg_sal": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "skill_count": "13",
    "avg_sal": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "skill_count": "32",
    "avg_sal": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "skill_count": "17",
    "avg_sal": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "skill_count": "12",
    "avg_sal": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "skill_count": "20",
    "avg_sal": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "skill_count": "37",
    "avg_sal": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "skill_count": "49",
    "avg_sal": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "skill_count": "13",
    "avg_sal": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "skill_count": "236",
    "avg_sal": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "skill_count": "148",
    "avg_sal": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "skill_count": "16",
    "avg_sal": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "skill_count": "13",
    "avg_sal": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "skill_count": "230",
    "avg_sal": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "skill_count": "14",
    "avg_sal": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "skill_count": "13",
    "avg_sal": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "skill_count": "11",
    "avg_sal": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "skill_count": "63",
    "avg_sal": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "skill_count": "63",
    "avg_sal": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "skill_count": "35",
    "avg_sal": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "skill_count": "20",
    "avg_sal": "97587"
  }
]
*/