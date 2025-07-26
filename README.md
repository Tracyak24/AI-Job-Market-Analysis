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
 
 • Outlier & Inconsistency Checks: Flagged negative salaries as invalid entries, Identified values in remote_ratio outside the expected range (0%, 50%, 100%), and Examined unique values in experience_level to detect non-standard entries
