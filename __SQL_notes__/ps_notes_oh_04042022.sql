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
SELECT country, city, AVG(creditLimit) AS avg_credit_limit 
FROM customers 
GROUP BY city
ORDER BY country;

-- 1.5 GET the hight credit limit of customers for each city, show its name and sort by its country
SELECT customerName, country, city, MAX(creditLimit) AS credit_limit 
FROM customers 
GROUP BY city
ORDER BY country;

-- 1.6 GET total customer, average credit limit, and total sales_rep for each country
SELECT country, COUNT(*) AS total_sales_rep, AVG(creditLimit) AS credit_limit 
FROM customers
GROUP BY country, salesRepEmployeeNumber;
-- PR: get total customers?

-- 1.7 GET total customer for each sales_rep in each country / city
-- 1.8 GET total customer and average credit limit for each sales_rep order by country
-- 1.9 GET customers data with name start by letter 'A', ex. Artelier, Australian, etc. -- *LIKE

-- JOIN TABLE : INNER, CROSS, LEFT, and RIGHT
-- HIREARCIAL DATABASE, CTE, & MySQL Events