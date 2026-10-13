# E-commerce Sales Analysis | Python, SQL & Power BI

## Project Overview
An end-to-end sales analytics project using Python/Pandas for data inspection and cleaning, Python and MySQL for exploratory data analysis (EDA), and Power BI for interactive reporting. The dashboard is titled **Sales Overview**.

## Business Objective
Analyze sales, profit, orders, customers, products, categories, cities, monthly trends, and payment methods to demonstrate a reproducible workflow from raw data to business reporting.

## Tools
- Python and Pandas
- MySQL / MySQL Workbench
- Power BI Desktop and DAX
- Jupyter Notebook
- GitHub

## Dataset
The inspection notebook starts with **50,500 rows and 16 columns**. After duplicate removal, the cleaned dataset contains **50,000 rows and 16 columns**.

Fields: `Order_ID`, `Order_Date`, `Customer_ID`, `Customer_Name`, `Age`, `Gender`, `City`, `State`, `Category`, `Product`, `Quantity`, `Unit_Price`, `Discount_Percent`, `Sales`, `Profit`, `Payment_Method`.

The SQL script uses database `ecom_sales_analysis_db` and table `ecommerce_sales_50000_cleaned`.

## Workflow

### 1. Data Inspection
The notebook uses Pandas to inspect shape, data types, head/tail/sample rows, missing-value counts and percentages, unique categories/cities, and duplicate records.

Initial missing values recorded:
| Column | Missing rows | Approx. % of 50,500 |
|---|---:|---:|
| Age | 1,009 | 2.00% |
| City | 1,009 | 2.00% |
| Product | 1,014 | 2.01% |
| Profit | 1,003 | 1.99% |
| Payment_Method | 1,007 | 1.99% |

The notebook found **500 duplicate rows**. It removed full-row duplicates, leaving 50,000 rows and zero duplicate rows. The final check also reported zero duplicate `Order_ID` values.

### 2. Data Cleaning
The notebook applies these transformations:
- Fills missing `Age` values using the median. It also contains an intermediate gender-group median fill step.
- Replaces missing `City`, `Product`, and `Payment_Method` with `Unknown`.
- Fills missing `Profit` values using the median.
- Removes full-row duplicates with `drop_duplicates()`.
- Converts `Order_Date` to a datetime type.
- Exports the cleaned data to `ecommerce_sales_50000_cleaned.csv`.

The notebook's final checks show 50,000 rows, 16 columns, zero missing values, and zero duplicate rows. Keep in mind that median imputation creates estimated values; disclose this treatment when interpreting profit and age analyses.

### 3. Python EDA — Findings from Notebook Outputs
The Python EDA notebook contains these reported outputs:
- **Top product by quantity:** Football, 6,102 units.
- **Highest-profit city:** Indore, 70,275,298.28 in total profit.
- **Highest-profit category:** Electronics, 114,289,895.16 in total profit.
- **Highest-sales category:** Electronics, 651,990,217.95 in sales.
- **Most frequent payment method:** Cash, 12,424 rows. The notebook also records 1,000 `Unknown` payment-method rows after cleaning.
- **Highest monthly sales:** October, 276,968,800 (approximately 276.97M).
- **Lowest monthly sales:** February, 250,385,400 (approximately 250.39M).

These figures are transcribed from saved notebook outputs and should be reconciled against SQL and the Power BI model before being treated as final certified KPIs.

## SQL EDA
The supplied SQL file uses `ecom_sales_analysis_db` and the table `ecommerce_sales_50000_cleaned`. It includes 10 query groups:
1. Overall business KPIs: sales, profit, distinct orders/customers, average order value
2. Top 10 products by sales
3. Top 10 cities by sales
4. Category-wise sales, profit, quantity, and orders
5. Monthly sales and profit trend
6. Top 10 customers by sales
7. Payment-method sales and percentage share
8. Top 10 most profitable products
9. Top city/category combinations by sales
10. Discount-versus-profit analysis

## Power BI Dashboard — Sales Overview
The supplied one-page dashboard includes:
- KPI cards: Total Sales (3.19bn), Total Profit (553.29M), Total Orders (50K), Total Customers (9K), Average Order Value (63.70K)
- Product table with Total Sales and Total Quantity
- Total Sales by City donut chart
- Total Sales by Category donut chart
- Sales by Month line chart
- Customer table with Total Sales and Total Quantity
- Total Profit by Category column chart
- Total Sales by Payment_Method chart
- `Order_Date` and `City` slicers

### How to use it
1. Choose a date range and/or city.
2. Review the KPI cards for the selected filter context.
3. Compare sales by city and category.
4. Review the monthly trend.
5. Inspect product and customer tables.
6. Compare profit by category and sales by payment method.
7. Clear slicers to return to the full view.

## Data Quality Note: Reconcile Before Final Publication
The dashboard shows Total Sales of **3.19bn**, but the product table's total row shows **6,474,08,635.55** (about 6.47bn). These values do not agree. The customer table's displayed total is **52,95,218.05** in its current visual context. Check the measures, filter context, relationships, and aggregations before publishing final dashboard conclusions.

The notebook's cleaning output and Python EDA output also need to be reconciled with SQL. In particular:
- Compare `SUM(Sales)` and `SUM(Profit)` across Python, SQL, and Power BI.
- Confirm distinct `Order_ID` and `Customer_ID` counts.
- Verify whether the product/customer table totals represent all records or a visual subset.
- Review the impact of median-imputed `Profit` values on profit metrics.
- Consider excluding or separately reporting `Unknown` city/product/payment-method records in segment analyses.

## Suggested GitHub Structure
```text
Ecommerce-Sales-Analysis/
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
Rename files/folders if desired, but update the README paths accordingly. The supplied dashboard PDF is not the editable PBIX file. Upload the PBIX only if you have it and want to share it. Do not upload sensitive data or data you do not have permission to distribute.

## Reproduce the Project
1. Run the inspection and cleaning notebook in order.
2. Update the local CSV path in the notebook for your own computer.
3. Import the cleaned CSV into MySQL.
4. Create/use database `ecom_sales_analysis_db` and table `ecommerce_sales_50000_cleaned`.
5. Run the 10 SQL EDA query groups.
6. Open the Power BI file, update the source path, and refresh.
7. Reconcile totals before reporting final business conclusions.

## Skills Demonstrated
Data inspection, missing-value treatment, duplicate handling, date parsing, Pandas groupby analysis, SQL aggregation and ranking, KPI validation, Power BI dashboarding, DAX/reporting concepts, and GitHub documentation.

## Limitations
The findings above reflect saved notebook outputs and the supplied dashboard PDF. The report does not claim that all SQL outputs have been executed and reconciled. The sales-total discrepancy should be resolved before the dashboard is presented as a validated final report.

## Author
**Ujjwal Patidar**  
E-commerce Sales Analysis | Python • SQL • Power BI
