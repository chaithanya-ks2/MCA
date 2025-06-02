USE test1;

-- Write a PL/SQL program to check whether a number is odd or not
DELIMITER $$

CREATE PROCEDURE Check_Odd_Even(IN n INT)
BEGIN
	IF MOD(n, 2) = 0 THEN
		SELECT 'Number is Even' AS result;
	ELSE
		SELECT 'Number is Odd' AS result;
	END IF;
END$$

DELIMITER ;

CALL Check_Odd_Even(5);
CALL Check_Odd_Even(6);

-- Write a PL/SQL program to find factorial of a number
DELIMITER $$

CREATE PROCEDURE find_factorial(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE result BIGINT DEFAULT 1;
    
    IF num < 0 THEN
		SELECT 'Factorial is not defined for negative numbers' AS message;
	ELSEIF num = 0 THEN
		SELECT 1 AS factorial;
	ELSE
		WHILE i <= num DO
			SET result = result * i;
            SET i = i+1;
		END WHILE;
        SELECT result AS factorial;
	END IF;
END$$

DELIMITER ;

CALL find_factorial(5);
CALL find_factorial(0);
CALL find_factorial(-5);
	
-- write a PL/SQL program to find average marks of five subjects 
DELIMITER $$

CREATE PROCEDURE find_average_marks(
	IN mark1 INT,
    IN mark2 INT,
    IN mark3 INT,
    IN mark4 INT,
    IN mark5 INT
)
BEGIN
	DECLARE avg_marks DECIMAL(5,2);
    
    SET avg_marks = (mark1 + mark2 + mark3 + mark4 + mark5) / 5;
    
    SELECT avg_marks AS average;
END$$

DELIMITER ;

CALL find_average_marks(44, 38, 45, 42, 50);

--  find sum, average and grade of 5 marks
DELIMITER $$

CREATE PROCEDURE find_average_grade(
	IN mark1 INT,
    IN mark2 INT,
    IN mark3 INT,
    IN mark4 INT,
    IN mark5 INT
)
BEGIN
	DECLARE total INT;
	DECLARE average DECIMAL(5,2);
    DECLARE grade CHAR(2);
    
    SET total = mark1 + mark2 + mark3 + mark4 + mark5;
    SET average = total / 5;
    
    IF average >= 90 THEN
		SET grade = 'A+';
	ELSEIF average >= 80 THEN
		SET grade = 'A';
	ELSEIF average >= 70 THEN
		SET grade = 'B';
	ELSEIF average >= 60 THEN
		SET grade = 'C';
	ELSEIF average >= 50 THEN
		SET grade = 'D';
	ELSE
		SET grade = 'F';
	END IF;
    
    SELECT total AS Total_marks, average AS Average_Marks, grade as Grade;
END$$

DELIMITER ;
    
    SELECT avg_marks AS average;
END$$

DELIMITER ;

CALL find_average_grade(44, 38, 45, 42, 50); 

/* Create the following table and compute the total salary given employee id and insert it into a new table using PL/SQL
	total salary = bs + da + hra
    da = 30% of bs
    hra = 20% of bs
EMPID, EMPNAME, DESG, SAL, DEPT */

CREATE TABLE employee (
	empid INT PRIMARY KEY,
    empname VARCHAR(50),
    desg VARCHAR(50),
    sal DECIMAL(10, 2),
    deot VARCHAR(50)
);

INSERT INTO employee VALUES 
(1, 'Alice', 'Manager', 50000, 'HR'),
(2, 'Bob', 'Analyst', 40000, 'IT'),
(3, 'Charlie', 'Clerk', 30000, 'Finance');

CREATE TABLE salary_details (
	empid INT PRIMARY KEY,
    empname VARCHAR(5),
    total_salary decimal(10, 2)
);

DELIMITER $$

CREATE PROCEDURE compute_total_salary(IN p_empid INT)
BEGIN
	DECLARE v_sal DECIMAL(10,2);
    DECLARE v_da DECIMAL(10,2);
    DECLARE v_hra DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_empname VARCHAR(50);
    
    SELECT sal, empname INTO v_sal, v_empname
    FROM employee
    WHERE empid = p_empid;
    
    SET v_da = v_sal * 0.30;
    SET v_hra = v_sal * 0.20;
    
    SET v_total = v_sal + v_da + v_hra;
    
    INSERT INTO salary_details (empid, empname, total_salary)
    VALUES (p_empid, v_empname, v_total);
END$$

DELIMITER ;

CALL compute_total_salary(1);
SELECT * FROM salary_details;

-- Create a table with field name and mark and insert three records and create a procedure to find the grade
 CREATE TABLE student_marks (
	name VARCHAR(50),
    mark INT
);

INSERT INTO student_marks VALUES 
('Alice', 92),
('Bob', 76),
('Charlie', 58);

DELIMITER $$

CREATE PROCEDURE find_grade(IN student_name VARCHAR(50))
BEGIN
	DECLARE student_mark INT;
    DECLARE student_grade VARCHAR(2);
    
    SELECT mark INTO student_mark 
    FROM student_marks
    WHERE name = student_name;
    
    IF student_mark >= 90 THEN
		SET student_grade = 'A+';
	ELSEIF student_mark >= 80 THEN
		SET student_grade = 'A';
	ELSEIF student_mark >= 70 THEN
		SET student_grade = 'B';
	ELSEIF student_mark >= 60 THEN
		SET student_grade = 'C';
	ELSEIF student_mark >= 50 THEN
		SET student_grade = 'D';
	ELSE
		SET student_grade = 'F';
	END IF;
    
	SELECT student_name AS Name, student_mark AS Mark, student_grade AS Grade;
END$$

DELIMITER ;
    
CALL find_grade('Alice');
CALL find_grade('Charlie');

-- Create a table student and create a trigger
CREATE TABLE student1 (
	id INT PRIMARY KEY,
    name VARCHAR(5)
);

INSERT INTO student1 VALUES
(1, 'Anu'),
(2, 'Vinu'),
(3, 'Manu');

SELECT * FROM student1;

DELIMITER $$

CREATE TRIGGER trig_del
BEFORE DELETE ON student1
FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Deletion not possible';
END$$

DELIMITER ;

DELETE FROM student1 WHERE Name='Anu';
SET SQL_SAFE_UPDATES = 0;
 
