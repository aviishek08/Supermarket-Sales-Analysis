USE nepal_supermarket;

-- 1. Overall Sales Performance

SELECT
    COUNT(*) AS Total_Records,
    SUM(Weekly_Sales) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Weekly_Sales,
    ROUND(MIN(Weekly_Sales), 2) AS Minimum_Weekly_Sales,
    ROUND(MAX(Weekly_Sales), 2) AS Maximum_Weekly_Sales,
    ROUND(STDDEV(Weekly_Sales), 2) AS Sales_Standard_Deviation
FROM supermarket_sales;

-- 2. Yearly Sales Performance

SELECT
    YEAR(Date) AS Sales_Year,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    COUNT(*) AS Total_Records
FROM supermarket_sales
GROUP BY YEAR(Date)
ORDER BY Sales_Year;

-- 3. Store Performance Analysis

SELECT
    Store,
    Store_Type,
    Store_Size,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    COUNT(*) AS Total_Records
FROM supermarket_sales
GROUP BY
    Store,
    Store_Type,
    Store_Size
ORDER BY Total_Sales DESC;

-- 4. Department Performance Analysis

SELECT
    Dept,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    COUNT(*) AS Total_Records
FROM supermarket_sales
GROUP BY Dept
ORDER BY Total_Sales DESC;

-- 5. Holiday vs Non-Holiday Sales Analysis

SELECT
    IsHoliday,
    COUNT(*) AS Total_Records,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    ROUND(MIN(Weekly_Sales), 2) AS Minimum_Sales,
    ROUND(MAX(Weekly_Sales), 2) AS Maximum_Sales
FROM supermarket_sales
GROUP BY IsHoliday
ORDER BY IsHoliday;

-- 6. Store Type Performance Analysis

SELECT
    Store_Type,
    COUNT(DISTINCT Store) AS Number_Of_Stores,
    COUNT(*) AS Total_Records,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    ROUND(MIN(Weekly_Sales), 2) AS Minimum_Sales,
    ROUND(MAX(Weekly_Sales), 2) AS Maximum_Sales
FROM supermarket_sales
GROUP BY Store_Type
ORDER BY Average_Sales DESC;

-- 7. Monthly Sales Trend Analysis

SELECT
    MONTH(Date) AS Month_Number,
    MONTHNAME(Date) AS Month_Name,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    COUNT(*) AS Total_Records
FROM supermarket_sales
GROUP BY
    MONTH(Date),
    MONTHNAME(Date)
ORDER BY Month_Number;

-- 8. Holiday-Wise Sales Performance

SELECT
    Holiday_Name,
    COUNT(*) AS Total_Records,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    ROUND(MIN(Weekly_Sales), 2) AS Minimum_Sales,
    ROUND(MAX(Weekly_Sales), 2) AS Maximum_Sales
FROM supermarket_sales
WHERE IsHoliday = 'True'
GROUP BY Holiday_Name
ORDER BY Average_Sales DESC;

-- 9. Store Size vs Sales Performance

SELECT
    Store,
    Store_Type,
    Store_Size,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    ROUND(
        SUM(Weekly_Sales) / Store_Size,
        2
    ) AS Sales_Per_Size_Unit
FROM supermarket_sales
GROUP BY
    Store,
    Store_Type,
    Store_Size
ORDER BY Sales_Per_Size_Unit DESC;

-- 10. Department Performance by Store Type

SELECT
    Dept,
    Store_Type,
    COUNT(*) AS Total_Records,
    ROUND(AVG(Weekly_Sales), 2) AS Average_Sales,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM supermarket_sales
GROUP BY
    Dept,
    Store_Type
ORDER BY
    Dept,
    Store_Type;
    
-- 11. External Factors vs Sales Analysis

SELECT
    'Temperature' AS External_Factor,
    ROUND(
        (
            AVG(Temperature * Weekly_Sales)
            - AVG(Temperature) * AVG(Weekly_Sales)
        ) /
        (
            STDDEV_POP(Temperature) * STDDEV_POP(Weekly_Sales)
        ),
        4
    ) AS Correlation
FROM supermarket_sales

UNION ALL

SELECT
    'Fuel Price',
    ROUND(
        (
            AVG(Fuel_Price * Weekly_Sales)
            - AVG(Fuel_Price) * AVG(Weekly_Sales)
        ) /
        (
            STDDEV_POP(Fuel_Price) * STDDEV_POP(Weekly_Sales)
        ),
        4
    )
FROM supermarket_sales

UNION ALL

SELECT
    'CPI',
    ROUND(
        (
            AVG(CPI * Weekly_Sales)
            - AVG(CPI) * AVG(Weekly_Sales)
        ) /
        (
            STDDEV_POP(CPI) * STDDEV_POP(Weekly_Sales)
        ),
        4
    )
FROM supermarket_sales

UNION ALL

SELECT
    'Unemployment',
    ROUND(
        (
            AVG(Unemployment * Weekly_Sales)
            - AVG(Unemployment) * AVG(Weekly_Sales)
        ) /
        (
            STDDEV_POP(Unemployment) * STDDEV_POP(Weekly_Sales)
        ),
        4
    )
FROM supermarket_sales;

-- 12. Year-over-Year Sales Growth

WITH Yearly_Sales AS (
    SELECT
        YEAR(Date) AS Sales_Year,
        SUM(Weekly_Sales) AS Total_Sales
    FROM supermarket_sales
    GROUP BY YEAR(Date)
),

Sales_With_Previous_Year AS (
    SELECT
        Sales_Year,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Sales_Year
        ) AS Previous_Year_Sales
    FROM Yearly_Sales
)

SELECT
    Sales_Year,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(Previous_Year_Sales, 2) AS Previous_Year_Sales,
    ROUND(
        (
            (Total_Sales - Previous_Year_Sales)
            / Previous_Year_Sales
        ) * 100,
        2
    ) AS Growth_Percentage
FROM Sales_With_Previous_Year
ORDER BY Sales_Year;