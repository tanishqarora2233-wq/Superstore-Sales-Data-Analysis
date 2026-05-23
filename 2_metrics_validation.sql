-- ====================================================================
-- PROJECT SUBMISSION: PART 2 - METRICS RECONCILIATION AUDIT
-- Objective: Verify backend data aligns completely with frontend visuals
-- ====================================================================

-- A. Validate Ingestion Records Depth & Order Integrity
SELECT 
    COUNT(*) AS Total_Ingested_Rows,
    COUNT(DISTINCT [Order ID]) AS Unique_Order_Count
FROM 
    [Working Set];

-- B. Validate Regional Sales Targets
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Gross_Regional_Sales
FROM 
    [Working Set]
GROUP BY 
    Region
ORDER BY 
    Gross_Regional_Sales DESC;

-- C. Validate Category Performance & Estimated Target Margins (12%)
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Gross_Category_Sales,
    ROUND(SUM(Sales) * 0.12, 2) AS Calculated_Net_Profit
FROM 
    [Working Set]
GROUP BY 
    Category
ORDER BY 
    Calculated_Net_Profit DESC;

-- D. Validate Premium High-Value Enterprise Accounts
SELECT TOP 3
    [Customer Name],
    ROUND(SUM(Sales), 2) AS Total_Lifetime_Value
FROM 
    [Working Set]
GROUP BY 
    [Customer Name]
ORDER BY 
    Total_Lifetime_Value DESC;