-- ============================================================
-- Olist E-Commerce Analysis
-- 04 - Product and Seller Analysis
-- PostgreSQL
-- ============================================================

SELECT *
FROM products
limit 10

-- ============================================================
-- Q1.  Which product categories have the highest average selling price?
-- ============================================================
SELECT p.product_category_name, AVG(oi.price) AS avg_selling_price
FROM products as p
	INNER JOIN order_items as oi
		ON 	p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY avg_selling_price DESC

-- ============================================================
-- Q2.  What are the top products within each category?
-- ============================================================


-- ============================================================
-- Q3.   Which sellers have the highest revenue?
-- ============================================================
SELECT
    s.seller_id,
    SUM(oi.price) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM sellers AS s
INNER JOIN order_items AS oi
    ON s.seller_id = oi.seller_id
GROUP BY s.seller_id
ORDER BY total_revenue DESC;
-- ============================================================
-- Q4.  Which sellers have high revenue but lower customer review scores?
-- ============================================================
WITH order_review AS(
	SELECT
		order_id,
		AVG(review_score) AS avg_review_score
	FROM order_reviews
	GROUP BY order_id
	)

SELECT
    s.seller_id,
    SUM(oi.price) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders,
	AVG(ors.review_score) as avg_review_score
FROM sellers AS s
INNER JOIN order_items AS oi
    ON s.seller_id = oi.seller_id
INNER JOIN order_reviews AS ors
	ON oi.order_id = ors.order_id
GROUP BY s.seller_id
ORDER BY total_revenue DESC, avg_review_score ASC;


----
WITH order_review AS (
    SELECT
        order_id,
        AVG(review_score) AS avg_review_score
    FROM order_reviews
    GROUP BY order_id
),
seller_performance AS(
SELECT
    s.seller_id,
    SUM(oi.price) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders,
	AVG(ors.review_score) as avg_review_score
FROM sellers AS s
INNER JOIN order_items AS oi
    ON s.seller_id = oi.seller_id
INNER JOIN order_reviews AS ors
	ON oi.order_id = ors.order_id
GROUP BY s.seller_id
)
SELECT
    *,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank,
    RANK() OVER (
        ORDER BY avg_review_score ASC
    ) AS review_rank
FROM seller_performance
ORDER BY revenue_rank;