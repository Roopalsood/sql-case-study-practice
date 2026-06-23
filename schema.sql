/* =========================================================
   SQL INTERVIEW PRACTICE SCHEMA (ORACLE SQL)
   ========================================================= */


/* -----------------------------
   CUSTOMERS
------------------------------ */
CREATE TABLE customers (
    customer_id   NUMBER PRIMARY KEY,
    name          VARCHAR2(100),
    city          VARCHAR2(50),
    gender        VARCHAR2(10),
    signup_date   DATE,
    email         VARCHAR2(100),
    phone         VARCHAR2(20),
    is_active     NUMBER(1)
);


/* -----------------------------
   EMPLOYEES
------------------------------*/
CREATE TABLE employees (
    employee_id   NUMBER PRIMARY KEY,
    name          VARCHAR2(100),
    department    VARCHAR2(50),
    department_id NUMBER,
    salary        NUMBER,
    manager_id    NUMBER
);


/* -----------------------------
   PRODUCTS
------------------------------*/
CREATE TABLE products (
    product_id    NUMBER PRIMARY KEY,
    name          VARCHAR2(100),
    category      VARCHAR2(50),
    price         NUMBER
);


/* -----------------------------
   ORDERS
------------------------------*/
CREATE TABLE orders (
    order_id      NUMBER PRIMARY KEY,
    customer_id   NUMBER,
    order_date    DATE,
    amount        NUMBER,
    discount      NUMBER,
    order_value   NUMBER,
    
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);


/* -----------------------------
   SALES
------------------------------*/
CREATE TABLE sales (
    order_id    NUMBER,
    product_id  NUMBER,
    quantity    NUMBER,
    
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);


/* -----------------------------
   CUSTOMER ORDER HISTORY
------------------------------*/
CREATE TABLE customer_orders_history (
    order_id    NUMBER,
    customer_id NUMBER,
    order_date  DATE,
    product_id  NUMBER,
    amount      NUMBER
);
