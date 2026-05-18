/*4. What are the top skills based on salary for my role?


a. Optimal: High Demand AND High Paying
*/

SELECT
    sd.skills,
    ROUND(AVG(jf.salary_year_avg),0) as pay_scale

FROM 
    skills_dim as sd 
    INNER JOIN skills_job_dim as sj on sd.skill_id = sj.skill_id
    INNER JOIN job_postings_fact as jf on sj.job_id = jf.job_id

WHERE
    jf.job_title_short = 'Data Analyst'
    AND jf.salary_year_avg IS NOT NULL

GROUP BY
    sd.skills
ORDER BY
    pay_scale DESC

LIMIT 20;

/*
Strategic Career Insight

If someone wants:

easier entry → learn analytics stack
elite salary trajectory → specialize deeply

The highest-paid professionals today are usually combinations of:

software engineer
cloud architect
AI engineer
systems engineer
data infrastructure specialist

not just traditional analysts.

Most Future-Proof Combination (2026–2030)

A very powerful stack would be:

SQL
Python
Cloud (Azure/AWS/GCP)
Terraform
Kafka
PyTorch/TensorFlow
CI/CD knowledge
Distributed systems basics

That combination aligns with where the industry is heading:
AI-powered scalable cloud ecosystems.

[
  {
    "skills": "svn",
    "pay_scale": "400000"
  },
  {
    "skills": "solidity",
    "pay_scale": "179000"
  },
  {
    "skills": "couchbase",
    "pay_scale": "160515"
  },
  {
    "skills": "datarobot",
    "pay_scale": "155486"
  },
  {
    "skills": "golang",
    "pay_scale": "155000"
  },
  {
    "skills": "mxnet",
    "pay_scale": "149000"
  },
  {
    "skills": "dplyr",
    "pay_scale": "147633"
  },
  {
    "skills": "vmware",
    "pay_scale": "147500"
  },
  {
    "skills": "terraform",
    "pay_scale": "146734"
  },
  {
    "skills": "twilio",
    "pay_scale": "138500"
  },
  {
    "skills": "gitlab",
    "pay_scale": "134126"
  },
  {
    "skills": "kafka",
    "pay_scale": "129999"
  },
  {
    "skills": "puppet",
    "pay_scale": "129820"
  },
  {
    "skills": "keras",
    "pay_scale": "127013"
  },
  {
    "skills": "pytorch",
    "pay_scale": "125226"
  },
  {
    "skills": "perl",
    "pay_scale": "124686"
  },
  {
    "skills": "ansible",
    "pay_scale": "124370"
  },
  {
    "skills": "hugging face",
    "pay_scale": "123950"
  },
  {
    "skills": "tensorflow",
    "pay_scale": "120647"
  },
  {
    "skills": "cassandra",
    "pay_scale": "118407"
  }
]
*/