# 🛒 Retail Sales — SQL Exploratory Data Analysis (EDA)

> A structured SQL-based exploratory data analysis of a retail sales dataset covering 9,994 orders — uncovering revenue trends, regional performance, customer segments, and product profitability.

---

## 📌 Project Overview

This project performs a full **Exploratory Data Analysis (EDA)** on a retail sales dataset using SQL. The analysis answers 8 key business questions across sales performance, regional breakdowns, product categories, customer segments, and profitability — providing actionable insights for data-driven decision making.

---

## 📂 Repository Structure

```
retail-sales-sql-eda/
│
├── retail_sales_eda.sql       # Full SQL EDA script (8 analysis queries)
├── data/
│   └── retail_sales_raw.csv   # Raw dataset (9,994 records)
└── README.md                  # Project documentation
```

---

## 📊 Dataset Overview

| Column | Description |
|---|---|
| `Order_ID` | Unique identifier for each order |
| `Year` | Year the order was placed |
| `Order_Date` | Full date of the order |
| `Month` | Month of the order |
| `Ship_Mode` | Shipping method used |
| `Customer_ID` | Unique customer identifier |
| `Customer_Name` | Name of the customer |
| `Segment` | Customer segment (Consumer, Corporate, Home Office) |
| `City` | Customer city |
| `State` | Customer state |
| `Region` | Geographic region (West, East, Central, South) |
| `Category` | Product category (Technology, Furniture, Office Supplies) |
| `Sub_Category` | Product sub-category |
| `Sales` | Order sales amount ($) |
| `Quantity` | Number of units ordered |
| `Profit` | Profit generated from the order ($) |

---

## 🔍 EDA Questions Covered

| # | Question | Key Insight |
|---|---|---|
| 1 | Dataset Overview | First 10 records — structure and sample values |
| 2 | Total Sales Performance | Total Sales: **$2,297,200.86** \| Total Profit: **$286,397.02** |
| 3 | Regional Analysis | **West** region leads with **$725,450.54** in sales |
| 4 | Product Category Performance | **Technology** leads in both Sales and Profit |
| 5 | Customer Segment Analysis | **Home Office** has the highest average order value |
| 6 | High-Value Orders | All orders exceeding **$1,000** sorted by value |
| 7 | Top Performing Sub-Categories | Top 5: **Copiers, Phones, Accessories, Paper, Binders** |
| 8 | Profitability Check | All 3 categories exceed **$10,000** in profit |

---

## 💡 Key Findings

- 💰 **Total Revenue** of $2.3M generated across 9,994 orders with a **12.47% profit margin**
- 🌍 **West region** is the top-performing region by sales revenue
- 💻 **Technology** is the most profitable product category
- 🏠 **Home Office** customers place the highest-value individual orders
- 📋 **Copiers** are the single most profitable sub-category

---

## 🛠️ Tools & Concepts Used

| Tool / Concept | Usage |
|---|---|
| **SQL** | Core analysis language |
| **SQLite / MySQL / PostgreSQL** | Compatible with all three |
| `SELECT`, `WHERE`, `GROUP BY` | Data filtering and aggregation |
| `HAVING` | Post-aggregation filtering |
| `ORDER BY`, `LIMIT` | Ranking and top-N queries |
| `ROUND()`, `SUM()`, `AVG()`, `COUNT()` | Aggregate functions |
| `UPPER()` | Data normalisation for casing inconsistencies |

---

## 🧹 Data Notes

- `Region` values were normalised using `UPPER()` to handle casing inconsistencies in the raw data (e.g. `'south'` vs `'South'`)
- All monetary values are rounded to 2 decimal places for readability
- Dataset contains **9,994 records** with no duplicate Order IDs

---

## ▶️ How to Run

1. Clone this repository
2. Import `data/retail_sales_raw.csv` into your SQL environment as a table named `sales_data`
3. Open and run `retail_sales_eda.sql` query by query
4. Compatible with **SQLite**, **MySQL**, and **PostgreSQL**

```sql
-- Example: Run Question 2 to get total sales performance
SELECT
    ROUND(SUM(Sales), 2)   AS Total_Sales,
    ROUND(SUM(Profit), 2)  AS Total_Profit
FROM sales_data;
```

---

## 👤 Author

**Abdulfattah**
Data Analyst | Accounting Graduate | Interior Decorator

> *"Turning raw numbers into meaningful stories."*

---

## 📬 Contact

- 🐙 GitHub: [@fattah-canvas](https://github.com/fattah-canvas)

---

## 📝 License

This project is for portfolio and educational purposes.
