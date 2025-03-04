use test1;

-- Inner Join 
SELECT prerequisite_number, semester 
FROM prerequisite INNER JOIN section
ON prerequisite.course_number = section.course_number;

CREATE DATABASE test2;

USE test2;

CREATE TABLE customer (
	custid VARCHAR(3) PRIMARY KEY,
	name VARCHAR(50));
    
CREATE TABLE sales (
	custid VARCHAR(3),
	product VARCHAR(50),
    Pid VARCHAR(10),
    FOREIGN KEY(custid) REFERENCES customer(custid),
    FOREIGN KEY(Pid) REFERENCES Product(Pid));
    
INSERT INTO customer VALUES
	('1', 'ABC'),
    ('2', 'DEF'),
    ('3', 'GHI');
    
INSERT INTO sales VALUES
	('1', 'Pen','102'),
    ('1', 'Pencil','101'),
    ('2', 'Pen','102');
    
SELECT c.name, s.product 
FROM customer AS c JOIN sales AS s
ON c.custid = s.custid;

drop table sales;

CREATE TABLE Product(Pid VARCHAR(10) primary key, Product varchar(10));


insert into Product values 
(101,"Pencil"),
(102,"Pen"),
(103,"Eraser");

SELECT sales.product, count(customer.name) AS sales_count
FROM customer JOIN Sales
ON customer.custid = sales.custid
JOIN product
ON sales.pid = product.pid
GROUP BY sales.product
HAVING sales_count >= 2;



