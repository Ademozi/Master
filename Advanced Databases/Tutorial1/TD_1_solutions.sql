-- Advanced Databases — Practical Work / Tutorial 1
-- University database SQL solutions (Questions 1–13)
-- Schema:
-- department(department_id PK, department_name)
-- class(class_id PK, class_name, department_id FK)
-- teacher(teacher_id PK, last_name, first_name, salary, department_id FK)
-- student(student_id PK, last_name, first_name, age, class_id FK)

-- 1. Display only the last_name, first_name, and salary of teachers.
SELECT last_name, first_name, salary
FROM teacher;

-- 2. Display the teacher columns and rename salary as Monthly Salary.
-- Note: double quotes preserve the space in the alias in standard SQL.
SELECT last_name, first_name, salary AS "Monthly Salary"
FROM teacher;

-- 3. Display teachers whose salary is greater than or equal to 70000.
SELECT *
FROM teacher
WHERE salary >= 70000;

-- 4. Display teachers in department 1 with a salary greater than 65000,
-- using logical operators.
SELECT *
FROM teacher
WHERE department_id = 1
  AND salary > 65000;

-- 5. Display students aged between 21 and 23 whose class_id is 10 or 20,
-- using logical operators.
SELECT *
FROM student
WHERE age BETWEEN 21 AND 23
  AND (class_id = 10 OR class_id = 20);

-- 6. Display teachers whose salary is between 50000 and 75000, using BETWEEN.
SELECT *
FROM teacher
WHERE salary BETWEEN 50000 AND 75000;

-- 7. Display students whose first name contains the sequence 'am', using LIKE.
SELECT *
FROM student
WHERE first_name LIKE '%am%';

-- 8. Display teachers whose salary is NULL.
SELECT *
FROM teacher
WHERE salary IS NULL;

-- 9. Display teachers whose salary is not NULL.
SELECT *
FROM teacher
WHERE salary IS NOT NULL;

-- 10. Display the different ages represented in the student table.
SELECT DISTINCT age
FROM student;

-- 11. Display all teachers ordered by salary from highest to lowest.
SELECT *
FROM teacher
ORDER BY salary DESC;

-- 12. Display teachers ordered first by department_id, then salary descending.
SELECT *
FROM teacher
ORDER BY department_id ASC, salary DESC;

-- 13. Display each student's current age and calculated age after five years.
SELECT age, age + 5 AS age_after_five_years
FROM student;
