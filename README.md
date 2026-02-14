# Sales & Profit Performance Analytics Dashboard

## Project Overview
This project delivers an end-to-end analytics solution to analyze sales and profitability performance across regions, product categories, and customer segments. The objective was to provide business stakeholders with a centralized, validated, and executive-friendly dashboard to support data-driven decision-making.

The solution integrates SQL-based data validation with an interactive Power BI dashboard and formal UAT testing to ensure accuracy and business readiness.

---

## Business Problem
The business lacked a reliable view of profitability drivers and loss-making transactions. Key challenges included:
- No visibility into margin leakage caused by discounting
- Difficulty identifying loss-making product categories
- Inconsistent validation of KPIs across reporting layers

This project addresses these gaps by building a validated analytics pipeline with actionable insights.

---

## Tools & Technologies
- **MySQL** – Data storage, querying, and validation
-**Alteryx** -- For building data pipelines and Risk assesment metric.
- **SQL** – KPI calculations and data quality checks
- **Power BI** – Interactive dashboard and visual analytics
- **UAT Framework** – Business validation and sign-off

---

## Dataset
- Transaction-level sales data
- Metrics include Sales, Profit, Discount, Quantity
- Dimensions include Region, Category, Sub-Category, Segment

---

## Project Architecture
MySQL → Alteryx → SQL Validation → Power BI Dashboard → UAT Sign-off


---

## Dashboard Features
- KPI Cards: Total Sales, Total Profit, Profit Margin %, Loss-Making Orders
- Regional performance analysis (Sales vs Profit)
- Category and sub-category contribution analysis
- Discount impact on profitability
- Interactive slicers for Region, Category, and Segment

---

## Key Insights
- ~18.7% of transactions are loss-making
- Discounts above 30% significantly reduce profitability
- West region is the strongest contributor to sales and profit
- Sub-categories like Tables and Bookcases consistently generate losses

---

## Data Validation & UAT
All KPIs and visuals were validated against SQL queries. Formal UAT test cases were documented to ensure:
- Accuracy of financial metrics
- Correct behavior of filters and slicers
- Consistency between SQL and Power BI outputs

---

## usiness Recommendations
- Introduce discount governance with a cap around 30%
- Re-evaluate pricing strategies for loss-making sub-categories
- Focus growth initiatives on high-performing regions and segments

---

## Repository Contents
- `/sql` – Table creation, validation, and analysis queries
- `/powerbi` – Power BI dashboard file (.pbix)
- `/uat` – UAT test cases and validation documentation
- `/screenshots` – Dashboard visuals for quick preview

---

## How to Use
1. Review SQL scripts for data validation logic
2. Open the Power BI `.pbix` file to explore the dashboard
3. Refer to UAT documents for validation approach and test coverage

---

## Project Status
✅ Completed  
Validated and ready for business use.

---

## What This Project Demonstrates
- End-to-end data analytics workflow
- Strong SQL validation practices
- Executive-level dashboard design
- Business Analyst mindset with UAT ownership

---

## 👤 Author
Aaditya Dalal  
Aspiring Data Analyst | Business Analytics | SQL | Power BI
