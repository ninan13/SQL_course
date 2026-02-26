/*
Question: What are the top skills based on my salary for my role?
- Look at the average salary associated with each skill for Data Analyst positions
- Focus on the roles with specified salaries, regardless of the location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire and improve 
*/

SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Here is a breakdown of the results:
Top-paying data analyst roles favor engineering-adjacent skills, 
especially in big data, cloud, and ML infrastructure. Analysts 
who work with distributed systems, automation, and MLOps earn 
more than those focused on reporting or visualization. While core 
Python tools remain important, higher pay reflects advanced, 
production-level use. Experience with version control, CI/CD, and 
cross-functional collaboration also correlates with higher salaries. 
Overall, the best-paid roles are senior, platform-aware, and 
system-focused, not dashboard-centric.
*/