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

The analysis focuses on e-commerce sales, customer behavior, product performance, seller performance, and order fulfillment.

### 1. Data Exploration

- [x] How many customers are in the dataset?
- [x] How many orders are in the dataset?
- [x] How many products and sellers are there?
- [x] What is the date range of the orders?
- [x] What are the different order statuses?
- [x] Which Brazilian states have the most customers?

### 2. Sales Analysis

- [ ] What is the total revenue generated?
- [ ] What is the average order value?
- [ ] How does revenue change month over month?
- [ ] Which categories generate the most revenue?
- [ ] Which products generate the most revenue?
- [ ] Which sellers generate the most revenue?
