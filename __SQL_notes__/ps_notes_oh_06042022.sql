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
SELECT em.employeeNumber,
CONCAT(em.firstname,' ', em.lastName) employeeName, 
COUNT(cs.customerName) total_customers , 
GROUP_CONCAT(cs.customerName SEPARATOR ';') customers,
AVG(cs.creditLimit) avg_credit, 
cs.country
FROM customers AS cs
JOIN employees AS em
ON cs.salesRepEmployeeNumber = em.employeeNumber
GROUP BY em.employeeNumber
ORDER BY cs.country;

-- 1.2 & 1.2a GET data employee, office, job title, total customers, customer country & city
SELECT em.employeeNumber,
CONCAT(em.firstName, ' ', em.lastName) employeeName,
em.jobTitle,
oc.city,
COUNT(cs.customerName) total_customer,
cs.country, cs.city
FROM employees AS em
JOIN offices AS oc ON em.officeCode = oc.officeCode
LEFT JOIN customers AS cs ON cs.salesRepEmployeeNumber = em.employeeNumber
GROUP BY em.employeeNumber;

-- 1.3 GET data employee(Sales Rep) who has 0 customer
-- 1.4 according to case no 1.2 & 1.2b, plus add head or boss/report to info + job title