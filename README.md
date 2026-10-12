# E-commerce Sales Analysis | Python, SQL & Power BI

## 📌 Project Overview

This project focuses on analyzing e-commerce sales data using Python, SQL, and Power BI to identify business trends, evaluate sales performance, and generate meaningful insights. The project follows an end-to-end data analytics workflow, including data inspection, data cleaning, exploratory data analysis (EDA), SQL-based business analysis, and interactive dashboard development.

The **Sales Overview Dashboard** provides a consolidated view of key business metrics, product performance, city-wise sales, category-wise sales, monthly sales trends, customer performance, profit analysis, and payment method distribution.

## 🎯 Project Objectives

- Inspect and clean raw e-commerce sales data.
- Handle missing values and duplicate records.
- Perform exploratory data analysis using Python and Pandas.
- Write SQL queries to analyze business performance.
- Identify top-performing products, cities, and categories.
- Analyze monthly sales trends and payment methods.
- Develop an interactive Power BI dashboard.
- Present business metrics through clear visualizations and KPIs.

## 🛠️ Tools & Technologies

- **Python:** Data inspection, cleaning, and EDA
- **Pandas:** Data manipulation and analysis
- **MySQL:** SQL queries and business analysis
- **Power BI:** Interactive dashboard and data visualization
- **Jupyter Notebook:** Python analysis
- **GitHub:** Version control and project documentation

## 📂 Project Workflow

1. **Data Inspection:** Examined dataset dimensions, data types, missing values, unique values, and duplicate records.
2. **Data Cleaning:** Handled missing values, removed duplicate rows, converted order dates to datetime format, and exported the cleaned dataset.
3. **Python EDA:** Analyzed product quantities, city-wise profit, category performance, payment methods, and monthly sales.
4. **SQL Analysis:** Created queries for business KPIs, top products, top cities, category-wise performance, customer analysis, monthly trends, and discount-versus-profit analysis.
5. **Power BI Dashboard:** Created a Sales Overview Dashboard with KPI cards, charts, tables, and interactive slicers.
6. **Business Reporting:** Documented the workflow, findings, and data validation requirements.

## 📊 Power BI Dashboard — Sales Overview

The dashboard includes the following KPIs and visualizations:

### Key Performance Indicators (KPIs)
- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Average Order Value

### Dashboard Visualizations
- Total Sales by City
- Total Sales by Category
- Sales by Month
- Product-wise Sales and Quantity
- Customer-wise Sales and Quantity
- Total Profit by Category
- Total Sales by Payment Method

### Interactive Filters
- Order Date
- City

These filters help users explore sales performance across selected dates and cities.

## 🔍 Key Findings from Python EDA

The saved Python notebook outputs report the following initial findings:

- **Top product by quantity:** Football — 6,102 units
- **Highest-profit city:** Indore
- **Highest-sales category:** Electronics
- **Highest-profit category:** Electronics
- **Highest monthly sales:** October
- **Lowest monthly sales:** February
- **Most frequent payment method:** Cash

These findings should be reconciled with SQL query results and Power BI measures before being treated as final validated business conclusions.

## 🗃️ SQL Business Analysis

The SQL analysis covers:

1. Overall business KPIs
2. Top 10 products by sales
3. Top 10 cities by sales
4. Category-wise sales and profit
5. Monthly sales trends
6. Top 10 customers by sales
7. Payment method analysis
8. Top 10 most profitable products
9. City and category combinations
10. Discount versus profit analysis

**Database:** `ecom_sales_analysis_db`

**Table:** `ecommerce_sales_50000_cleaned`

## 📁 Suggested Repository Structure

```text
Ecommerce-Sales-Analysis/
│
├── README.md
├── Dataset/
│   ├── ecommerce_sales_50000_dirty.csv
│   └── ecommerce_sales_50000_cleaned.csv
├── Python/
│   ├── Ecomerce data cleening & inspection.ipynb
│   └── Econnerce EDA frome pythone.ipynb
├── SQL/
│   └── Ecomerce sales EDA sql.sql
├── PowerBI/
│   └── Sales_Overview_Dashboard.pbix
├── Screenshots/
│   └── Sales_Overview_Dashboard.png
└── Reports/
    └── Ecommerce_Sales_Analysis_Project_Report.pdf
```

## 📈 Skills Demonstrated

- Data Inspection and Cleaning
- Missing Value Treatment
- Duplicate Handling
- Exploratory Data Analysis (EDA)
- Python and Pandas
- MySQL and SQL Aggregations
- Business KPI Analysis
- Power BI Dashboard Development
- Data Visualization
- Business Reporting

## ⚠️ Data Validation Note

The supplied dashboard displays Total Sales of 3.19bn, while the product table's displayed total is approximately 6.47bn. These figures need reconciliation across Python, SQL, and Power BI before final results are published. Median-imputed profit values should also be considered when interpreting profitability.

## 👨‍💻 Author

**Ujjwal Patidar**

Aspiring Data Analyst | Python | SQL | Power BI
