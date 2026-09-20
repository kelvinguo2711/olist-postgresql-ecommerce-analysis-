# Brazilian E-Commerce Analysis — PostgreSQL

## 📌 Project Overview

This project analyzes the **Brazilian E-Commerce Public Dataset by Olist** using **PostgreSQL** and SQL.

The goal is to explore e-commerce sales, customer behavior, product performance, seller performance, and order fulfillment through SQL-based analysis.

The project is designed to demonstrate practical SQL skills, from basic data exploration and data quality checks to advanced queries using CTEs, subqueries, and window functions.

---

## 🛠️ Tools & Technologies

- PostgreSQL
- pgAdmin 4
- SQL
- GitHub

---

## 📊 Dataset

The project uses the **Brazilian E-Commerce Public Dataset by Olist**, a public dataset containing approximately 100,000 orders from the Brazilian e-commerce marketplace.

The dataset contains information about:

- Customers
- Orders
- Order items
- Products
- Sellers
- Payments
- Reviews
- Customer locations

### Data Source

[Olist Brazilian E-Commerce Public Dataset — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The raw CSV files are not included in this repository.

---

## 🗄️ Database Structure

The project uses a relational database structure with the following core tables:

```text
customers
    │
    │ customer_id
    ▼
orders
    │
    ├──────────────► order_payments
    │
    ├──────────────► order_reviews
    │
    │ order_id
    ▼
order_items
    │
    ├──────────────► products
    │
    └──────────────► sellers
---
##🔎 Analysis Questions

The analysis focuses on e-commerce sales, customer behavior, product performance, seller performance, and order fulfillment.

1. Data Exploration
 How many customers are in the dataset?
 How many orders are in the dataset?
 How many products and sellers are there?
 What is the date range of the orders?
 What are the different order statuses?
 Which Brazilian states have the most customers?
2. Sales Analysis
 What is the total revenue generated?
 What is the average order value?
 How does revenue change month over month?
 Which product categories generate the most revenue?
 What are the top products by revenue?
 Which sellers generate the most revenue?
3. Customer Analysis
 Who are the highest-value customers?
 How many orders does each customer make?
 What percentage of customers are repeat customers?
 How much revenue comes from repeat customers versus one-time customers?
 How long does it take customers to make a second purchase?
4. Product & Seller Analysis
 Which product categories have the highest average selling price?
 What are the top products within each category?
 Which sellers have the highest revenue?
 Which sellers have high revenue but lower customer review scores?
5. Delivery & Review Analysis
 What percentage of orders were delivered late?
 What is the average delivery time?
 Which states have the longest delivery times?
 Does delivery time relate to customer review scores?
6. Advanced SQL Analysis
 What is the month-over-month revenue growth?
 What is the cumulative revenue over time?
 How do sellers rank within each state?
 What are the top 3 products within each category?
 What are each customer's first and most recent purchases?
7. Customer Segmentation
 What are the Recency, Frequency, and Monetary values for each customer?
 How can customers be segmented using RFM analysis?
 How much revenue does each customer segment generate?
 How many customers belong to each segment?
📁 Project Structure
olist-postgresql-ecommerce-analysis/
│
├── README.md
│
├── sql/
│   └── 01_data_exploration.sql
│
└── documentation/
    ├── database_schema.md
    └── data_source.md

The SQL files contain the queries used to answer the analysis questions.
