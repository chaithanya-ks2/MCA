create database test1;
use test1;
-- Create the STUDENT table
CREATE TABLE STUDENT (
    Name VARCHAR(50),
    Student_number INT PRIMARY KEY,
    Class INT,
    Major VARCHAR(10)
);

-- Insert data into the STUDENT table
INSERT INTO STUDENT (Name, Student_number, Class, Major) VALUES
('Smith', 17, 1, 'CS'),
('Brown', 8, 2, 'CS');

-- Create the COURSE table
CREATE TABLE COURSE (
    Course_name VARCHAR(100),
    Course_number VARCHAR(10) PRIMARY KEY,
    Credit_hours INT,
    Department VARCHAR(50)
);

-- Insert data into the COURSE table
INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department) VALUES
('Intro to Computer Science', 'CS1310', 4, 'CS'),
('Data Structures', 'CS3320', 4, 'CS'),
('Discrete Mathematics', 'MATH2410', 3, 'MATH'),	
('Database', 'CS3380', 3, 'CS');

-- Create the SECTION table
CREATE TABLE SECTION (
    Section_identifier INT PRIMARY KEY,
    Course_number VARCHAR(10),
    Semester VARCHAR(10),
    Year INT,
    Instructor VARCHAR(50),
    FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number)
);

-- Insert data into the SECTION table
INSERT INTO SECTION (Section_identifier, Course_number, Semester, Year, Instructor) VALUES
(85, 'MATH2410', 'Fall', 07, 'King'),
(92, 'CS1310', 'Fall', 07, 'Anderson'),
(102, 'CS3320', 'Spring', 08, 'Knuth'),
(112, 'MATH2410', 'Fall', 08, 'Chang'),
(119, 'CS1310', 'Fall', 08, 'Anderson'),
(135, 'CS3380', 'Fall', 08, 'Stone');

-- Create the GRADE_REPORT table
CREATE TABLE GRADE_REPORT (
    Student_number INT,
    Section_identifier INT,
    Grade CHAR(1),
    PRIMARY KEY (Student_number, Section_identifier),
    FOREIGN KEY (Student_number) REFERENCES STUDENT(Student_number),
    FOREIGN KEY (Section_identifier) REFERENCES SECTION(Section_identifier)
);

-- Insert data into the GRADE_REPORT table
INSERT INTO GRADE_REPORT (Student_number, Section_identifier, Grade) VALUES
(17, 112, 'B'),
(17, 119, 'C'),
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'A');

-- Create the PREREQUISITE table
CREATE TABLE PREREQUISITE (
    Course_number VARCHAR(10),
    Prerequisite_number VARCHAR(10),
    PRIMARY KEY (Course_number, Prerequisite_number),
    FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number),
    FOREIGN KEY (Prerequisite_number) REFERENCES COURSE(Course_number)
);

-- Insert data into the PREREQUISITE table
INSERT INTO PREREQUISITE (Course_number, Prerequisite_number) VALUES
('CS3380', 'CS3320'),
('CS3380', 'MATH2410'),
('CS3320', 'CS1310');

SELECT * FROM course;
SELECT * FROM student;

-- Retrive the list of all courses and grades of smith
SELECT c.course_name, gr.grade 
FROM student AS s JOIN grade_report AS gr
	ON s.student_number = gr.student_number
JOIN section as sec 
	ON gr.section_identifier = sec.section_identifier
JOIN course AS c
	ON c.course_number = sec.course_number
WHERE s.name = "Smith";

-- List the name of the students who took the section of "database" course offered in fall "2008" and their grades in that section
SELECT s.name,grade
FROM student AS s 
JOIN grade_report AS gr 
	ON s.student_number=gr.student_number
JOIN section AS sec 
	ON sec.section_identifier=gr.section_identifier
WHERE sec.course_number=  (	
	SELECT course_number FROM course WHERE course_name="Database")
AND sec.semester="Fall" 
AND sec.year="08";

-- List the prerequisites of the "database" course

SELECT prerequisite_number FROM prerequisite 
WHERE course_number=(
	SELECT course_number FROM course WHERE course_name="Database");
    
-- create a view to retrieve the names of all senior students majoring in "CS"

CREATE VIEW senior_students AS
SELECT name
FROM student
WHERE major="CS";

SELECT * FROM senior_students;

-- Retrieve the names of all courses taught by professor King in 2007 and 2008

SELECT Course_name
FROM SECTION AS s
JOIN Course AS c ON
c.Course_number=s.Course_number  WHERE Instructor ="King"  AND  s.Year IN ("07","08");


-- For each section taught by professor king ,retrive the course_number,semester ,year and number of students who took the section
SELECT sec.course_number, sec.semester, sec.year, count(*) AS student_count
FROM section as sec
JOIN grade_report as gr
	ON sec.section_identifier = gr.section_identifier
WHERE sec.instructor="King"
GROUP BY sec.section_identifier;

/*Retrieve the name and transcript of each seniors student (class=2)majoring in "cs". 
A transcript includes course name course number credit hours semester,year and grade for each course completed by the student*/

SELECT s.name,c.course_name,c.course_number,c.credit_hours,sec.semester,sec.year,g.grade
FROM Student AS s
JOIN Grade_report AS g
	ON s.student_number=g.student_number	
JOIN Section AS sec
	ON sec.section_identifier=g.section_identifier
JOIN Course AS c
	ON c.course_number=sec.course_number
    WHERE s.class="2" AND s.major="CS";
    
    
/*Insert new student johnson */
INSERT INTO student VALUES ("Johnson",25,1,"MATH");
SELECT * FROM student;

-- CHANGE THE CLASS OF STUDENT SMITH TO 2
UPDATE  STUDENT SET class=2 WHERE name="Smith";
SET SQL_SAFE_UPDATES = 0;
INSERT INTO COURSE VALUES('knowledge-engineering','CS4390',3,'CS');
SELECT * FROM course;
update course set course_name="Knowledge_Engineering" WHERE course_number='CS4390';


-- delete from
DELETE FROM student WHERE name = 'Smith' AND student_number=17;
select * from student;
    



