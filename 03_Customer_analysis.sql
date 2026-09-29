-- ============================================================
-- Olist E-Commerce Analysis
-- 03 - Customer Analysis
-- PostgreSQL
-- ============================================================
-- add customer table

select *
from order_payments
where payment_value is null
limit 10


-- ============================================================
-- Q1. Who are the highest-value customers?
-- ============================================================
SELECT c.customer_id,
		TO_CHAR(SUM(op.payment_value), '$999,999,999.99') AS total_payment_value

FROM customers as c
	INNER JOIN orders as o
		ON c.customer_id = o.customer_id
	INNER JOIN order_payments as op
		ON o.order_id = op.order_id
GROUP BY c.customer_id
ORDER BY SUM(op.payment_value) DESC
limit 1

-- ============================================================
-- Q2. How many orders does each customer make?
-- ============================================================

SELECT c.customer_unique_id,
		COUNT(o.order_id) AS total_order
FROM customers as c
	INNER JOIN orders as o
	ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY COUNT(o.order_id) DESC
limit 10
-- ============================================================
-- Q3. What percentage of customers are repeat customers?
-- ============================================================
WITH repeat_customer as(
	SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
    HAVING COUNT(o.order_id) >= 2
	)
SELECT
	COUNT(*) AS repeat_customers,
	(
		SELECT COUNT(DISTINCT customer_unique_id)
		FROM customers
	) AS total_customers,
	COUNT(*) * 100.0 /
	(
		SELECT COUNT(DISTINCT customer_unique_id)
		FROM customers
	) AS repeat_customer_percentage
FROM repeat_customer;
-- ============================================================
-- Q4. How much revenue comes from repeat customers versus one-time customers?
-- ============================================================
WITH repeat_customer as(
	SELECT
        c.customer_unique_id,
		COUNT(DISTINCT o.order_id) as total_orders,
		SUM(op.payment_value) AS total_revenue
    FROM customers AS c
	    INNER JOIN orders AS o
       	 ON c.customer_id = o.customer_id
		INNER JOIN order_payments AS op
			ON o.order_id = op.order_id
   
   WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
    HAVING COUNT(o.order_id) >= 2
	),

one_time_customer AS(
	SELECT
        c.customer_unique_id,
		COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(op.payment_value) AS ot_revenue
    FROM customers AS c
	    INNER JOIN orders AS o
       	 ON c.customer_id = o.customer_id
		INNER JOIN order_payments AS op
			ON o.order_id = op.order_id
   
   WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
    HAVING COUNT(o.order_id) = 1

)

SELECT
	TO_CHAR(SUM(total_revenue), '$999,999,999.00') as repeat_customer_revenue,
	(
		SELECT
			TO_CHAR(SUM(ot_revenue), '$999,999,999.00') 
		FROM one_time_customer
	) as one_time_customer_revenue
FROM repeat_customer
-- ============================================================
-- Q5. How long does it take customers to make a second purchase?
-- ============================================================
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        o.order_id,
        o.order_purchase_timestamp,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_unique_id
            ORDER BY o.order_purchase_timestamp
        ) AS order_rank
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
),

purchase_gap AS (
    SELECT
        customer_unique_id,
        MAX(CASE WHEN order_rank = 1 THEN order_purchase_timestamp END) AS first_purchase,
        MAX(CASE WHEN order_rank = 2 THEN order_purchase_timestamp END) AS second_purchase
    FROM customer_orders
    WHERE order_rank <= 2
    GROUP BY customer_unique_id
)

SELECT
    AVG(second_purchase::date - first_purchase::date) AS avg_days_to_second_purchase,

    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY second_purchase::date - first_purchase::date
    ) AS median_days_to_second_purchase

FROM purchase_gap
WHERE second_purchase IS NOT NULL;
 

 