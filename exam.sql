-- The real world scenario chosen is a system for storng student examination results.

-- Creating database
CREATE DATABASE exam;

-- Telling system which database to use
USE exam; 

-- Table of student details
CREATE TABLE students(
regNo VARCHAR(20) PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
otherNames VARCHAR(100));

-- Table of courses available
CREATE TABLE courses(
courseID VARCHAR(5) PRIMARY KEY,
courseName VARCHAR(70) NOT NULL);

-- Table linking students to their respective courses
CREATE TABLE student_courses(
    regNo VARCHAR(20),
    courseID VARCHAR(5),
    PRIMARY KEY (regNo, courseID),
    FOREIGN KEY (regNo) REFERENCES students(regNo),
    FOREIGN KEY (courseID) REFERENCES courses(courseID)
);

-- Table of units available
CREATE TABLE units(
unitID INT AUTO_INCREMENT PRIMARY KEY,
unitName VARCHAR(70) NOT NULL);

-- Table linking courses to units
CREATE TABLE courses_units(
unitID INT,
courseID VARCHAR(5) NOT NULL,
PRIMARY KEY(courseID, unitID),
FOREIGN KEY (courseID) REFERENCES courses(courseID),
FOREIGN KEY (unitID) REFERENCES units(unitID));

-- Table of exams taken
CREATE TABLE exams(
examID INT AUTO_INCREMENT PRIMARY KEY,
examtype ENUM('NORMAL', 'SUPPLEMENTARY', 'SPECIAL') NOT NULL,
dateTaken DATE NOT NULL);

-- Table of students results
CREATE TABLE results(
regNo VARCHAR(20),
examID INT,
unitID INT,
marks INT CHECK(marks BETWEEN 0 AND 100),
PRIMARY KEY(regNo, examID, unitID),
FOREIGN KEY (regNo) REFERENCES students(regNo),
FOREIGN KEY (examID) REFERENCES exams(examID),
FOREIGN KEY (unitID) REFERENCES units(unitID)
);

-- SAMPLE DATA

-- Students
INSERT INTO students (regNo, firstName, lastName, otherNames) VALUES
('S001', 'Alice', 'Mwangi', 'Wanjiru'),
('S002', 'Brian', 'Omondi', NULL),
('S003', 'Cynthia', 'Mutua', 'Achieng'),
('S004', 'David', 'Kamau', NULL),
('S005', 'Evelyn', 'Kariuki', 'Njeri');

-- Courses
INSERT INTO courses (courseID, courseName) VALUES
('IT', 'Information Technology'),
('CS', 'Computer Science'),
('BC', 'Business Computing'),
('IS', 'Information Systems'),
('SE', 'Software Engineering');

-- Units
INSERT INTO units (unitName) VALUES
('Intro to Programming'),
('Database Systems'),
('Computer Networks'),
('Software Engineering Principles'),
('Data Structures');

-- Courses-Units (linking courses to units)
INSERT INTO courses_units (courseID, unitID) VALUES
('IT', 1), ('IT', 2), ('IT', 3),
('CS', 1), ('CS', 2), ('CS', 5),
('BC', 1), ('BC', 3), ('BC', 4),
('IS', 2), ('IS', 4),
('SE', 1), ('SE', 4), ('SE', 5);

-- Student-Courses (who is enrolled in what)
INSERT INTO student_courses (regNo, courseID) VALUES
('S001', 'IT'),
('S002', 'CS'),
('S003', 'BC'),
('S004', 'SE'),
('S005', 'IS');

-- Exams
INSERT INTO exams (examtype, dateTaken) VALUES
('NORMAL', '2025-01-15'),
('SUPPLEMENTARY', '2025-02-10'),
('NORMAL', '2025-03-05'),
('SPECIAL', '2025-03-20'),
('NORMAL', '2025-04-01');

-- Results (student → exam → unit)
INSERT INTO results (regNo, examID, unitID, marks) VALUES
('S001', 1, 1, 78),  -- Alice IT Intro to Programming
('S001', 1, 2, 65),  -- Alice IT Database Systems
('S002', 1, 1, 82),  -- Brian CS Intro to Programming
('S002', 1, 5, 74),	 -- Brian CS Data Structures
('S003', 3, 3, 59),  -- Cynthia BC Networks
('S004', 4, 4, 70),  -- David SE Principles  (Special)
('S004', 4, 5, 68),  -- David SE Data Structures (Special)
('S005', 5, 2, 88),  -- Evelyn IS Database
('S005', 5, 4, 90),	 -- Evelyn IS Principles
('S003', 2, 1, 40);  -- Cynthia retaking Intro to Programming (Supplementary)