create database supply_chain_demand;
use supply_chain_demand;

CREATE TABLE retail_sales (
    date DATE,
    store INT,
    sales FLOAT,
    holiday_flag INT,
    temperature FLOAT,
    fuel_price FLOAT,
    cpi FLOAT,
    unemployment FLOAT
);

ALTER TABLE retail_sales
RENAME COLUMN Weekly_Sales TO sales;

-- Total Sales
SELECT SUM(sales) AS total_sales
FROM retail_sales;
select * from retail_sales;

-- Monthly Sales Trend 
SELECT
YEAR(date) AS year,
MONTH(date) AS month,
SUM(sales) AS monthly_sales
FROM retail_sales
GROUP BY year, month
ORDER BY year, month;

--- Best Performing Store 
SELECT
store,
SUM(sales) AS total_sales
FROM retail_sales
GROUP BY store
ORDER BY total_sales DESC;

---- Holiday Impact on Sales 
SELECT
holiday_flag,
AVG(sales) AS avg_sales
FROM retail_sales
GROUP BY holiday_flag;


