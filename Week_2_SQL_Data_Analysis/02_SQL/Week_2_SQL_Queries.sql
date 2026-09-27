-- ==========================================
-- WEEK 2: SQL FOR DATA ANALYSIS
-- Dataset: SQL Sales Dataset - 200 Rows
-- ==========================================


-- ==========================================
-- 1. SELECT - Display all records
-- ==========================================

SELECT *
FROM sales;


-- ==========================================
-- 2. SELECT - Specific columns
-- ==========================================

SELECT
    order_id,
    customer_name,
    category,
    total_price
FROM sales;


-- ==========================================
-- 3. WHERE - High-value orders
-- ==========================================

SELECT *
FROM sales
WHERE total_price > 20000;


-- ==========================================
-- 4. ORDER BY - Highest orders first
-- ==========================================

SELECT
    order_id,
    customer_name,
    total_price
FROM sales
ORDER BY total_price DESC;


-- ==========================================
-- 5. COUNT - Total orders
-- ==========================================

SELECT COUNT(*) AS total_orders
FROM sales;


-- ==========================================
-- 6. SUM - Total sales
-- ==========================================

SELECT SUM(total_price) AS total_sales
FROM sales;


-- ==========================================
-- 7. AVG - Average Order Value
-- ==========================================

SELECT
    ROUND(AVG(total_price), 2) AS average_order_value
FROM sales;


-- ==========================================
-- 8. GROUP BY - Sales by category
-- ==========================================

SELECT
    category,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;


-- ==========================================
-- 9. Average Order Value by Category
-- ==========================================

SELECT
    category,
    ROUND(AVG(total_price), 2) AS average_order_value
FROM sales
GROUP BY category
ORDER BY average_order_value DESC;


-- ==========================================
-- 10. Top 10 Customers
-- ==========================================

SELECT
    customer_name,
    SUM(total_price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- ==========================================
-- 11. JOIN
-- ==========================================

CREATE TABLE category_info (
    category TEXT,
    category_type TEXT
);

INSERT INTO category_info (category, category_type)
VALUES
('Electronics', 'Technology'),
('Furniture', 'Home'),
('Grocery', 'Daily Essentials'),
('Clothing', 'Fashion');

SELECT
    s.order_id,
    s.product_name,
    s.category,
    c.category_type,
    s.total_price
FROM sales s
JOIN category_info c
    ON s.category = c.category;


-- ==========================================
-- 12. SUBQUERY
-- Orders above average
-- ==========================================

SELECT
    order_id,
    customer_name,
    total_price
FROM sales
WHERE total_price > (
    SELECT AVG(total_price)
    FROM sales
)
ORDER BY total_price DESC;


-- ==========================================
-- 13. CASE STATEMENT
-- ==========================================

SELECT
    order_id,
    customer_name,
    total_price,
    CASE
        WHEN total_price >= 30000 THEN 'High Value'
        WHEN total_price >= 15000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category
FROM sales;


-- ==========================================
-- 14. Regional Analysis
-- ==========================================

SELECT
    region,
    COUNT(*) AS total_orders,
    ROUND(AVG(total_price), 2) AS average_order_value,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;


-- ==========================================
-- 15. FINAL SUMMARY
-- ==========================================

SELECT
    COUNT(*) AS total_orders,
    SUM(total_price) AS total_sales,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MAX(total_price) AS highest_order_value,
    MIN(total_price) AS lowest_order_value
FROM sales;