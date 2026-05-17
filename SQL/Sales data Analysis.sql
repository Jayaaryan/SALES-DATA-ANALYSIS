-- =========================================
-- SALES ANALYTICS PROJECT QUERIES
-- =========================================


-- 1. TOP SELLING PRODUCTS

SELECT
    p.product_name,
    SUM(s.revenue) AS total_revenue
FROM sales s
LEFT JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;



-- 2. MONTHLY REVENUE TREND

SELECT
    cal.month,
    SUM(s.revenue) AS monthly_revenue
FROM sales s
LEFT JOIN calendar cal
ON s.order_date = cal.date
GROUP BY cal.month
ORDER BY cal.month;



-- 3. PROFIT BY CATEGORY

SELECT
    p.category,
    SUM(s.profit) AS total_profit
FROM sales s
LEFT JOIN products p
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;



-- 4. REVENUE BY GENDER

SELECT
    c.gender,
    SUM(s.revenue) AS total_revenue
FROM sales s
LEFT JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.gender;



-- 5. TOP CUSTOMERS

SELECT
    customer_id,
    SUM(revenue) AS total_spending
FROM sales
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 10;



-- 6. AVERAGE REVENUE BY STORE

SELECT
    store_id,
    AVG(revenue) AS avg_revenue
FROM sales
GROUP BY store_id;



-- 7. PRODUCTS WITH HIGHEST PROFIT

SELECT
    p.product_name,
    SUM(s.profit) AS total_profit
FROM sales s
LEFT JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC
LIMIT 10;



-- 8. HIGH VALUE SALES

SELECT *
FROM sales
WHERE revenue > 500;



-- 9. PROFIT MARGIN ANALYSIS

SELECT
    revenue,
    profit,
    (profit / revenue) * 100 AS profit_margin
FROM sales;



-- 10. CUSTOMER SALES TABLE

CREATE TABLE customer_sales AS

SELECT
    s.order_id,
    s.customer_id,
    s.revenue,
    s.profit,
    c.gender,
    c.age
FROM sales s
LEFT JOIN customers c
ON s.customer_id = c.customer_id;