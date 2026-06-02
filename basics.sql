/* =========================================================
   BASIC SQL INTERVIEW QUESTIONS (ORACLE SQL)
   50 Most Commonly Asked Beginner-Level Questions
   Format: Business Problem → SQL Query
   ========================================================= */


/* -----------------------------
Q1. Customer list for marketing campaign
Problem: Get all customer details for a new campaign.
------------------------------*/
SELECT * FROM customers;


/* -----------------------------
Q2. Customer names and cities
Problem: Marketing team needs customer location data.
------------------------------*/
SELECT name, city
FROM customers;


/* -----------------------------
Q3. Active customers only
Problem: Identify users currently active in system.
------------------------------*/
SELECT *
FROM customers
WHERE is_active = 1;


/* -----------------------------
Q4. Customers from Mumbai
Problem: Target users in Mumbai for local offer.
------------------------------*/
SELECT *
FROM customers
WHERE city = 'Mumbai';


/* -----------------------------
Q5. Customers missing email
Problem: Clean CRM data by finding incomplete profiles.
------------------------------*/
SELECT *
FROM customers
WHERE email IS NULL;


/* -----------------------------
Q6. Employees in HR department
Problem: HR report for department workforce.
------------------------------*/
SELECT *
FROM employees
WHERE department = 'HR';


/* -----------------------------
Q7. Employees earning above 50K
Problem: Identify high salary employees.
------------------------------*/
SELECT *
FROM employees
WHERE salary > 50000;


/* -----------------------------
Q8. Employees in IT, HR, Sales
Problem: Department-wise filtering for internal report.
------------------------------*/
SELECT *
FROM employees
WHERE department IN ('IT', 'HR', 'Sales');


/* -----------------------------
Q9. Employees within salary range
Problem: Mid-level salary band analysis.
------------------------------*/
SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 80000;


/* -----------------------------
Q10. Sort employees by salary high to low
Problem: HR wants ranking view.
------------------------------*/
SELECT *
FROM employees
ORDER BY salary DESC;


/* -----------------------------
Q11. Top 5 highest paid employees
Problem: Identify top performers.
------------------------------*/
SELECT *
FROM (
    SELECT *
    FROM employees
    ORDER BY salary DESC
)
WHERE ROWNUM <= 5;


/* -----------------------------
Q12. Total number of customers
Problem: Business wants total user base size.
------------------------------*/
SELECT COUNT(*) AS total_customers
FROM customers;


/* -----------------------------
Q13. Unique cities in system
Problem: Understand geographic reach.
------------------------------*/
SELECT COUNT(DISTINCT city)
FROM customers;


/* -----------------------------
Q14. Total revenue generated
Problem: Finance team revenue report.
------------------------------*/
SELECT SUM(amount) AS total_revenue
FROM orders;


/* -----------------------------
Q15. Average order value
Problem: Understand customer spending behavior.
------------------------------*/
SELECT AVG(amount) AS avg_order_value
FROM orders;


/* -----------------------------
Q16. Highest order value
Problem: Identify biggest transaction.
------------------------------*/
SELECT MAX(amount)
FROM orders;


/* -----------------------------
Q17. Lowest salary in company
Problem: HR payroll analysis.
------------------------------*/
SELECT MIN(salary)
FROM employees;


/* -----------------------------
Q18. Count orders per customer
Problem: Customer activity measurement.
------------------------------*/
SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;


/* -----------------------------
Q19. Customers with more than 3 orders
Problem: Identify repeat customers.
------------------------------*/
SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3;


/* -----------------------------
Q20. Revenue by customer
Problem: Customer contribution analysis.
------------------------------*/
SELECT customer_id,
       SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;


/* -----------------------------
Q21. Revenue by gender
Problem: Gender-based business analysis.
------------------------------*/
SELECT c.gender,
       SUM(o.amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.gender;


/* -----------------------------
Q22. Customers with NULL phone numbers
Problem: Data quality check.
------------------------------*/
SELECT *
FROM customers
WHERE phone IS NULL;


/* -----------------------------
Q23. Employees sorted by department
Problem: HR wants organized employee list.
------------------------------*/
SELECT *
FROM employees
ORDER BY department;


/* -----------------------------
Q24. Employees with NULL department_id
Problem: Missing HR mapping check.
------------------------------*/
SELECT *
FROM employees
WHERE department_id IS NULL;


/* -----------------------------
Q25. Customers whose name starts with A
Problem: Filter specific customer segment.
------------------------------*/
SELECT *
FROM customers
WHERE name LIKE 'A%';


/* -----------------------------
Q26. Customers whose name contains 'an'
Problem: Search pattern matching.
------------------------------*/
SELECT *
FROM customers
WHERE name LIKE '%an%';


/* -----------------------------
Q27. Orders placed today or last days
Problem: Recent activity tracking.
------------------------------*/
SELECT *
FROM orders
WHERE order_date >= SYSDATE - 7;


/* -----------------------------
Q28. Products in Electronics category
Problem: Product segmentation.
------------------------------*/
SELECT *
FROM products
WHERE category = 'Electronics';


/* -----------------------------
Q29. Price greater than 1000
Problem: Premium product filtering.
------------------------------*/
SELECT *
FROM products
WHERE price > 1000;


/* -----------------------------
Q30. Count products in each category
Problem: Category distribution.
------------------------------*/
SELECT category,
       COUNT(*) AS total_products
FROM products
GROUP BY category;


/* -----------------------------
Q31. Total sales per product
Problem: Best performing products.
------------------------------*/
SELECT product_id,
       SUM(quantity) AS total_sold
FROM sales
GROUP BY product_id;


/* -----------------------------
Q32. Customers with no orders
Problem: Identify inactive buyers.
------------------------------*/
SELECT *
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o
    WHERE o.customer_id = c.customer_id
);


/* -----------------------------
Q33. Orders above 5000 value
Problem: High-value transaction tracking.
------------------------------*/
SELECT *
FROM orders
WHERE amount > 5000;


/* -----------------------------
Q34. Orders with discount applied
Problem: Discount usage analysis.
------------------------------*/
SELECT *
FROM orders
WHERE discount > 0;


/* -----------------------------
Q35. Average salary by department
Problem: Department payroll analysis.
------------------------------*/
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;


/* -----------------------------
Q36. Employees count per department
Problem: Workforce distribution.
------------------------------*/
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department;


/* -----------------------------
Q37. Departments with more than 5 employees
Problem: Department strength analysis.
------------------------------*/
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;


/* -----------------------------
Q38. Most expensive product
Problem: Premium product identification.
------------------------------*/
SELECT *
FROM products
WHERE price = (SELECT MAX(price) FROM products);


/* -----------------------------
Q39. Cheapest product
Problem: Budget product analysis.
------------------------------*/
SELECT *
FROM products
WHERE price = (SELECT MIN(price) FROM products);


/* -----------------------------
Q40. Total quantity sold
Problem: Sales volume tracking.
------------------------------*/
SELECT SUM(quantity)
FROM sales;


/* -----------------------------
Q41. Orders grouped by date
Problem: Daily sales report.
------------------------------*/
SELECT order_date,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_date;


/* -----------------------------
Q42. Customers from specific cities
Problem: Regional marketing campaign.
------------------------------*/
SELECT *
FROM customers
WHERE city IN ('Mumbai', 'Delhi', 'Bangalore');


/* -----------------------------
Q43. Employees earning between range
Problem: Salary band analysis.
------------------------------*/
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 90000;


/* -----------------------------
Q44. Distinct product categories
Problem: Understand product diversity.
------------------------------*/
SELECT DISTINCT category
FROM products;


/* -----------------------------
Q45. Total employees in company
Problem: HR headcount report.
------------------------------*/
SELECT COUNT(*)
FROM employees;


/* -----------------------------
Q46. Customers sorted by signup date
Problem: Customer acquisition timeline.
------------------------------*/
SELECT *
FROM customers
ORDER BY signup_date;


/* -----------------------------
Q47. Latest orders first
Problem: Recent activity tracking.
------------------------------*/
SELECT *
FROM orders
ORDER BY order_date DESC;


/* -----------------------------
Q48. Customers with email only
Problem: Clean CRM segmentation.
------------------------------*/
SELECT *
FROM customers
WHERE email IS NOT NULL;


/* -----------------------------
Q49. Employees without manager
Problem: Identify top-level staff.
------------------------------*/
SELECT *
FROM employees
WHERE manager_id IS NULL;


/* -----------------------------
Q50. Total revenue per order date
Problem: Daily revenue tracking.
------------------------------*/
SELECT order_date,
       SUM(amount) AS revenue
FROM orders
GROUP BY order_date;
