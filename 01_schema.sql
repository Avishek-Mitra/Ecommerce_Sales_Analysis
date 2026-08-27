-- ============================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- File: 01_schema.sql
-- Purpose: Create database schema
-- ============================================

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

-- Customers Table
CREATE TABLE customers (
    customer_id     INTEGER PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    city            VARCHAR(50),
    country         VARCHAR(50),
    signup_date     DATE NOT NULL
);

-- Product Categories
CREATE TABLE categories (
    category_id     INTEGER PRIMARY KEY,
    category_name   VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id      INTEGER PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    category_id     INTEGER,
    price           DECIMAL(10,2) NOT NULL,
    stock_quantity  INTEGER DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Orders Table
CREATE TABLE orders (
    order_id        INTEGER PRIMARY KEY,
    customer_id     INTEGER,
    order_date      DATE NOT NULL,
    order_status    VARCHAR(20) DEFAULT 'Completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id   INTEGER PRIMARY KEY,
    order_id        INTEGER,
    product_id      INTEGER,
    quantity        INTEGER NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id      INTEGER PRIMARY KEY,
    order_id        INTEGER,
    payment_method  VARCHAR(30),
    payment_amount  DECIMAL(10,2) NOT NULL,
    payment_date    DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);