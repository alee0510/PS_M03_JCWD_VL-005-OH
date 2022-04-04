use classicmodels;
show tables;

-- CHECK DATA
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM products;

-- BASIC QUERY & FILTER
SELECT * FROM customers WHERE country = 'USA';

-- 1.1 GET customer data with credit limit more than 50000 and live in USA
-- 1.2 GET top 10 customer with hight credit limit
-- 1.3 GET total customer for each region