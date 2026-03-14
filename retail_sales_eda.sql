-- ============================================================
--  RETAIL SALES EXPLORATORY DATA ANALYSIS (EDA)
--  Analyst  : Data Analytics Division
--  Dataset  : sales_data (9,994 records)
--  Tool     : SQL (compatible with SQLite / MySQL / PostgreSQL)
--  Date     : 2025
-- ============================================================
-- NOTE: All Region values are normalised to UPPER() to handle
--       minor casing inconsistencies found in the raw dataset
--       (e.g. 'south', 'west', 'central' vs 'South', 'West').
-- ============================================================


-- ============================================================
-- QUESTION 1: DATASET OVERVIEW
-- Purpose : Retrieve the first 10 records from the dataset
--           to understand its structure, column names,
--           data types, and sample values.
-- ============================================================

SELECT
    Order_ID,
    Year,
    Order_Date,
    Month,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    City,
    State,
    Region,
    Category,
    Sub_Category,
    ROUND(Sales, 2)    AS Sales,
    Quantity,
    ROUND(Profit, 2)   AS Profit
FROM
    sales_data
LIMIT 10;


-- ============================================================
-- QUESTION 2: TOTAL SALES PERFORMANCE
-- Purpose : Calculate the overall total sales revenue and
--           total profit generated across all 9,994 orders.
--           This gives management a high-level financial snapshot.
-- Expected Result: Total Sales = $2,297,200.86 | Total Profit = $286,397.02
-- ============================================================

SELECT
    ROUND(SUM(Sales), 2)   AS Total_Sales,
    ROUND(SUM(Profit), 2)  AS Total_Profit,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100, 2
    )                      AS Profit_Margin_Pct
FROM
    sales_data;


-- ============================================================
-- QUESTION 3: REGIONAL ANALYSIS
-- Purpose : Identify which region generates the highest
--           total sales revenue to guide regional investment
--           and marketing strategies.
-- Note    : UPPER() is applied on Region to normalise casing
--           inconsistencies in the raw data.
-- Expected Result: West region leads with $725,450.54
-- ============================================================

SELECT
    UPPER(Region)          AS Region,
    ROUND(SUM(Sales), 2)   AS Total_Sales,
    ROUND(SUM(Profit), 2)  AS Total_Profit,
    COUNT(Order_ID)        AS Total_Orders
FROM
    sales_data
GROUP BY
    UPPER(Region)
ORDER BY
    Total_Sales DESC;


-- ============================================================
-- QUESTION 4: PRODUCT CATEGORY PERFORMANCE
-- Purpose : Show total sales and profit by each product
--           category, ordered from highest to lowest sales.
--           Helps management understand which product lines
--           drive the most revenue and which are most profitable.
-- Expected Result: Technology leads in both Sales and Profit.
-- ============================================================

SELECT
    Category,
    ROUND(SUM(Sales), 2)                        AS Total_Sales,
    ROUND(SUM(Profit), 2)                       AS Total_Profit,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100, 2
    )                                           AS Profit_Margin_Pct,
    SUM(Quantity)                               AS Total_Units_Sold
FROM
    sales_data
GROUP BY
    Category
ORDER BY
    Total_Sales DESC;


-- ============================================================
-- QUESTION 5: CUSTOMER SEGMENT ANALYSIS
-- Purpose : Calculate the average sales value per order for
--           each customer segment (Consumer, Corporate,
--           Home Office). Identifies which segment places
--           the highest-value orders on average.
-- Expected Result: Home Office has the highest average order value.
-- ============================================================

SELECT
    Segment,
    ROUND(AVG(Sales), 2)   AS Avg_Sales_Per_Order,
    ROUND(SUM(Sales), 2)   AS Total_Sales,
    ROUND(SUM(Profit), 2)  AS Total_Profit,
    COUNT(Order_ID)        AS Total_Orders
FROM
    sales_data
GROUP BY
    Segment
ORDER BY
    Avg_Sales_Per_Order DESC;


-- ============================================================
-- QUESTION 6: HIGH-VALUE ORDERS
-- Purpose : Retrieve all orders where the sales amount
--           exceeds $1,000, sorted from highest to lowest.
--           Useful for identifying key transactions and
--           high-spending customers for loyalty programmes.
-- ============================================================

SELECT
    Order_ID,
    Order_Date,
    Customer_Name,
    Segment,
    Region,
    Category,
    Sub_Category,
    ROUND(Sales, 2)    AS Sales,
    Quantity,
    ROUND(Profit, 2)   AS Profit
FROM
    sales_data
WHERE
    Sales > 1000
ORDER BY
    Sales DESC;


-- ============================================================
-- QUESTION 7: TOP PERFORMING SUB-CATEGORIES
-- Purpose : Identify the top 5 sub-categories ranked by
--           total profit to pinpoint the most profitable
--           product lines for inventory and pricing strategy.
-- Concepts : GROUP BY, ORDER BY, LIMIT
-- Expected Result: Copiers, Phones, Accessories, Paper, Binders
-- ============================================================

SELECT
    Sub_Category,
    ROUND(SUM(Profit), 2)   AS Total_Profit,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    SUM(Quantity)           AS Total_Units_Sold,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100, 2
    )                       AS Profit_Margin_Pct
FROM
    sales_data
GROUP BY
    Sub_Category
ORDER BY
    Total_Profit DESC
LIMIT 5;


-- ============================================================
-- QUESTION 8: PROFITABILITY CHECK
-- Purpose : Filter to show only product categories whose
--           total profit exceeds $10,000. This filters out
--           low-profit or loss-making categories that may
--           require review or discontinuation.
-- Concepts : GROUP BY, HAVING
-- Expected Result: All 3 categories exceed $10,000 profit.
-- ============================================================

SELECT
    Category,
    ROUND(SUM(Profit), 2)   AS Total_Profit,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100, 2
    )                       AS Profit_Margin_Pct
FROM
    sales_data
GROUP BY
    Category
HAVING
    SUM(Profit) > 10000
ORDER BY
    Total_Profit DESC;


-- ============================================================
-- END OF EDA SCRIPT
-- ============================================================
