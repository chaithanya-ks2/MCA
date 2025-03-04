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