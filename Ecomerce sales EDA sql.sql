SHOW DATABASES;
USE ecom_sales_analysis_db;
SHOW tables;

# EDA 
# 1. Overall Business KPIs
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS Average_Order_Value
FROM ecommerce_sales_50000_cleaned;

# 2. Top 10 Products by Sales
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM ecommerce_sales_50000_cleaned
WHERE Product IS NOT NULL
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;

# 3. Top 10 Cities by Sales
SELECT
    City,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_sales_50000_cleaned
WHERE City IS NOT NULL
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

# 4. Category-wise Sales & Profit
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_sales_50000_cleaned
WHERE Category IS NOT NULL
GROUP BY Category
ORDER BY Total_Sales DESC;

# 5. Monthly Sales Trend
SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month_Number,
    MONTHNAME(Order_Date) AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM ecommerce_sales_50000_cleaned
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date),
    MONTHNAME(Order_Date)
ORDER BY
    Year,
    Month_Number;
    
# 6. Top 10 Customers by Sales
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_sales_50000_cleaned
WHERE Customer_ID IS NOT NULL
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

# 7. Payment Method Analysis
SELECT
    Payment_Method,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales)
         FROM ecommerce_sales_50000_cleaned),
        2
    ) AS Sales_Percentage
FROM ecommerce_sales_50000_cleaned
GROUP BY Payment_Method
ORDER BY Total_Sales DESC;

# 8. Top 10 Most Profitable Products
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM ecommerce_sales_50000_cleaned
WHERE Product IS NOT NULL
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;

# 9. Top 10 City + Category Combinations
SELECT
    City,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_sales_50000_cleaned
WHERE City IS NOT NULL
  AND Category IS NOT NULL
GROUP BY
    City,
    Category
ORDER BY Total_Sales DESC
LIMIT 10;

# 10. Discount vs Profit Analysis
SELECT
    Discount_Percent,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Average_Profit
FROM ecommerce_sales_50000_cleaned
GROUP BY Discount_Percent
ORDER BY Discount_Percent;

