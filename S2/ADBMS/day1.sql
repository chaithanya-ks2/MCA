CREATE DATABASE testdb;
USE testdb;

CREATE TABLE countries (country_id INT PRIMARY KEY, country_name VARCHAR(50) NOT NULL, region_id INT NOT NULL);
CREATE TABLE regions (region_id INT, region_name VARCHAR(50) NOT NULL, PRIMARY KEY(region_id));

INSERT INTO countries VALUES 
	(1, "India", 1),
    (2, "United States", 2),
    (3, "Brazil", 3),
    (4, "Australia", 4),
    (5, "Japan", 5);
    
INSERT INTO regions VALUES
	(1, 'Asia'),
    (2, 'North America'),
    (3, 'South America'),
    (4, 'Australia'),
    (5, 'Europe');

TRUNCATE TABLE countries;
SELECT * FROM countries;
    
UPDATE countries SET region_id=1 WHERE country_id=5;

SELECT * FROM countries ORDER BY region_id DESC;
SELECT * FROM countries ORDER BY region_id DESC LIMIT 3;
SELECT * FROM countries ORDER BY region_id LIMIT 3 OFFSET 3;

ALTER TABLE countries 
ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);

DESC countries;

CREATE TABLE jobs (job_id INT PRIMARY KEY, job_title VARCHAR(50) NOT NULL, min_salary FLOAT NOT NULL, max_salary FLOAT NOT NULL);
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone INT(10),
    hire_date DATE,
    job_id INT,
    salary FLOAT,
    manager_id INT,
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id));

DROP TABLE departments;
CREATE TABLE departments(
	department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id));
CREATE TABLE DEPENDENCE(
	department_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    relationship VARCHAR(50),
    employee_id INT PRIMARY KEY,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id));
DROP TABLE dependence;
CREATE TABLE locations(
	location_id INT PRIMARY KEY,
    street_address VARCHAR(50),
    postal_code INT(6),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id));

ALTER TABLE employees 
ADD CONSTRAINT FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

ALTER TABLE employees RENAME TO employee;
ALTER TABLE employee ADD COLUMN bonus FLOAT;
DESC employee;

ALTER TABLE employee RENAME COLUMN department_id TO dept_id;
ALTER TABLE employee MODIFY phone VARCHAR(10);
ALTER TABLE employee DROP bonus;

/* Primary key set as foreign key in another table cannot be deleted */
ALTER TABLE employee DROP employee_id;

DESC jobs;
SELECT * FROM jobs;
ALTER TABLE jobs MODIFY min_salary FLOAT;
ALTER TABLE jobs MODIFY max_salary FLOAT;
INSERT INTO jobs (job_id, job_title) VALUES
	(1, "Manager"),
    (2, "Accountant"),
    (3, "Clerk"),
    (4, "Peon");
    
SELECT * FROM jobs WHERE job_id=1;
    
