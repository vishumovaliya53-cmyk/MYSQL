CREATE DATABASE sql8;

USE sql8;

-- TABLE 1

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Mathematics'),
(5, 'Physics');

-- TABLE 2

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    city VARCHAR(100),
    dept_id INT,
    marks INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Students (student_id, name, age, city, dept_id, marks) VALUES
(101, 'Rahul Sharma', 20, 'Delhi', 1, 85),
(102, 'Priya Singh', 21, 'Mumbai', 2, 92),
(103, 'Amit Patel', 20, 'Ahmedabad', 1, 78),
(104, 'Sneha Gupta', 22, 'Bangalore', 3, 88),
(105, 'Vikram Verma', 21, 'Delhi', 2, 65);

-- TABLE 3

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(501, 'Data Structures', 1),
(502, 'Thermodynamics', 2),
(503, 'Circuit Analysis', 3),
(504, 'Calculus II', 4),
(505, 'Quantum Mechanics', 5);

-- TABLE 4

CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments (enroll_id, student_id, course_id) VALUES
(1, 101, 501),
(2, 102, 504),
(3, 103, 501), 
(4, 104, 505),
(5, 105, 504);

-- TABLE 5

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Teachers (teacher_id, name, dept_id) VALUES
(301, 'Dr. Arvinder Singh', 1),
(302, 'Prof. Meera Nair', 2),
(303, 'Dr. Rajesh Khanna', 3),
(304, 'Dr. Sarah Williams', 4),
(305, 'Prof. Nitin Gadkari', 1);

-- 1 Show all students
SELECT * FROM Students;

-- 2 Show only student name and city
SELECT name, city FROM Students;

-- 3 Show students whose age is greater than 18
SELECT * FROM Students WHERE age > 18;

-- 4 Show students who live in “Delhi”
SELECT * FROM Students WHERE city = 'Delhi';

-- 5 Show students with marks greater than or equal to 80
SELECT * FROM Students WHERE marks >= 80;

-- 6 Show all students sorted by marks (highest first)
SELECT * FROM Students ORDER BY marks DESC;

-- 7 Show top 5 students by marks
SELECT * FROM Students ORDER BY marks DESC LIMIT 5;

-- 8 Show students sorted by name (A → Z)
SELECT * FROM Students ORDER BY name ASC;

-- 9 Show students who are older than 18 and have marks above 75
SELECT * FROM Students WHERE age > 18 AND marks > 75;

-- 10 Show students who live in “Delhi” or “Mumbai”
SELECT * FROM Students WHERE city IN ('Delhi', 'Mumbai');

-- 11 Show students whose name starts with “A”
SELECT * FROM Students WHERE name LIKE 'A%';


-- 12 Show students whose marks are between 60 and 90
SELECT * FROM Students WHERE marks BETWEEN 60 AND 90;

-- 13 Count how many students are in the table
SELECT COUNT(*) FROM Students;

-- 14 Find the average marks of all students
SELECT AVG(marks) FROM Students;

-- 15 Find the highest marks
SELECT MAX(marks) FROM Students;

-- 16 Show total students from each city
SELECT city, COUNT(*) AS student_count FROM Students GROUP BY city;

-- 17 Show each student with their department name
SELECT s.name, d.dept_name 
FROM Students s 
JOIN Departments d ON s.dept_id = d.dept_id;

-- 18 Show each course with its department name
SELECT c.course_name, d.dept_name 
FROM Courses c 
JOIN Departments d ON c.dept_id = d.dept_id;

-- 19 Show students enrolled in courses
SELECT s.name, c.course_name 
FROM Enrollments e 
JOIN Students s ON e.student_id = s.student_id 
JOIN Courses c ON e.course_id = c.course_id;

-- 20 Show teachers with the departments they belong to
SELECT t.name, d.dept_name 
FROM Teachers t 
JOIN Departments d ON t.dept_id = d.dept_id;

-- 21 Show students and their courses, only for “Computer Science” department
SELECT s.name, c.course_name 
FROM Enrollments e 
JOIN Students s ON e.student_id = s.student_id 
JOIN Courses c ON e.course_id = c.course_id 
JOIN Departments d ON s.dept_id = d.dept_id 
WHERE d.dept_name = 'Computer Science';

-- 22 Show students who do not have a department (using LEFT JOIN)
SELECT s.name FROM Students s LEFT JOIN Departments d ON s.dept_id = d.dept_id WHERE s.dept_id IS NULL;

-- 23 Show departments that have no students
SELECT d.dept_name FROM Departments d LEFT JOIN Students s ON d.dept_id = s.dept_id WHERE s.student_id IS NULL;

-- 24 Show how many students are in each department
SELECT d.dept_name, COUNT(s.student_id) 
FROM Departments d 
LEFT JOIN Students s ON d.dept_id = s.dept_id 
GROUP BY d.dept_name;

-- 25 Show students whose marks are higher than the average marks
SELECT * FROM Students WHERE marks > (SELECT AVG(marks) FROM Students);

-- 26 Show students who have the highest marks
SELECT * FROM Students WHERE marks = (SELECT MAX(marks) FROM Students);

-- 27 Show students who belong to the same department as 'Rahul Sharma' (replacing 'Ravi' as per your data)
SELECT * FROM Students WHERE dept_id = (SELECT dept_id FROM Students WHERE name = 'Rahul Sharma');

-- 28 Show courses that have at least one student enrolled
SELECT course_name FROM Courses WHERE course_id IN (SELECT DISTINCT course_id FROM Enrollments);

-- 29 Show students who are enrolled in more than one course
SELECT name FROM Students WHERE student_id IN (
    SELECT student_id FROM Enrollments GROUP BY student_id HAVING COUNT(course_id) > 1
);

-- 30 Show departments where average marks of students are above 75
SELECT dept_name FROM Departments WHERE dept_id IN (
    SELECT dept_id FROM Students GROUP BY dept_id HAVING AVG(marks) > 75
);