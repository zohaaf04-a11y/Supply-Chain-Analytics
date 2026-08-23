-- ============================================================
-- SUPPLY CHAIN & INVENTORY ANALYTICS
-- SQL Business Analysis
-- ============================================================
-- Dataset:
-- Products: 550
-- Inventory: 5,500
-- Orders: 50,000
-- Suppliers: 50
-- Warehouses: 10
-- ============================================================


-- ============================================================
-- 1. REVENUE BY CATEGORY
-- Business Question:
-- Which product categories generate the most revenue?
-- ============================================================

SELECT
    p.Category,
    SUM(o.Total_Amount) AS Total_Revenue,
    SUM(o.Quantity) AS Total_Quantity_Sold,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders
FROM Orders o
JOIN Products p
    ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;


-- ============================================================
-- 2. TOP 10 PRODUCTS BY REVENUE
-- Business Question:
-- Which products generate the highest revenue?
-- ============================================================

SELECT
    p.Product_Name,
    p.Category,
    SUM(o.Total_Amount) AS Total_Revenue,
    SUM(o.Quantity) AS Total_Quantity_Sold,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders
FROM Orders o
JOIN Products p
    ON o.Product_ID = p.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name,
    p.Category
ORDER BY Total_Revenue DESC
LIMIT 10;


-- ============================================================
-- 3. PRODUCTS BELOW REORDER LEVEL
-- Business Question:
-- Which products require inventory replenishment?
-- ============================================================

SELECT
    p.Product_Name,
    i.Warehouse_ID,
    i.Stock_Quantity,
    i.Reorder_Level,
    CASE
        WHEN i.Stock_Quantity < i.Reorder_Level
        THEN 'Reorder'
        ELSE 'Sufficient Stock'
    END AS Reorder_Status
FROM Inventory i
JOIN Products p
    ON i.Product_ID = p.Product_ID
WHERE i.Stock_Quantity < i.Reorder_Level
ORDER BY
    (i.Reorder_Level - i.Stock_Quantity) DESC;


-- ============================================================
-- 4. REVENUE BY WAREHOUSE
-- Business Question:
-- Which warehouses generate the most revenue?
-- ============================================================

SELECT
    w.Warehouse_ID,
    w.Warehouse_Name,
    w.City,
    w.Region,
    SUM(o.Total_Amount) AS Total_Revenue,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders,
    SUM(o.Quantity) AS Total_Quantity_Sold
FROM Orders o
JOIN Warehouses w
    ON o.Warehouse_ID = w.Warehouse_ID
GROUP BY
    w.Warehouse_ID,
    w.Warehouse_Name,
    w.City,
    w.Region
ORDER BY Total_Revenue DESC;


-- ============================================================
-- 5. SUPPLIER PERFORMANCE
-- Business Question:
-- Which suppliers have strong ratings and supply significant
-- inventory?
-- ============================================================

SELECT
    s.Supplier_ID,
    s.Supplier_Name,
    s.Country,
    s.Lead_Time_Days,
    s.Rating,
    COUNT(DISTINCT i.Product_ID) AS Products_Supplied,
    SUM(i.Stock_Quantity) AS Total_Stock
FROM Suppliers s
JOIN Inventory i
    ON s.Supplier_ID = i.Supplier_ID
GROUP BY
    s.Supplier_ID,
    s.Supplier_Name,
    s.Country,
    s.Lead_Time_Days,
    s.Rating
ORDER BY
    s.Rating DESC,
    s.Lead_Time_Days ASC;


-- ============================================================
-- 6. INVENTORY VALUE BY SUPPLIER
-- Business Question:
-- Which suppliers have the highest inventory value?
-- ============================================================

SELECT
    s.Supplier_ID,
    s.Supplier_Name,
    SUM(i.Stock_Quantity * p.Unit_Cost) AS Inventory_Value,
    SUM(i.Stock_Quantity) AS Total_Stock
FROM Inventory i
JOIN Suppliers s
    ON i.Supplier_ID = s.Supplier_ID
JOIN Products p
    ON i.Product_ID = p.Product_ID
GROUP BY
    s.Supplier_ID,
    s.Supplier_Name
ORDER BY Inventory_Value DESC;


-- ============================================================
-- 7. AVERAGE ORDER VALUE BY WAREHOUSE
-- Business Question:
-- Which warehouses have the highest average order value?
-- ============================================================

SELECT
    w.Warehouse_ID,
    w.Warehouse_Name,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Revenue,
    ROUND(
        SUM(o.Total_Amount) /
        COUNT(DISTINCT o.Order_ID),
        2
    ) AS Average_Order_Value
FROM Orders o
JOIN Warehouses w
    ON o.Warehouse_ID = w.Warehouse_ID
GROUP BY
    w.Warehouse_ID,
    w.Warehouse_Name
ORDER BY Average_Order_Value DESC;


-- ============================================================
-- 8. MONTHLY REVENUE TREND
-- Business Question:
-- How does revenue change over time?
-- ============================================================

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Order_Month,
    SUM(Total_Amount) AS Total_Revenue,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold
FROM Orders
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Order_Month;


-- ============================================================
-- 9. REORDER RATE BY WAREHOUSE
-- Business Question:
-- Which warehouses have the highest proportion of inventory
-- requiring replenishment?
-- ============================================================

SELECT
    i.Warehouse_ID,
    COUNT(*) AS Total_Inventory_Records,
    SUM(
        CASE
            WHEN i.Stock_Quantity < i.Reorder_Level
            THEN 1
            ELSE 0
        END
    ) AS Products_Requiring_Reorder,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN i.Stock_Quantity < i.Reorder_Level
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS Reorder_Rate_Percent
FROM Inventory i
GROUP BY i.Warehouse_ID
ORDER BY Reorder_Rate_Percent DESC;


-- ============================================================
-- 10. SUPPLIER LEAD TIME VS RATING
-- Business Question:
-- Which suppliers combine short lead times with strong ratings?
-- ============================================================

SELECT
    Supplier_ID,
    Supplier_Name,
    Country,
    Lead_Time_Days,
    Rating
FROM Suppliers
ORDER BY
    Lead_Time_Days ASC,
    Rating DESC;
