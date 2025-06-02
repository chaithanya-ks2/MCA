CREATE DATABASE testDB1;
USE testDB1;

CREATE TABLE Employee (
	emp_no VARCHAR(3) PRIMARY KEY,
    emp_name VARCHAR(50),
    dob DATE,
    address TEXT,
    mobile_no BIGINT,
    dept_no VARCHAR(3),
    salary BIGINT,
    FOREIGN KEY (dept_no) REFERENCES department(dept_no)
    ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE department (
	dept_no VARCHAR(3) PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50));

-- Display the structure of the Employee table and Department table. --
DESC Employee;  
DESC department;

-- Add a new column ‘Designation’ to the table Employee. --
ALTER TABLE Employee ADD COLUMN Designation VARCHAR(50);

 -- Drop the column ‘location’ from Department table. --
ALTER TABLE department DROP COLUMN location;

-- Add at least 5 rows into the table Employee and Department. --
INSERT INTO department VALUES
	('1', 'Admin'),
    ('2', 'Marketing'),
    ('3', 'IT'),
    ('4', 'Management'),
    ('5', 'Finance');

INSERT INTO Employee VALUES
	('1', 'Aaron', '2001-05-21', 'Trivandrum', 9023478451, '3', 30000, 'Programmer'),
    ('2', 'Deepak', '2002-06-24', 'Kollam', 9023452351, '4', 35000, 'Manager'),
    ('3', 'Aiswarya', '2003-12-01', 'Palakkad', 9023477823, '1', 28000, 'HR'),
    ('4', 'Misira', '2001-08-14', 'Palakkad', 9023764451, '2', 27000, 'Sales lead'),
    ('5', 'Nandana', '2004-05-24', 'Kannur', 9023423961, '5', 18000, 'Analyst');
    
-- Display all the records from the above tables-- 
SELECT * FROM department;
SELECT * FROM employee;

-- Display the emp_no and name of employees from department no ‘2’ -- 
SELECT emp_no, emp_name FROM employee WHERE dept_no='2';

-- Display emp_no, emp_name , designation, deptno and salary of employees in the descending order of salary. -- 
SELECT emp_no, emp_name, designation, dept_no, salary FROM employee ORDER BY salary DESC;

-- Change the mobile number of employees named Deepak -- 
UPDATE Employee SET mobile_no=9023452361 WHERE emp_name='Deepak';
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM Employee WHERE emp_name='Deepak';

-- Retrieve the name, mobile number of all employees whose name start with “A”. -- 
SELECT emp_name, mobile_no FROM employee WHERE emp_name LIKE 'A%';

-- Displays how many employees work for each department. -- 
SELECT dept_no, count(*) FROM employee GROUP BY dept_no;
SELECT d.dept_name, count(*) 
FROM employee AS e JOIN department AS d 
	ON e.dept_no = d.dept_no
GROUP BY e.dept_no;

/* Write a stored procedure using cursor to calculate salary of each employee. 
Consider an Emp_salary table have the following attributes 
emp_id, emp_name, no_of_working_days, designation and salary */

CREATE TABLE Emp_salary (
	emp_id VARCHAR(3) PRIMARY KEY,
    emp_name VARCHAR(50),
    no_of_working_days INT NOT NULL,
    designation VARCHAR(50),
    salary BIGINT DEFAULT 0);
    
INSERT INTO Emp_salary (emp_id, emp_name, no_of_working_days, designation) VALUES
('1', 'Aaron', 28, 'Programmer');

DELIMITER $$

CREATE PROCEDURE calculate_salary()
BEGIN
	DECLARE emp_id_var INT;
    DECLARE emp_name_var VARCHAR(50);
    DECLARE days INT;
    DECLARE desg VARCHAR(50);
    DECLARE done INT DEFAULT 0;
    DECLARE daily_wage INT;
    
    DECLARE emp_cursor CURSOR FOR
		SELECT emp_id, emp_name, no_of_working_days, designation FROM Emp_salary;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN emp_cursor;
    
    read_loop: LOOP
		FETCH emp_cursor INTO emp_id_var, emp_name_var, days, desg;
        
        IF done THEN
			LEAVE read_loop;
		END IF;
        
        -- Set daily wage based on designation
        SET daily_wage =
			CASE
				WHEN desg = 'Manager' THEN 1000
                WHEN desg = 'Programmmer' THEN 800
                WHEN desg = 'HR' THEN 700
                WHEN desg = 'Sales lead' THEN 600
                WHEN desg = 'Analyst' THEN 700
                ELSE 500
			END;
            
		-- Update Salary
        UPDATE Emp_salary
        SET salary = days * daily_wage
        WHERE emp_id = emp_id_var;
	
    END LOOP;
    
    CLOSE emp_cursor;
END$$

DELIMITER ;

CALL Calculate_Salary();

SELECT * FROM Emp_salary;

