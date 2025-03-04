-- Create a database named 'test1'
CREATE DATABASE test1;

-- Switch to the 'test1' database
USE test1;

-- Create the STUDENT table with the columns: Name, Student_number (Primary Key), Class, and Major
CREATE TABLE STUDENT (
    Name VARCHAR(50),              -- Name of the student
    Student_number INT PRIMARY KEY, -- Unique student number (Primary Key)
    Class INT,                     -- Class number (e.g., 1 for Freshman, 2 for Sophomore)
    Major VARCHAR(10)              -- Major field of study (e.g., CS, MATH)
);

-- Insert sample data into the STUDENT table
INSERT INTO STUDENT (Name, Student_number, Class, Major) VALUES
('Smith', 17, 1, 'CS'),  -- Smith, a first-year student, majoring in Computer Science
('Brown', 8, 2, 'CS');   -- Brown, a second-year student, majoring in Computer Science

-- Create the COURSE table with columns for Course_name, Course_number (Primary Key), Credit_hours, and Department
CREATE TABLE COURSE (
    Course_name VARCHAR(100),    -- Name of the course
    Course_number VARCHAR(10) PRIMARY KEY, -- Unique course identifier (Primary Key)
    Credit_hours INT,            -- Number of credit hours assigned to the course
    Department VARCHAR(50)       -- Department offering the course (e.g., CS, MATH)
);

-- Insert sample data into the COURSE table
INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department) VALUES
('Intro to Computer Science', 'CS1310', 4, 'CS'),   -- Intro to CS (4 credits, CS Department)
('Data Structures', 'CS3320', 4, 'CS'),             -- Data Structures (4 credits, CS Department)
('Discrete Mathematics', 'MATH2410', 3, 'MATH'),    -- Discrete Math (3 credits, MATH Department)
('Database', 'CS3380', 3, 'CS');                     -- Database (3 credits, CS Department)

-- Create the SECTION table which links courses to specific sections offered in a semester
CREATE TABLE SECTION (
    Section_identifier INT PRIMARY KEY,  -- Unique identifier for each section
    Course_number VARCHAR(10),           -- The course number for the section (Foreign Key)
    Semester VARCHAR(10),                -- Semester when the course is offered (e.g., Fall, Spring)
    Year INT,                            -- Year the course is offered
    Instructor VARCHAR(50),              -- Instructor for the course section
    FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number)  -- Foreign Key referencing COURSE table
);

-- Insert sample data into the SECTION table
INSERT INTO SECTION (Section_identifier, Course_number, Semester, Year, Instructor) VALUES
(85, 'MATH2410', 'Fall', 07, 'King'),      -- Section 85 of Discrete Mathematics (Fall 2007, Instructor: King)
(92, 'CS1310', 'Fall', 07, 'Anderson'),   -- Section 92 of Intro to CS (Fall 2007, Instructor: Anderson)
(102, 'CS3320', 'Spring', 08, 'Knuth'),   -- Section 102 of Data Structures (Spring 2008, Instructor: Knuth)
(112, 'MATH2410', 'Fall', 08, 'Chang'),   -- Section 112 of Discrete Math (Fall 2008, Instructor: Chang)
(119, 'CS1310', 'Fall', 08, 'Anderson'),  -- Section 119 of Intro to CS (Fall 2008, Instructor: Anderson)
(135, 'CS3380', 'Fall', 08, 'Stone');    -- Section 135 of Database (Fall 2008, Instructor: Stone)

-- Create the GRADE_REPORT table to record the grades of students in different course sections
CREATE TABLE GRADE_REPORT (
    Student_number INT,               -- Student's unique identifier (Foreign Key)
    Section_identifier INT,           -- Section identifier of the course (Foreign Key)
    Grade CHAR(1),                    -- Grade received in the section (e.g., A, B, C)
    PRIMARY KEY (Student_number, Section_identifier), -- Composite Primary Key (Student + Section)
    FOREIGN KEY (Student_number) REFERENCES STUDENT(Student_number),  -- Foreign Key referencing STUDENT table
    FOREIGN KEY (Section_identifier) REFERENCES SECTION(Section_identifier)  -- Foreign Key referencing SECTION table
);

-- Insert sample data into the GRADE_REPORT table
INSERT INTO GRADE_REPORT (Student_number, Section_identifier, Grade) VALUES
(17, 112, 'B'),    -- Student 17 got a B in Section 112 of Discrete Mathematics
(17, 119, 'C'),    -- Student 17 got a C in Section 119 of Intro to CS
(8, 85, 'A'),      -- Student 8 got an A in Section 85 of Discrete Mathematics
(8, 92, 'A'),      -- Student 8 got an A in Section 92 of Intro to CS
(8, 102, 'B'),     -- Student 8 got a B in Section 102 of Data Structures
(8, 135, 'A');     -- Student 8 got an A in Section 135 of Database

-- Create the PREREQUISITE table to define prerequisite relationships between courses
CREATE TABLE PREREQUISITE (
    Course_number VARCHAR(10),       -- Course that has the prerequisite
    Prerequisite_number VARCHAR(10), -- Course that is a prerequisite
    PRIMARY KEY (Course_number, Prerequisite_number), -- Composite Primary Key (Course + Prerequisite)
    FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number),  -- Foreign Key referencing COURSE table
    FOREIGN KEY (Prerequisite_number) REFERENCES COURSE(Course_number)  -- Foreign Key referencing COURSE table
);

-- Insert sample data into the PREREQUISITE table to define course prerequisites
INSERT INTO PREREQUISITE (Course_number, Prerequisite_number) VALUES
('CS3380', 'CS3320'),  -- CS3380 (Database) has CS3320 (Data Structures) as a prerequisite
('CS3380', 'MATH2410'), -- CS3380 (Database) has MATH2410 (Discrete Math) as a prerequisite
('CS3320', 'CS1310');   -- CS3320 (Data Structures) has CS1310 (Intro to CS) as a prerequisite
