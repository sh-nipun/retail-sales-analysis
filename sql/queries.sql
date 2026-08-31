-- Monthly Sales Trend
-- Purpose: Track total sales and profit by month to identify seasonal patterns
SELECT strftime('%Y-%m', Order_Date) AS month, 
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM sales
GROUP BY month
ORDER BY month;

-- Top 10 Products by Sales
-- Purpose: Identify best-performing products
SELECT Product_Name, 
       SUM(Sales) AS total_sales,
       SUM(Quantity) AS total_quantity
FROM sales
GROUP BY Product_Name
ORDER BY total_sales DESC
LIMIT 10;

-- Region-wise Performance
-- Purpose: Compare sales and profitability across regions
SELECT Region, 
       SUM(Sales) AS total_sales, 
       SUM(Profit) AS total_profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM sales
GROUP BY Region
ORDER BY total_profit DESC;

-- Category-wise Profit/Loss Breakdown
-- Purpose: Analyze which product categories are most/least profitable
SELECT Category, 
       SUM(Sales) AS total_sales, 
       SUM(Profit) AS total_profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_pct
FROM sales
GROUP BY Category
ORDER BY total_profit DESC;