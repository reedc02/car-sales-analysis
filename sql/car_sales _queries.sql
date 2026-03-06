-- Car Sales Analysis Queries
-- (Data from Kaggle)

-- 1) Sales Volume and Average Price by Region
-- Main question: Which regions drive the most sales, and do any regions command meaningfully higher prices?

SELECT
    Dealer_Region,
    COUNT(*)                        AS total_sales,
    ROUND(AVG("Price ($)"), 2)      AS avg_price,
    ROUND(MIN("Price ($)"), 2)      AS min_price,
    ROUND(MAX("Price ($)"), 2)      AS max_price
FROM car_sales
GROUP BY Dealer_Region
ORDER BY total_sales DESC;

-- 2) Top 10 Best-Selling Models
-- Main question: Which car models appear most frequently in the dataset, regardless of price?

SELECT
    Company,
    Model,
    COUNT(*)                    AS total_sales,
    ROUND(AVG("Price ($)"), 2)  AS avg_price
FROM car_sales
GROUP BY Company, Model
ORDER BY total_sales DESC
LIMIT 10;


-- 3) Top 10 Models by Average Sale Price
-- Main question: Which models command the highest average sale prices? Filtered to models with at least 50 sales to avoid outliers skewing results.

SELECT
    Company,
    Model,
    COUNT(*)                    AS total_sales,
    ROUND(AVG("Price ($)"), 2)  AS avg_price
FROM car_sales
GROUP BY Company, Model
HAVING COUNT(*) >= 50
ORDER BY avg_price DESC
LIMIT 10;

-- 4) Monthly Revenue by Year 
-- Main question: How does total monthly revenue trend from 2022-2023? 

SELECT
    Year,
    Month,
    COUNT(*)                        AS total_sales,
    ROUND(SUM("Price ($)"), 2)      AS total_revenue,
    ROUND(AVG("Price ($)"), 2)      AS avg_price
FROM car_sales
GROUP BY Year, Month
ORDER BY Year, Month;


--  5) Top-Selling Brand per Region
-- Main question: Which brand leads in sales volume in each of the seven dealer regions?

WITH regional_brand_sales AS (
    SELECT
        Dealer_Region,
        Company,
        COUNT(*) AS total_sales
    FROM car_sales
    GROUP BY Dealer_Region, Company
),
ranked AS (
    SELECT
        Dealer_Region,
        Company,
        total_sales,
        RANK() OVER (
            PARTITION BY Dealer_Region
            ORDER BY total_sales DESC
        ) AS rank
    FROM regional_brand_sales
)
SELECT
    Dealer_Region,
    Company,
    total_sales
FROM ranked
WHERE rank = 1
ORDER BY total_sales DESC;