# SQL & Python Business Case Study – Mobile App Market Analysis

## Project Overview
This project focuses on solving real-world business problems using Python and SQL on a mobile app dataset.

The raw dataset contained missing values, inconsistent formats, duplicate records, and multi-value genre columns.  
Python was used for data cleaning and preprocessing, after which the cleaned dataset was imported into SQL for business analysis and querying.

The objective of this project was to use data analytics techniques to generate business insights related to app performance, revenue generation, user behavior, and database management.

---

## Workflow

### Step 1 – Data Cleaning Using Python
Performed preprocessing and cleaning on the raw dataset using Python.

Tasks performed:
- Removed null and duplicate values
- Cleaned Installs,Reviews and Price columns
- Converted data types
- Handled missing data
- Prepared structured dataset for SQL analysis

### Step 2 – Database Analysis Using SQL
Imported the cleaned dataset into SQL and solved multiple real-world business problems using SQL queries.

---

## Dataset Information
The dataset contains details about mobile applications such as:

- App Name
- Category
- Rating
- Reviews
- Installs
- Type (Free/Paid)
- Price
- Genres
- Size
- Content Rating
- Last_Updated
- Current_Ver
- Android_Ver

---

# Business Problems Solved

## 1. Top Categories for Launching Free Apps
Identified the top 5 app categories based on average ratings of free applications.

## 2. Revenue Analysis of Paid Apps
Calculated estimated revenue using:
Revenue = Price × Installs

Found the top 3 revenue-generating categories.

## 3. Gaming App Distribution Analysis
Calculated percentage distribution of gaming apps across categories.

## 4. Free vs Paid Recommendation
Recommended whether businesses should focus on free or paid apps based on category ratings.

## 5. Database Security Scenario
Implemented a mechanism to track unauthorized price changes during a simulated hacking situation.

## 6. Data Restoration
Restored original price values after detecting manipulated records.

## 7. Correlation Analysis
Analyzed the relationship between app ratings and number of reviews.

## 8. Genre Data Cleaning
Separated multiple genres into individual columns for better recommender system performance.

## 9. Dynamic SQL Tool
Created a dynamic solution to identify underperforming apps within a selected category.

## 10. Query Performance Analysis
Studied the difference between Duration Time and Fetch Time in SQL execution.

---

# Technologies Used

## Python
- Pandas
- NumPy

## SQL
- MySQL
- Aggregate Functions
- CASE Statements
- Subqueries
- Joins
- Dynamic Queries

---

# Skills Demonstrated

- Data Cleaning
- Data Preprocessing
- Exploratory Data Analysis
- SQL Query Writing
- Business Problem Solving
- Database Auditing Concepts
- Analytical Thinking

---

# Key Learnings

- Cleaning raw datasets before analysis
- Converting business requirements into SQL solutions
- Extracting insights from structured data
- Understanding real-world database scenarios
- Combining Python and SQL in analytics workflows

---

# Project Presentation
A PowerPoint presentation explaining all business problems, SQL approaches, outputs, and insights is included in this repository.

---

# Author
Akshada Shendage
