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
```
---
## 🔎 Analysis Questions

The analysis focuses on e-commerce sales, customer behavior, product performance, seller performance, and order fulfillment using PostgreSQL.

| # | Analysis Section | Business Questions | SQL File |
|---|---|---|---|
| **1** | **Data Exploration** | 1. How many customers are in the dataset?<br>2. How many orders are in the dataset?<br>3. How many products and sellers are there?<br>4. What is the date range of the orders?<br>5. What are the different order statuses?<br>6. Which Brazilian states have the most customers? | [01_data_exploration.sql](./01_data_exploration.sql) |
| **2** | **Sales Analysis** | 1. What is the total revenue generated?<br>2. What is the average order value?<br>3. How does revenue change month over month?<br>4. Which categories generate the most revenue?<br>5. Which sellers generate the most revenue? | [02_sales_analysis.sql](./02_sales_analysis.sql) |
| **3** | **Customer Analysis** | 1. Who are the highest-value customers?<br>2. How many orders does each customer make?<br>3. What percentage of customers are repeat customers?<br>4. How much revenue comes from repeat customers versus one-time customers?<br>5. How long does it take customers to make a second purchase? | [03_Customer_analysis.sql](./03_Customer_analysis.sql) |
| **4** | **Product & Seller Analysis** | 1. Which product categories have the highest average selling price?<br>2. What are the top products within each category?<br>3. Which sellers have the highest revenue?<br>4. Which sellers have high revenue but lower customer review scores? | [04_Product_and_seller_analysis.sql](./04_Product_and_seller_analysis.sql) |
| **5** | **Delivery & Review Analysis** | 1. What percentage of orders were delivered late?<br>2. What is the average delivery time?<br>3. Which states have the longest delivery times?<br>4. Does delivery time relate to customer review scores? | *Coming soon* |

**Progress:** Sections 1–4 have SQL files. Section 5 is planned for the next stage of analysis.
