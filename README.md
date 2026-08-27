# 🛒 E-Commerce Sales Analysis — SQL Project

![SQL](https://img.shields.io/badge/SQL-SQLite-blue?logo=sqlite&logoColor=white)
![Status](https://img.shields.io/badge/status-completed-brightgreen)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

A relational database project simulating a small **online store's** sales data — customers, products, orders, order items, and payments — built to practice and demonstrate real-world SQL analysis: from basic filtering to advanced window functions and CTEs.

---

## 📌 Project Overview

This project models a simplified e-commerce platform and answers business questions such as:
- Which product categories generate the most revenue?
- Who are the top-spending customers?
- What's the monthly sales trend?
- What's the order cancellation/return rate?
- Which products have never sold?

It's designed as a **portfolio-ready** project showing schema design, realistic sample data, and a progression of SQL skills (beginner → advanced).

---

## 🗂️ Database Schema

**6 tables**, connected via foreign keys:

```
customers ──1:N── orders ──1:N── order_items ──N:1── products ──N:1── categories
                    │
                    └──1:1── payments
```

| Table | Description |
|---|---|
| `customers` | Customer profile info (name, email, city, country, signup date) |
| `categories` | Product category lookup |
| `products` | Product catalog with price and stock |
| `orders` | Order header (customer, date, status) |
| `order_items` | Line items per order (product, quantity, unit price) |
| `payments` | Payment record per order (method, amount, date) |

---

## 📁 Repository Structure

```
├── 01_schema.sql            # Table definitions (DDL)
├── 02_sample_data.sql       # Sample data (10 customers, 12 products, 15 orders)
├── 03_analysis_queries.sql  # 15 practice queries, beginner → advanced
└── README.md
```

---

## ⚙️ How to Run

This project uses standard SQL and works with **SQLite**, MySQL, or PostgreSQL (minor syntax tweaks may be needed for date functions on MySQL/Postgres).

### Option 1 — SQLite (recommended, no server setup needed)
```bash
sqlite3 ecommerce.db
.read 01_schema.sql
.read 02_sample_data.sql
.read 03_analysis_queries.sql
```

### Option 2 — Online SQL playground
Copy-paste the `.sql` files into [DB Fiddle](https://www.db-fiddle.com/) or [SQLite Online](https://sqliteonline.com/) — no installation required.

---

## 🔍 Sample Queries & What They Demonstrate

| # | Query | SQL Concept |
|---|---|---|
| 1–4 | Filtering customers, products, orders | `WHERE`, `COUNT` |
| 5 | Revenue by category | `JOIN`, `GROUP BY`, `SUM` |
| 6 | Top 5 best-selling products | `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT` |
| 7 | Total spend per customer | Multi-table `JOIN`, aggregation |
| 8 | Monthly sales trend | Date functions, `GROUP BY` |
| 10 | Customers above average order value | Subquery, CTE |
| 11 | Rank customers by spending | `RANK() OVER()` window function |
| 12 | Products never ordered | `LEFT JOIN` + `IS NULL` |
| 14 | Running total of revenue | `SUM() OVER (ORDER BY ...)` |
| 15 | Repeat customers | `GROUP BY` + `HAVING` |

Full list of 15 queries in [`03_analysis_queries.sql`](./03_analysis_queries.sql).

---

## 💡 Example Insight

```sql
-- Total revenue by category
SELECT c.category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;
```

**Sample output:**

| category_name | total_revenue |
|---|---|
| Electronics | 12,491.00 |
| Fashion | 4,491.00 |
| Home & Kitchen | 3,097.00 |
| Beauty & Personal Care | 1,144.00 |
| Books | 1,250.00 |

---

## 🛠️ Tech Stack

- **Database:** SQLite (portable, works with MySQL/PostgreSQL with minor tweaks)
- **SQL Concepts:** DDL, DML, JOINs, Aggregations, Subqueries, CTEs, Window Functions

---

## 🚀 Possible Extensions

- [ ] Build a Python/Pandas dashboard on top of query results
- [ ] Add a `reviews` table for product ratings analysis
- [ ] Add Views and stored procedures
- [ ] Benchmark query performance with indexing

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

*Built as a practice/portfolio project to demonstrate SQL schema design and analytical querying.*
