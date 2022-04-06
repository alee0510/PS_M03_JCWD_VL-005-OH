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

-- PRACTICES
-- 1.1 GET customer data with credit limit more than 50000 and live in USA
SELECT * FROM customers WHERE creditLimit >= 50000 AND country = 'USA';

-- 1.2 GET top 10 customer with hight credit limit
SELECT * FROM customers ORDER BY creditLimit DESC LIMIT 10;

-- 1.3 GET total customer for each region/country
SELECT country, COUNT(*) AS total_customers FROM customers GROUP BY country;

-- 1.4 GET average credit limit of customers for each city and sort id by its country
-- 1.5 GET the hight credit limit of customers for each city, show its name and sort by its country
-- 1.6 GET total customer number in each city for each country
-- 1.7 GET total customer for each sales_rep
-- 1.8 GET total customer for each sales_rep for each country / city
-- 1.9 GET average credit limit of each sales_rep for each country /