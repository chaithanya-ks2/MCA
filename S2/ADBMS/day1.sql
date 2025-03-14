-- Create a database named 'testdb' and use it
CREATE DATABASE testdb;
USE testdb;

-- Create the 'countries' table
CREATE TABLE countries (
    country_id INT PRIMARY KEY, 
    country_name VARCHAR(50) NOT NULL, 
    region_id INT NOT NULL
);

-- Create the 'regions' table
CREATE TABLE regions (
    region_id INT PRIMARY KEY, 
    region_name VARCHAR(50) NOT NULL
);

-- Insert sample data into 'countries' table
INSERT INTO countries VALUES 
    (1, "India", 1),
    (2, "United States", 2),
    (3, "Brazil", 3),
    (4, "Australia", 4),
    (5, "Japan", 5);

-- Insert sample data into 'regions' table
INSERT INTO regions VALUES
    (1, 'Asia'),
    (2, 'North America'),
    (3, 'South America'),
    (4, 'Australia'),
    (5, 'Europe');

-- Remove all records from the 'countries' table
TRUNCATE TABLE countries;
SELECT * FROM countries; -- Verify that the table is empty

-- Attempt to update region_id for country_id=5 (this won't work as the table is truncated)
UPDATE countries SET region_id=1 WHERE country_id=5;

-- Select data from 'countries' table with sorting
SELECT * FROM countries ORDER BY region_id DESC;
SELECT * FROM countries ORDER BY region_id DESC LIMIT 3;
SELECT * FROM countries ORDER BY region_id LIMIT 3 OFFSET 3;

-- Add foreign key constraint to 'countries' table referencing 'regions' table
ALTER TABLE countries 
ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);

-- Describe the structure of 'countries' table
DESC countries;

-- Create the 'jobs' table
CREATE TABLE jobs (
    job_id INT PRIMARY KEY, 
    job_title VARCHAR(50) NOT NULL, 
    min_salary FLOAT NOT NULL, 
    max_salary FLOAT NOT NULL
);

-- Create the 'employees' table with foreign key references
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
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Drop the 'departments' table if it exists
DROP TABLE departments;

-- Create the 'departments' table
CREATE TABLE departments(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Create the 'dependence' table with foreign key references
CREATE TABLE DEPENDENCE(
    department_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    relationship VARCHAR(50),
    employee_id INT PRIMARY KEY,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Drop the 'dependence' table if needed
DROP TABLE dependence;

-- Create the 'locations' table with foreign key reference to 'countries'
CREATE TABLE locations(
    location_id INT PRIMARY KEY,
    street_address VARCHAR(50),
    postal_code INT(6),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- Add foreign key constraint for manager_id referencing employee_id in 'employees' table
ALTER TABLE employees 
ADD CONSTRAINT FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

-- Rename 'employees' table to 'employee'
ALTER TABLE employees RENAME TO employee;

-- Add a new column 'bonus' to 'employee' table
ALTER TABLE employee ADD COLUMN bonus FLOAT;

-- Describe the 'employee' table structure
DESC employee;

-- Rename 'department_id' column to 'dept_id' in 'employee' table
ALTER TABLE employee RENAME COLUMN department_id TO dept_id;

-- Modify 'phone' column to store string values instead of INT
ALTER TABLE employee MODIFY phone VARCHAR(10);

-- Remove 'bonus' column from 'employee' table
ALTER TABLE employee DROP bonus;

-- Attempt to drop primary key column 'employee_id' (will fail if referenced in other tables)
ALTER TABLE employee DROP employee_id;

-- Describe the 'jobs' table
DESC jobs;

-- Retrieve all records from the 'jobs' table
SELECT * FROM jobs;

-- Modify data types for 'min_salary' and 'max_salary' columns in 'jobs' table
ALTER TABLE jobs MODIFY min_salary FLOAT;
ALTER TABLE jobs MODIFY max_salary FLOAT;

-- Insert data into 'jobs' table (this will fail due to missing required columns 'min_salary' and 'max_salary')
INSERT INTO jobs (job_id, job_title) VALUES
    (1, "Manager"),
    (2, "Accountant"),
    (3, "Clerk"),
    (4, "Peon");

-- Retrieve a specific record from 'jobs' table where job_id is 1
SELECT * FROM jobs WHERE job_id=1;
