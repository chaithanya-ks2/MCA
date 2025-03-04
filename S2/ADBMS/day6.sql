-- Use the 'test1' database
USE test1;

-- Inner Join to retrieve course prerequisites along with semester details
SELECT prerequisite_number, semester 
FROM prerequisite 
INNER JOIN section
ON prerequisite.course_number = section.course_number;

-- Create a new database 'test2'
CREATE DATABASE test2;

-- Switch to the newly created 'test2' database
USE test2;

-- Create a table 'customer' to store customer details
CREATE TABLE customer (
    custid VARCHAR(3) PRIMARY KEY,  -- Customer ID as primary key
    name VARCHAR(50)                 -- Customer name
);

-- Create a table 'sales' to store sales transactions 
CREATE TABLE sales (
    custid VARCHAR(3),               -- Customer ID
    product VARCHAR(50),             -- Product name
    Pid VARCHAR(10),                 -- Product ID
    FOREIGN KEY(custid) REFERENCES customer(custid),  -- Foreign key linking to 'customer' table
    FOREIGN KEY(Pid) REFERENCES Product(Pid)          -- Foreign key linking to 'Product' table
);

-- Insert data into 'customer' table
INSERT INTO customer VALUES
    ('1', 'ABC'),   -- Customer 1: ABC
    ('2', 'DEF'),   -- Customer 2: DEF
    ('3', 'GHI');   -- Customer 3: GHI

-- Insert data into 'sales' table
INSERT INTO sales VALUES
    ('1', 'Pen','102'),   -- Customer 1 purchased Pen (Product ID: 102)
    ('1', 'Pencil','101'),-- Customer 1 purchased Pencil (Product ID: 101)
    ('2', 'Pen','102');   -- Customer 2 purchased Pen (Product ID: 102)

-- Join 'customer' and 'sales' tables to get customer names and the products they purchased
SELECT c.name, s.product 
FROM customer AS c 
JOIN sales AS s
ON c.custid = s.custid;

-- Drop the 'sales' table as it's no longer needed
DROP TABLE sales;

-- Create 'Product' table to store product details
CREATE TABLE Product(
    Pid VARCHAR(10) PRIMARY KEY,  -- Product ID as primary key
    Product VARCHAR(10)           -- Product name
);

-- Insert product data into 'Product' table
INSERT INTO Product VALUES 
    ('101', 'Pencil'),   -- Product ID 101: Pencil
    ('102', 'Pen'),      -- Product ID 102: Pen
    ('103', 'Eraser');   -- Product ID 103: Eraser

-- Join 'customer', 'sales', and 'product' tables to find products sold to customers and their count
SELECT sales.product, 
       COUNT(customer.name) AS sales_count -- Count of customers buying each product
FROM customer 
JOIN sales ON customer.custid = sales.custid  -- Joining 'customer' with 'sales' on customer ID
JOIN product ON sales.pid = product.pid       -- Joining 'sales' with 'product' on product ID
GROUP BY sales.product                        -- Grouping by product name
HAVING sales_count >= 2;                      -- Display only products sold to 2 or more customers
