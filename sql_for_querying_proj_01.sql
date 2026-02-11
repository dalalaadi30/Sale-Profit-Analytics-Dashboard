DROP DATABASE sales_reporting_db;
CREATE DATABASE sales_reporting_db;
SET GLOBAL local_infile = 1;
USE sales_reporting_db;

SHOW VARIABLES LIKE 'secure_file_priv';

CREATE TABLE orders (
    SrNo INT NOT NULL AUTO_INCREMENT,

    ShipMode     VARCHAR(30) NOT NULL,
    Segment      VARCHAR(30) NOT NULL,
    Country      VARCHAR(50) NOT NULL,
    City         VARCHAR(100) NOT NULL,
    State        VARCHAR(100) NOT NULL,
    PostalCode   VARCHAR(10) NOT NULL,
    Region       VARCHAR(20) NOT NULL,
    Category     VARCHAR(50) NOT NULL,
    SubCategory  VARCHAR(50) NOT NULL,

    Sales        DECIMAL(12,4) NOT NULL,
    Quantity     INT NOT NULL,
    Discount     DECIMAL(5,2) NOT NULL,
    Profit       DECIMAL(12,4) NOT NULL,

    PRIMARY KEY (SrNo)
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SampleSuperstore.csv"
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ShipMode, Segment, Country, City, State, PostalCode, Region, Category, SubCategory, Sales, Quantity, Discount, Profit);

-- Total Record Count
SELECT COUNT(*) AS total_records
FROM orders;

-- Check Missing Critical Values (Sales & Profit)
SELECT 
    COUNT(*) AS missing_critical_values
FROM orders
WHERE Sales IS NULL OR Profit IS NULL;

-- Loss-Making Transactions
SELECT COUNT(*) AS loss_orders
FROM orders
WHERE Profit < 0;

-- KPI QUERIRES
-- Overall Sales & Profit Performance
SELECT
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM orders;

-- Region-Wise Performance
SELECT
    Region,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;

-- Category Contribution to Revenue
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS category_sales,
    ROUND(
        SUM(Sales) / (SELECT SUM(Sales) FROM orders) * 100,
        2
    ) AS contribution_pct
FROM orders
GROUP BY Category;

-- Sub-Category Performance (Drill-Down)
SELECT
    SubCategory,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY SubCategory
ORDER BY total_sales DESC;

-- Discount Impact on Profitability
SELECT
    Discount,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Discount
ORDER BY Discount;

-- Segment-Wise Performance
SELECT
    Segment,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Segment
ORDER BY total_sales DESC;







