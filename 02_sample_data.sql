-- ============================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- File: 02_sample_data.sql
-- Purpose: Insert sample data for testing
-- ============================================

-- Customers
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, signup_date) VALUES
(1, 'Rahim', 'Uddin', 'rahim.uddin@mail.com', 'Dhaka', 'Bangladesh', '2023-01-15'),
(2, 'Karim', 'Islam', 'karim.islam@mail.com', 'Chattogram', 'Bangladesh', '2023-02-10'),
(3, 'Ayesha', 'Khan', 'ayesha.khan@mail.com', 'Gaya', 'India', '2023-03-05'),
(4, 'Sonia', 'Akter', 'sonia.akter@mail.com', 'Sylhet', 'Bangladesh', '2023-03-20'),
(5, 'Vikram', 'Singh', 'vikram.singh@mail.com', 'Patna', 'India', '2023-04-12'),
(6, 'Nusrat', 'Jahan', 'nusrat.jahan@mail.com', 'Dhaka', 'Bangladesh', '2023-05-01'),
(7, 'Amit', 'Kumar', 'amit.kumar@mail.com', 'Delhi', 'India', '2023-05-18'),
(8, 'Farhana', 'Begum', 'farhana.begum@mail.com', 'Khulna', 'Bangladesh', '2023-06-09'),
(9, 'Rohit', 'Sharma', 'rohit.sharma@mail.com', 'Mumbai', 'India', '2023-07-14'),
(10, 'Tania', 'Rahman', 'tania.rahman@mail.com', 'Rajshahi', 'Bangladesh', '2023-08-02');

-- Categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Beauty & Personal Care');

-- Products
INSERT INTO products (product_id, product_name, category_id, price, stock_quantity) VALUES
(1, 'Wireless Earbuds', 1, 1999.00, 150),
(2, 'Smartphone Cover', 1, 299.00, 300),
(3, 'Men''s T-Shirt', 2, 599.00, 200),
(4, 'Women''s Kurti', 2, 899.00, 180),
(5, 'Non-stick Frying Pan', 3, 1299.00, 100),
(6, 'LED Table Lamp', 3, 799.00, 120),
(7, 'Bengali Novel Set', 4, 450.00, 90),
(8, 'Self-help Book', 4, 350.00, 110),
(9, 'Face Wash', 5, 249.00, 250),
(10, 'Hair Oil', 5, 199.00, 220),
(11, 'Bluetooth Speaker', 1, 2499.00, 80),
(12, 'Formal Shirt', 2, 999.00, 140);

-- Orders
INSERT INTO orders (order_id, customer_id, order_date, order_status) VALUES
(101, 1, '2024-01-05', 'Completed'),
(102, 2, '2024-01-08', 'Completed'),
(103, 3, '2024-01-10', 'Cancelled'),
(104, 1, '2024-01-15', 'Completed'),
(105, 4, '2024-01-20', 'Completed'),
(106, 5, '2024-02-02', 'Returned'),
(107, 6, '2024-02-05', 'Completed'),
(108, 7, '2024-02-10', 'Completed'),
(109, 3, '2024-02-14', 'Completed'),
(110, 8, '2024-02-18', 'Completed'),
(111, 9, '2024-03-01', 'Completed'),
(112, 2, '2024-03-05', 'Completed'),
(113, 10, '2024-03-08', 'Cancelled'),
(114, 6, '2024-03-12', 'Completed'),
(115, 5, '2024-03-15', 'Completed');

-- Order Items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 101, 1, 1, 1999.00),
(2, 101, 9, 2, 249.00),
(3, 102, 3, 2, 599.00),
(4, 103, 5, 1, 1299.00),
(5, 104, 11, 1, 2499.00),
(6, 104, 2, 3, 299.00),
(7, 105, 4, 1, 899.00),
(8, 105, 10, 2, 199.00),
(9, 106, 6, 1, 799.00),
(10, 107, 7, 2, 450.00),
(11, 108, 12, 1, 999.00),
(12, 108, 8, 1, 350.00),
(13, 109, 1, 2, 1999.00),
(14, 110, 3, 1, 599.00),
(15, 111, 9, 3, 249.00),
(16, 112, 11, 1, 2499.00),
(17, 113, 4, 1, 899.00),
(18, 114, 2, 5, 299.00),
(19, 115, 6, 2, 799.00),
(20, 115, 10, 1, 199.00);

-- Payments
INSERT INTO payments (payment_id, order_id, payment_method, payment_amount, payment_date) VALUES
(1, 101, 'bKash', 2497.00, '2024-01-05'),
(2, 102, 'Credit Card', 1198.00, '2024-01-08'),
(3, 104, 'Cash on Delivery', 3396.00, '2024-01-15'),
(4, 105, 'bKash', 1297.00, '2024-01-20'),
(5, 106, 'Credit Card', 799.00, '2024-02-02'),
(6, 107, 'bKash', 900.00, '2024-02-05'),
(7, 108, 'Credit Card', 1349.00, '2024-02-10'),
(8, 109, 'Cash on Delivery', 3998.00, '2024-02-14'),
(9, 110, 'bKash', 599.00, '2024-02-18'),
(10, 111, 'Credit Card', 747.00, '2024-03-01'),
(11, 112, 'bKash', 2499.00, '2024-03-05'),
(12, 114, 'Cash on Delivery', 1495.00, '2024-03-12'),
(13, 115, 'Credit Card', 1797.00, '2024-03-15');