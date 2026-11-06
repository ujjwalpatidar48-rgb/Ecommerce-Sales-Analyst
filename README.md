# E-Commerce Sales Analysis & Business Performance Dashboard

An end-to-end data analytics project that explores e-commerce sales, profitability, product performance, customer behavior, city-level performance, monthly trends, and payment methods using **Python, SQL, and Power BI**.

The project follows a business-focused workflow: data inspection → data cleaning → exploratory data analysis → SQL business analysis → Power BI reporting → business recommendations.

---

## Table of Contents

- [Business Problem](#business-problem)
- [Project Objectives](#project-objectives)
- [Tools and Technologies](#tools-and-technologies)
- [Dataset Overview](#dataset-overview)
- [Data Cleaning and Quality Checks](#data-cleaning-and-quality-checks)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [SQL Business Analysis](#sql-business-analysis)
- [Key Findings](#key-findings)
- [Business Interpretation and Possible Drivers](#business-interpretation-and-possible-drivers)
- [Business Recommendations](#business-recommendations)
- [Power BI Dashboard](#power-bi-dashboard)
- [Metric Reconciliation and Validation Notes](#metric-reconciliation-and-validation-notes)
- [How to Run the Project](#how-to-run-the-project)
- [Recommended Repository Structure](#recommended-repository-structure)
- [Limitations and Future Improvements](#limitations-and-future-improvements)
- [Project Outcome](#project-outcome)

---

## Business Problem

An e-commerce business needs to understand which products and categories generate sales and profit, which cities contribute most to business performance, how sales change over time, which customers contribute high revenue, and how customers pay for their orders.

Without a consolidated view of these metrics, business teams may find it difficult to identify strong-performing areas, investigate weaker performance, and make informed decisions about products, pricing, discounts, and marketing.

**Main business question:** What does the sales data reveal about revenue, profitability, products, customers, locations, monthly performance, and payment behavior?

## Project Objectives

1. Inspect and improve the quality of the raw e-commerce sales data.
2. Analyze overall sales, profit, orders, customers, and average order value.
3. Identify products with the highest sales volume and sales value.
4. Compare sales and profit across product categories.
5. Identify cities contributing the highest profit and sales.
6. Examine monthly sales trends.
7. Identify high-value customers.
8. Analyze payment-method distribution.
9. Explore the relationship between discount percentage and profit.
10. Present business KPIs and trends through a Power BI dashboard.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Python | Data inspection, cleaning, and exploratory analysis |
| Pandas | Data manipulation and data-quality checks |
| NumPy | Numerical operations |
| Matplotlib / Seaborn | Data visualization where used in the notebook |
| SQL / MySQL | Business queries, grouping, aggregations, and ranking |
| Power BI | KPI reporting and interactive dashboard |
| Jupyter Notebook | Reproducible analysis workflow |

## Dataset Overview

The supplied notebook contains **50,500 rows and 16 columns before cleaning**. The cleaning workflow removes 500 duplicate rows, resulting in **50,000 rows and 16 columns**.

| Column | Description |
|---|---|
| `Order_ID` | Order identifier |
| `Order_Date` | Date of order |
| `Customer_ID` | Customer identifier |
| `Customer_Name` | Customer name / label |
| `Age` | Customer age |
| `Gender` | Customer gender |
| `City` | Customer city |
| `State` | Customer state |
| `Category` | Product category |
| `Product` | Product name |
| `Quantity` | Units purchased |
| `Unit_Price` | Price per unit |
| `Discount_Percent` | Discount percentage |
| `Sales` | Sales amount |
| `Profit` | Profit amount |
| `Payment_Method` | Payment method used |

The SQL script uses the cleaned table name `ecommerce_sales_50000_cleaned`.

---

## Data Cleaning and Quality Checks

The data-cleaning notebook performs the following checks and transformations.

### 1. Initial data profiling

- Checked sample records using `head()`, `tail()`, and `sample()`.
- Reviewed dimensions, column names, and data types using `shape`, `columns`, and `info()`.
- Counted missing values using `isnull().sum()`.
- Measured missing-value percentages.
- Identified duplicate rows using `duplicated().sum()`.

### 2. Missing values identified before cleaning

| Column | Missing records | Approx. share of 50,500 rows |
|---|---:|---:|
| `Age` | 1,009 | 2.00% |
| `City` | 1,009 | 2.00% |
| `Product` | 1,014 | 2.01% |
| `Profit` | 1,003 | 1.99% |
| `Payment_Method` | 1,007 | 1.99% |
| **Total missing cells across these columns** | **5,042** | — |

These are missing-cell counts, not necessarily 5,042 different records; a single row may have more than one missing field.

### 3. Missing-value treatment

The notebook applies these treatments:

- `Age`: initially filled with the overall median; a gender-group median transformation is also present in the notebook.
- `City`: missing values replaced with `Unknown`.
- `Product`: missing values replaced with `Unknown`.
- `Payment_Method`: missing values replaced with `Unknown`.
- `Profit`: missing values replaced with the median.

After the cleaning steps, the notebook reports zero missing values across all 16 columns.

**Method note:** The notebook includes more than one age-imputation step. For a reproducible final pipeline, retain one documented method and explain why it is appropriate. Median imputation is less sensitive to extreme values than mean imputation, but it can still affect downstream averages and distributions.

### 4. Duplicate removal

- Initial row count: **50,500**
- Duplicate rows identified: **500**
- Duplicate rows removed using `drop_duplicates()`: **500**
- Final row count: **50,000**
- Duplicate rows remaining: **0**
- Duplicate `Order_ID` values reported after cleaning: **0**

### 5. Data-type correction

`Order_Date` was converted from string to datetime using:

```python
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
```

The notebook then exports the cleaned data to `ecommerce_sales_50000_cleaned.csv`.

### Final cleaning result

| Quality check | Before cleaning | After cleaning |
|---|---:|---:|
| Rows | 50,500 | 50,000 |
| Columns | 16 | 16 |
| Duplicate rows | 500 | 0 |
| Missing values | Present in 5 columns | 0 |
| `Order_Date` type | String | Datetime |
| Duplicate `Order_ID` values | — | 0 |

---

## Exploratory Data Analysis

The Python EDA notebook examines product quantity, city-wise profit, category-wise sales and profit, payment methods, and monthly sales.

### EDA questions explored

- Which product has the highest quantity sold?
- Which city generates the highest total profit?
- Which category generates the highest sales and profit?
- Which payment method is used most frequently?
- Which month records the highest sales?

---

## SQL Business Analysis

The SQL script contains 10 business analysis queries:

1. Overall business KPIs: total sales, total profit, orders, customers, and average order value.
2. Top 10 products by sales.
3. Top 10 cities by sales.
4. Category-wise sales and profit.
5. Monthly sales and profit trends.
6. Top 10 customers by sales.
7. Payment-method sales and contribution percentage.
8. Top 10 most profitable products.
9. Top 10 city and category combinations.
10. Discount percentage versus sales and profit.

SQL concepts used include:

- `SUM()`, `AVG()`, `COUNT(DISTINCT ...)`
- `GROUP BY` and `ORDER BY`
- `WHERE`
- `ROUND()`
- Subqueries
- `LIMIT`
- Date functions: `YEAR()`, `MONTH()`, and `MONTHNAME()`

---

## Key Findings

The following findings are directly reported in the supplied Python EDA notebook.

### 1. Top-selling product by quantity

| Product | Quantity sold |
|---|---:|
| Football | 6,102 |
| Mouse | 6,101 |
| Oil | 6,039 |
| Monitor | 6,038 |
| Cupboard | 6,007 |
| Mobile | 6,003 |
| Jeans | 5,999 |
| Tshirt | 5,999 |
| Keyboard | 5,983 |
| Chair | 5,973 |

**Finding:** Football is the top-selling product by quantity, with 6,102 units, followed closely by Mouse with 6,101 units.

### 2. City-wise profit

| City | Total profit |
|---|---:|
| Indore | 70,275,298.28 |
| Pune | 68,267,165.21 |
| Bhopal | 68,207,929.40 |
| Mumbai | 68,117,354.59 |
| Ahmedabad | 67,968,890.61 |
| Delhi | 67,515,062.19 |
| Lucknow | 66,572,695.21 |

**Finding:** Indore records the highest city-wise profit in the supplied EDA output, at approximately 70.28 million.

### 3. Category-wise profit

| Category | Total profit |
|---|---:|
| Electronics | 114,289,895.16 |
| Clothing | 111,324,400 approx. |
| Furniture | 110,517,600 approx. |
| Sports | 108,792,100 approx. |
| Grocery | 108,370,900 approx. |

**Finding:** Electronics is the highest-profit category in the EDA output.

### 4. Category-wise sales

| Category | Total sales |
|---|---:|
| Electronics | 651,990,217.95 |
| Clothing | 642,147,200 approx. |
| Furniture | 637,738,500 approx. |
| Sports | 629,536,000 approx. |
| Grocery | 623,615,500 approx. |

**Finding:** Electronics also records the highest category-wise sales in the EDA output.

### 5. Payment-method frequency

The cleaned EDA notebook reports:

| Payment method | Records |
|---|---:|
| Cash | 12,424 |
| Card | 12,226 |
| Net Banking | 12,206 |
| UPI | 12,144 |
| Unknown | 1,000 |

**Finding:** Cash is the most frequently recorded payment method in the cleaned EDA output. The 1,000 `Unknown` records represent payment methods that were missing before cleaning and were assigned the `Unknown` label.

### 6. Monthly sales

The notebook identifies **October** as the month with the highest sales.

| Month | Sales |
|---|---:|
| October | 276,968,800 approx. |
| August | 272,898,100 approx. |
| December | 270,997,100 approx. |
| September | 269,253,800 approx. |
| March | 268,356,000 approx. |
| May | 268,107,000 approx. |

**Finding:** October is the strongest month by sales in the supplied EDA output, while February is visibly lower in the monthly series.

---

## Business Interpretation and Possible Drivers

The analysis identifies performance patterns, but it does not prove why those patterns occurred. The following are business interpretations and hypotheses to investigate.

| Observed finding | Possible business interpretation | What to investigate next |
|---|---|---|
| Electronics leads category sales and profit | Electronics is a major revenue and profit contributor in this dataset | Product-level margins, inventory availability, and repeat purchases |
| Indore leads city-wise profit | Indore is a strong city in the recorded sales data | Order volume, product mix, customer count, and average order value by city |
| Football leads quantity sold | Sports demand may be concentrated in a few high-volume products | Stock-outs, repeat purchase patterns, and product-level profitability |
| October has the highest monthly sales | Seasonal demand or campaign activity may contribute | Promotions, holidays, inventory, and year-over-year trends |
| Cash is the most frequent payment method | Cash has the highest transaction count in the cleaned EDA output | Payment preference by city, customer segment, and order value |
| Discount and profit are analyzed in SQL | Discounts may affect revenue and margin differently | Compare profit per order and profit margin across discount bands |

**Important:** These are hypotheses, not confirmed causes. The supplied analysis does not include campaign data, inventory records, competitor prices, or customer feedback that would establish why the patterns occurred.

## Business Recommendations

1. **Prioritize high-performing categories:** Review Electronics inventory, product margins, and availability to protect the category's contribution.
2. **Study city-level performance:** Investigate what drives Indore's higher profit and test whether successful practices can be applied in other cities.
3. **Optimize product assortment:** Maintain availability of high-volume products such as Football and Mouse while evaluating their profit contribution.
4. **Plan seasonal campaigns:** Review October sales drivers and prepare inventory and marketing plans ahead of high-performing months.
5. **Monitor discount effectiveness:** Use the SQL discount analysis to identify discount levels that generate sales without eroding profit.
6. **Improve payment reporting:** Track the `Unknown` payment category separately and improve source-data completeness.
7. **Strengthen customer analysis:** Use the top-customer query to identify high-value customers and evaluate repeat purchase behavior.
8. **Track KPIs regularly:** Monitor sales, profit, orders, customers, average order value, category performance, and city performance over time.

---

## Power BI Dashboard

The supplied **Sales Overview Dashboard PDF (page 1)** shows an interactive sales overview with:

- KPI cards for Total Sales, Total Profit, Total Orders, Total Customers, and Average Order Value.
- Sales by city and category.
- Product sales and quantity table.
- Monthly sales trend.
- Customer sales table.
- Profit by category.
- Sales by payment method.
- Filters for order date and city.

### Dashboard values visible in the supplied PDF

| Dashboard KPI | Displayed value |
|---|---:|
| Total Sales | 3.19bn |
| Total Profit | 553.29M |
| Total Orders | 50K |
| Total Customers | 9K |
| Average Order Value | 63.70K |

The product table on the same page displays a total product sales value of **6,474,086,635.55** and total quantity of **30,188** for the products visible in that table.

## Metric Reconciliation and Validation Notes

The supplied dashboard and analysis outputs contain values that do not fully reconcile:

- Dashboard Total Sales KPI: approximately **3.19bn**.
- Dashboard product table total: approximately **6.474bn**.
- Dashboard Average Order Value: approximately **63.70K**.
- Dashboard order count: approximately **50K**.
- The product table quantity total is **30,188**, while the dashboard order KPI is 50K.

These figures may be using different filters, measures, aggregation levels, or data-model relationships. The current source files do not establish which dashboard total is the intended final business KPI.

**Before publishing the dashboard as a final result:**

1. Recalculate total sales directly from the cleaned SQL table.
2. Recalculate total profit and distinct order/customer counts from the same table.
3. Confirm whether the product table is filtered or displays only selected products.
4. Check Power BI relationships, filter context, and DAX aggregation.
5. Validate `Average Order Value = Total Sales / Distinct Orders` using the same filter context.
6. Make the dashboard KPI cards and SQL outputs agree, or clearly document why their scopes differ.

The README intentionally preserves the displayed dashboard values and flags the mismatch instead of presenting them as reconciled facts.

---

## How to Run the Project

### Prerequisites

- Python 3.x
- Jupyter Notebook
- MySQL Server and MySQL Workbench
- Power BI Desktop
- Python libraries: `pandas`, `numpy`, `matplotlib`, `seaborn`

Install dependencies:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### 1. Clone the repository

```bash
git clone https://github.com/<your-username>/<repository-name>.git
cd <repository-name>
```

### 2. Add the dataset

Place the cleaned CSV file in a `data/` directory:

```text
data/
└── ecommerce_sales_50000_cleaned.csv
```

Update the notebook's local CSV path to the repository's `data/` folder, for example:

```python
from pathlib import Path
import pandas as pd

data_path = Path("data/ecommerce_sales_50000_cleaned.csv")
df = pd.read_csv(data_path)
```

### 3. Run the notebooks

Run the data cleaning and inspection notebook first, followed by the EDA notebook:

1. `Ecomerce data cleening & inspection.ipynb`
2. `Econnerce EDA frome pythone.ipynb`

### 4. Run SQL analysis

1. Create or select the MySQL database `ecom_sales_analysis_db`.
2. Import the cleaned CSV into a table named `ecommerce_sales_50000_cleaned`.
3. Open `Ecomerce sales EDA sql.sql` in MySQL Workbench.
4. Execute the queries and compare the outputs with Python and Power BI.

### 5. Open the Power BI dashboard

Open the `.pbix` file if available, refresh the data connection, and validate its measures against SQL. The supplied materials include a dashboard PDF preview; a `.pbix` file was not included in the uploaded files.

---

## Recommended Repository Structure

```text
E-Commerce-Sales-Analysis/
│
├── data/
│   └── ecommerce_sales_50000_cleaned.csv
│
├── notebooks/
│   ├── Ecomerce_Data_Cleaning_Inspection.ipynb
│   └── Ecommerce_Sales_EDA.ipynb
│
├── sql/
│   └── Ecommerce_Sales_EDA.sql
│
├── dashboard/
│   ├── Sales_Overview_Dashboard.pbix
│   └── Sales_Overview_Dashboard_Preview.pdf
│
├── README.md
└── requirements.txt
```

Only publish data and dashboard source files if you have permission to distribute them. If the dataset is not yours to redistribute, include a data dictionary or a small anonymized sample instead.

## Limitations and Future Improvements

- Reconcile Power BI KPIs with SQL calculations.
- Add a documented data dictionary and data-source attribution.
- Compare profit margin, not only total profit, across products and categories.
- Analyze discount impact using profit margin and order-level comparisons.
- Add customer segmentation and repeat-purchase analysis.
- Add city-level average order value and customer retention metrics.
- Add month-over-month and year-over-year growth after validating the date range.
- Investigate the 1,000 `Unknown` payment-method records.
- Add inventory, marketing campaign, and customer feedback data to investigate business drivers more deeply.

---

## Project Outcome

This project demonstrates an end-to-end e-commerce sales analytics workflow using Python, SQL, and Power BI. The analysis highlights **Electronics** as the leading category by sales and profit in the supplied Python EDA output, **Indore** as the highest-profit city, **Football** as the highest-quantity product, and **October** as the strongest sales month.

The cleaning process reduces the dataset from 50,500 to 50,000 rows by removing 500 duplicate rows, fills the missing values documented in the notebook, and converts the order date to datetime format.

The results can help business teams investigate product assortment, city-level opportunities, seasonal planning, discount effectiveness, and payment-method reporting. Dashboard KPI reconciliation remains an important validation step before the report is used for formal business decisions.

**Project status:** Data cleaning, Python EDA, SQL business queries, and dashboard preview are available. Power BI KPI reconciliation and final reproducibility checks are recommended before publication.
