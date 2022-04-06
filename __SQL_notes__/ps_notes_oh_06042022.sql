USE classicmodels;
SHOW TABLES;

-- customers & employess
SELECT * FROM customers;
SELECT * FROM employees;

-- JOIN -> default -> INNER JOIN
SELECT cs.customerNumber, cs.customerName, cs.country, cs.creditLimit, em.firstName, em.lastName 
FROM customers AS cs
JOIN employees AS em
ON cs.salesRepEmployeeNumber = em.employeeNumber
ORDER by country ASC;

-- PRACTICES
-- 1.1 GET data employee, total customers, country, and average credit from employee and customers table
-- 1.1.b do the samething, but join firstName and lastName of employee --> CONCAT()
-- 1.1.c do the samething, join all customer name as list or one value --> GROUPCONCAT()
