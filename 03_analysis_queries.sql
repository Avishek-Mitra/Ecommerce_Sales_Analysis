-- ============================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- File: 03_analysis_queries.sql
-- Purpose: Practice queries - Beginner to Advanced
-- ============================================

-- ===== LEVEL 1: BEGINNER =====

-- 1. List all customers from Bangladesh
.headers on
.mode column
SELECT * FROM customers 
where country = 'Bangladesh';

-- 2. Find all customers from Bangladesh
SELECT product_name, price 
FROM products 
WHERE price > 1000;

-- 3. Count total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 4. List all orders that were cancelled
SELECT * FROM orders
WHERE order_status = 'Cancelled';


-- ===== LEVEL 2: INTERMEDIATE (JOINs & GROUP BY) =====

-- 5. Total revenue by category
SELECT c.category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

-- 6. Top 5 best-selling product (by quantity sold)
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

--7. Total amount spent by each customer
SELECT cu.first_name, cu.last_name, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers cu 
JOIN orders o ON cu.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY cu.customer_id, cu.first_name, cu.last_name
ORDER BY total_spent DESC;

-- 8. Monthly sales trend
SELECT strftime('%Y-%m', o.order_date) AS month, SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o       
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY month
ORDER BY month;

-- 9. Most used payment method
SELECT payment_method, COUNT(*) AS times_used, SUM(payment_amount) AS total_anount
FROM payments
GROUP BY payment_method
ORDER BY times_used DESC;

-- ===== LEVEL 3: ADVANCED (Subqueries, Window Functions, CTEs) ====

--10. Customers who spent above average order value
WITH order_totals AS(
    SELECT o.order_id, o.customer_id, SUM(oi.quantity * oi.unit_price) AS order_value
    FROM orders o       
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.customer_id
)
SELECT cu.first_name, cu.last_name, ot.order_id, ot.order_value
FROM order_totals ot    
join customers cu ON ot.customer_id = cu.customer_id
WHERE ot.order_value > (SELECT avg(order_value) from order_totals);

-- 11. Rank customers by total spending (Window Function)
SELECT
    cu.first_name,
    cu.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spending_rank
FROM customers cu 
JOIN orders o ON cu.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY cu.customer_id, cu.first_name, cu.last_name;

-- 12. Products that have never been ordered
SELECT p.product_name
FROM products p             
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- 13. Order cancellation/ retrun date
SELECT 
    order_status,
    count(*) AS status_count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT (*) FROM orders), 2) AS percentage
FROM orders
GROUP BY order_status;

-- 14. Running total of revenue over time (Window Function)
SELECT
    o.order_date,
    sum(oi.quantity * oi.unit_price) AS daily_revenue,
    sum(sum(oi.quantity * oi.unit_price)) over (ORDER BY o.order_date) as running_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY o.order_date
ORDER BY o.order_date;

-- 15. Customer retention: customers with more than 1 order
SELECT cu.first_name, cu.last_name, count(o.order_id) as num_orders
FROM customers cu  
JOIN orders o on cu.customer_id = o.customer_id
GROUP BY cu.customer_id, cu.first_name, cu.last_name
HAVING Count(o.order_id) > 1;
