-- ============================================================
-- Olist E-Commerce Analysis
-- 01 - Data Exploration
-- PostgreSQL
-- ============================================================


-- ============================================================
-- Q1. How many customers are in the dataset?
-- ============================================================

CREATE TABLE customers (
	customer_id VARCHAR(50),
	customer_unique_id VARCHAR(50),
	customer_zip_code_prefix INT,
	customer_city VARCHAR(100),
	customer_state VARCHAR(10)
);

SELECT COUNT(customer_id) as total_customers
from customers;

-- ============================================================
-- Q2. How many orders are in the dataset?
-- ============================================================
--- Creating dataset for orders
CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

---
select *
from orders
limit 10;

-- Total orders
SELECT COUNT (order_id) as total_order
from orders;
-- ============================================================
-- Q3. How many products and sellers are there?
-- ============================================================
--- products table
CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g NUMERIC,
    product_length_cm NUMERIC,
    product_height_cm NUMERIC,
    product_width_cm NUMERIC
);

SELECT COUNT (product_id) AS total_product
from products;

--- seller table

CREATE TABLE sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

SELECT COUNT(seller_id) as total_seller
from sellers;
-- ============================================================
-- Q4. What is the date range of the order?
-- ============================================================


-- ============================================================
-- Q5. What are the different order statuses?
-- ============================================================
SELECT DISTINCT order_status
FROM orders
order by order_status;

----
SELECT
	order_status,
	COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
-- ============================================================
-- Q6. Which Brazilian states have the most customers?
-- ============================================================
SELECT 
	customer_state,
	COUNT(*) as total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;


