-- ============================================================
-- Olist E-Commerce Analysis
-- 02 - Sales Analysis
-- PostgreSQL
-- ============================================================
-- add  table for order items
CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);
-- Table for order payments
CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value NUMERIC(10,2)
);

SELECT *
FROM order_payments
limit 10;
-- ============================================================
-- Q1. What is the total revenue generated?
-- ============================================================
SELECT SUM(price) as total_revenue
FROM order_items;

SELECT SUM(payment_value) as total_revenue
FROM order_payments;

-- ============================================================
-- Q2. What is the average order value?
-- ============================================================
SELECT ROUND(AVG(payment_value),2) as avg_order_value
FROM order_payments;

-- ============================================================
-- Q3. How does revenue change month over month?
-- ============================================================
WITH monthly_revenue AS(
	SELECT
		DATE_TRUNC('month', o.order_purchase_timestamp) as month,
		SUM(oi.price) as revenue
	FROM orders o
	JOIN order_items oi
		ON o.order_id = oi.order_id
	GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
	ORDER BY month
),

monthly_comparison AS(
	SELECT month,
	revenue,
	LAG(revenue) OVER(ORDER BY month) as previous_month_revenue
	FROM monthly_revenue
)

SELECT
		month,
		revenue,
		previous_month_revenue,
		CASE
			WHEN previous_month_revenue IS NULL THEN NULL
			ELSE ROUND((revenue - previous_month_revenue)/previous_month_revenue * 100,2)
		END AS mom_growth_pct
FROM monthly_comparison
ORDER BY month;
-- ============================================================
-- Q4. Which categories generate the most revenue?
-- ============================================================
SELECT 
	p.product_category_name as product_category,
	SUM(oi.price) as revenue
FROM order_items oi
LEFT JOIN products p
	on oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;
-- ============================================================
-- Q5. Which products generate the most revenue?
-- ============================================================
SELECT 
	p.product_id,
	SUM(oi.price) as revenue
FROM order_items oi
LEFT JOIN products p
	on oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY revenue DESC;
-- ============================================================
-- Q6. Which sellers generate the most revenue?
-- ============================================================
SELECT
	seller_id,
	SUM(price) as revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC;