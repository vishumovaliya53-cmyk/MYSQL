CREATE database SQL7;

USE SQL7;

CREATE TABLE STUDENTS(
     Student_ID INT PRIMARY KEY,
     NAME VARCHAR(100),
     AGE INT,
     MARKS INT,
     CITY VARCHAR(30)
);

INSERT INTO STUDENTS(Student_ID, NAME, AGE, MARKS, CITY)
VALUES
(1, 'KRISH', 18, 99, 'MUMBAI'),
(2, 'MANAV', 19, 91, 'RAJKOT'),
(3, 'SHIVANI', 17, 88, 'DELHI'),
(4, 'VISHVA', 19, 94, 'PUNE'),
(5, 'SRUSHTI', 21, 86, 'KUTCH'),
(6, 'KHUSHI', 22, 75, 'UDAIPUR'),
(7, 'MEET', 16, 82, 'VADODARA'),
(8, 'PREET', 15, 92, 'SURAT'),
(9, 'JEET', 18, 56, 'MEHSANA'),
(10, 'DIPAK', 22, 89, 'JAIPUR');


-- all columns from the Students table
SELECT * FROM STUDENTS;

-- ========= WHERE CLOUSE ==========
-- students whose marks are greater than 70
SELECT * FROM STUDENTS WHERE MARKS > 70;

-- students who belong to the city 'Delhi'
SELECT * FROM STUDENTS WHERE CITY = 'DELHI';


-- ============ AND / OR / NOT Operators ================
-- students who are from Delhi AND marks > 60
SELECT MARKS , CITY
FROM STUDENTS
WHERE MARKS > 60
AND CITY = 'DELHI';

-- students who are NOT from Mumbai
SELECT * FROM STUDENTS 
WHERE NOT CITY = 'MUMBAI';


-- =========== ORDER BY ============
-- students ordered by marks in descending order
SELECT MARKS FROM STUDENTS  ORDER BY MARKS DESC; 


-- ========== LIMIT ==========
-- top 5 students based on marks
SELECT * FROM STUDENTS LIMIT 5;


-- =========== HAVING ============
-- cities having more than 2 students
SELECT CITY, COUNT(*) AS total_students
FROM STUDENTS
GROUP BY CITY
HAVING COUNT(*) > 2;


-- ============= Aggregate Functions ===============
-- the maximum marks scored by students
SELECT max(MARKS) AS maximum_marks 
FROM STUDENTS;

-- find the average marks of all students
SELECT AVG(MARKS) AS average_marks
FROM STUDENTS;

-- find the total number of students
SELECT COUNT(*) AS total_students
FROM STUDENTS;
