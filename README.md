# AI-Job-Market-Analysis
An SQL-driven exploration of job market trends, salary insights, and in-demand skills in the AI industry.

• Data Source: Kaggle

• Dataset: AI Job Dataset (15,000+ rows of AI-related job listings with salary, location, experience, skills, and company data)


# 📌 Project Overview
This project is focused on performing data cleaning, validation, and exploratory analysis on a large-scale AI job dataset. Through a combination of data quality checks and business-driven queries, the goal is to extract meaningful insights related to salary trends, remote work adoption, company demand, skill prevalence, and experience level segmentation—key data points for both job seekers and industry stakeholders.


# 🎯 Objective
To ensure the dataset is analysis-ready by identifying and correcting data issues, and to generate actionable insights that reflect trends in the AI job market—such as the most in-demand roles, top-paying positions, required skills, and experience-based salary variations.


# 🔍 Key Business Questions Addressed

• Data Quality: Are there any duplicate or missing records that might affect analysis quality?

• Outlier Detection: Are there any salaries or categorical fields with invalid or inconsistent values?

• Job Role Insights: Which job titles offer the highest average salaries?

• Remote Work Trends: How does the adoption of remote work vary by company size?

• Company Demand: Which companies publish the most extensive job descriptions, potentially reflecting a strong hiring pipeline?

•Skill Requirements: What are the most frequently required technical skills across all listings?

•Experience-Level Salary Mapping: How does salary differ by experience level?

# 🧪 Methodology

1. 🧹 Data Cleaning & Validation:
 
  • Duplicate Detection: Identified duplicated job listings using GROUP BY job_id and HAVING COUNT(*) > 1.
 
  • Missing Value Identification: Counted all rows with null values in critical fields like salary_usd, experience_level, company_name, etc.
 
  • Outlier & Inconsistency Checks: Flagged negative salaries as invalid entries, Identified values in remote_ratio outside the expected range (0%, 50%, 100%), and Examined unique values   in experience_level to detect non-standard entries

  • Row Count Verification: Counted the total number of records to confirm dataset size.

  • Percentile Calculations for Salary (Q1 & Q3): Manually calculated 25th and 75th percentiles to support outlier filtering using zero-based indexing and LIMIT.

  • Outlier Filtering: Filtered salary data between $0 and $260,794 based on IQR calculations for a cleaner analysis baseline.

2. 📈 Exploratory Data Analysis:

   • Top-Paying Job Titles: Calculated average salaries for each job_title and returned the top 5 highest-paying roles.

   • Remote Work Trends by Company Size: Averaged remote_ratio for each company_size to understand remote work adoption patterns.

   • Company Demand Indicators: Used average job_description_length as a proxy for hiring intent or role complexity, highlighting top 5 companies.

   • Skills in High Demand: Parsed the required_skills comma-separated list using a numbers temporary table to simulate array splitting in SQL, and Counted occurrences of each skill and       returned the top 10 most frequent.

   • Salary by Experience Level: Compared average salaries across experience levels using conditional filters to exclude outliers.

# 💡 Value Proposition
This project not only demonstrates data cleaning proficiency using SQL but also showcases how exploratory queries can be used to answer high-impact business questions. Whether you're a recruiter, job seeker, or industry analyst, this analysis reveals patterns that can guide recruitment strategy, job applications, compensation planning, and skill development.

By transforming a raw dataset into a refined set of insights, this project highlights my capabilities in:

• Data preparation & anomaly detection

• Advanced SQL querying (including string manipulation, filtering, conditional logic, and aggregation)

• Translating data into actionable intelligence

# ✅ Key Takeaways

• Data quality issues (duplicates, nulls, invalid values) must be resolved before analysis.

• Data-driven insights reveal that experience level, company size, and skills significantly influence salary.

• High-paying roles tend to require specialized skills, which can be identified and tracked.

• Remote work flexibility varies widely across company sizes, offering insights for talent acquisition and workforce planning.
