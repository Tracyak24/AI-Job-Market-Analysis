-- Find Duplicates --
SELECT job_id, COUNT(*) AS count_job_id
FROM ai_job_dataset
GROUP BY job_id
HAVING COUNT(*) > 1;

-- Find Missing values -- 
SELECT COUNT(*) AS rows_with_nulls
FROM ai_job_dataset
WHERE job_id IS NULL
   OR job_title IS NULL
   OR salary_usd IS NULL
   OR salary_currency IS NULL
   OR experience_level IS NULL
   OR employment_type IS NULL
   OR company_location IS NULL
   OR company_size IS NULL
   OR employee_residence IS NULL
   OR remote_ratio IS NULL
   OR required_skills IS NULL
   OR education_required IS NULL
   OR years_experience IS NULL
   OR industry IS NULL
   OR posting_date IS NULL
   OR application_deadline IS NULL
   OR job_description_length IS NULL
   OR benefits_score IS NULL
   OR company_name IS NULL;

-- Identifying Incorrect Value In Salary --
SELECT *
FROM ai_job_dataset
WHERE salary_usd < 0;

-- Identifying Incorrect Value In Remote Ratio --
SELECT DISTINCT remote_ratio
FROM ai_job_dataset
WHERE remote_ratio NOT IN (0, 50, 100);

-- Identifying Incorrect Value In Experience Level --
SELECT DISTINCT experience_level
FROM ai_job_dataset;

-- Count of Rows
SELECT COUNT(*) AS total_rows
FROM ai_job_dataset;

-- Get Q1 (25th percentile) --
SELECT salary_usd
FROM ai_job_dataset
ORDER BY salary_usd
LIMIT 3749, 1; -- 15000 * 0.25 = 3750 (zero-based index = 3749) --

-- Get Q3 (75th percentile) --
SELECT salary_usd
FROM ai_job_dataset
ORDER BY salary_usd
LIMIT 11249, 1; -- 15000 * 0.75 = 11250 (zero-based index = 11249) --

-- Get Outliers --
SELECT *
FROM ai_job_dataset
WHERE salary_usd BETWEEN 0 AND 260794;

-- Top 5 Highest Paying Job Titles --
SELECT job_title, ROUND(AVG(salary_usd), 0) AS avg_salary
FROM ai_job_dataset
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 5;

-- Remote Work Trend by Company Size --
SELECT company_size, ROUND(AVG(remote_ratio), 0) AS avg_remote_ratio
FROM ai_job_dataset
GROUP BY company_size;

-- Most Demanding Companies --
SELECT company_name, ROUND(AVG(job_description_length), 0) AS avg_length
FROM ai_job_dataset
GROUP BY company_name
ORDER BY avg_length DESC
LIMIT 5;

-- TEMP TABLE to simulate array splitting --
CREATE TEMPORARY TABLE numbers (n INT);
INSERT INTO numbers (n)
SELECT a.N + b.N * 10 + 1
FROM (
  SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
) a,
(
  SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
) b
LIMIT 100;

-- Skills in High Demand --
SELECT 
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(required_skills, ', ', numbers.n), ', ', -1)) AS skill,
  COUNT(*) AS skill_count
FROM ai_job_dataset
JOIN numbers 
  ON CHAR_LENGTH(required_skills) - CHAR_LENGTH(REPLACE(required_skills, ', ', '')) + 1 >= numbers.n
WHERE required_skills IS NOT NULL AND required_skills != ''
GROUP BY skill
ORDER BY skill_count DESC
LIMIT 10;

-- Experience Level vs Salary --
SELECT experience_level, ROUND(AVG(salary_usd), 0) AS avg_salary
FROM ai_job_dataset AS jobs
WHERE salary_usd BETWEEN 0 AND 260794
GROUP BY experience_level
ORDER BY avg_salary DESC;