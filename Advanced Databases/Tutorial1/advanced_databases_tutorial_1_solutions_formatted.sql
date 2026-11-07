-- Advanced Databases — Practical Work / Tutorial 1
-- University database SQL solutions (Questions 1–31)
-- Schema:
-- department(department_id PK, department_name)
-- class(class_id PK, class_name, department_id FK)
-- teacher(teacher_id PK, last_name, first_name, salary, department_id FK)
-- student(student_id PK, last_name, first_name, age, class_id FK)
--
-- SQL dialect: MySQL 8.0+
-- Question 31: The exercise does not define salary thresholds.
-- The following example thresholds are used:
-- High >= 70000, Medium >= 50000, Low < 50000.

-- 1. Display only the last_name, first_name, and salary of teachers.
SELECT last_name, first_name, salary
FROM teacher;

-- 2. Display the teacher columns and rename salary as Monthly Salary.
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

-- 14. Calculate the total number of teachers, average salary, and minimum salary.
SELECT
    COUNT(*) AS total_number_of_teachers,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary
FROM teacher;

-- 15. Calculate the number of teachers in each department.
SELECT
    department_id,
    COUNT(*) AS number_of_teachers
FROM teacher
GROUP BY department_id;

-- 16. Display the number of teachers and salary statistics for each department.
SELECT
    department_id,
    COUNT(*) AS number_of_teachers,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM teacher
GROUP BY department_id;

-- 17. Display departments having at least two teachers.
SELECT
    department_id,
    COUNT(*) AS number_of_teachers
FROM teacher
GROUP BY department_id
HAVING COUNT(*) >= 2;

-- 18. Display each teacher together with their department name.
SELECT
    t.last_name,
    t.first_name,
    d.department_name,
    t.salary
FROM teacher AS t
INNER JOIN department AS d
    ON t.department_id = d.department_id;

-- 19. Display all departments, including departments that have no teachers.
SELECT
    d.department_id,
    d.department_name,
    COUNT(t.teacher_id) AS number_of_teachers
FROM department AS d
LEFT JOIN teacher AS t
    ON d.department_id = t.department_id
GROUP BY d.department_id, d.department_name;

-- 20. Display teachers whose salary is greater than the average salary
-- of all teachers. The average is calculated using a subquery.
SELECT *
FROM teacher
WHERE salary > (
    SELECT AVG(salary)
    FROM teacher
);

-- 21. Display teachers who belong to departments where at least one teacher
-- earns more than 70000, using IN and a subquery.
SELECT *
FROM teacher
WHERE department_id IN (
    SELECT department_id
    FROM teacher
    WHERE salary > 70000
);

-- 22. Display students whose class belongs to department 1,
-- using IN and a subquery.
SELECT *
FROM student
WHERE class_id IN (
    SELECT class_id
    FROM class
    WHERE department_id = 1
);

-- 23. Display departments for which at least one teacher exists,
-- using EXISTS.
SELECT *
FROM department AS d
WHERE EXISTS (
    SELECT 1
    FROM teacher AS t
    WHERE t.department_id = d.department_id
);

-- 24. Display departments that have no teachers, using NOT EXISTS.
SELECT *
FROM department AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM teacher AS t
    WHERE t.department_id = d.department_id
);

-- 25. Display teachers whose salary is greater than the salary of at least
-- one teacher in department 2, using ANY.
SELECT *
FROM teacher
WHERE salary > ANY (
    SELECT salary
    FROM teacher
    WHERE department_id = 2
);

-- 26. Rewrite question 25 using SOME.
-- ANY and SOME are synonyms: they have exactly the same meaning.
SELECT *
FROM teacher
WHERE salary > SOME (
    SELECT salary
    FROM teacher
    WHERE department_id = 2
);

-- 27. Display teachers whose salary is greater than the salary of every
-- teacher in department 3, using ALL.
SELECT *
FROM teacher
WHERE salary > ALL (
    SELECT salary
    FROM teacher
    WHERE department_id = 3
);

-- 28. Display teachers who:
--     1) earn more than the overall average salary;
--     2) belong to a department with at least two teachers;
--     3) earn more than the average salary of their own department.
SELECT
    t.last_name,
    t.first_name,
    t.salary,
    d.department_name
FROM teacher AS t
INNER JOIN department AS d
    ON t.department_id = d.department_id
WHERE t.salary > (
    SELECT AVG(salary)
    FROM teacher
)
AND t.department_id IN (
    SELECT department_id
    FROM teacher
    GROUP BY department_id
    HAVING COUNT(*) >= 2
)
AND t.salary > (
    SELECT AVG(t2.salary)
    FROM teacher AS t2
    WHERE t2.department_id = t.department_id
);

-- 29. Display department statistics, keeping only departments that have
-- at least two teachers and an average salary above the university average.
SELECT
    d.department_name,
    COUNT(t.teacher_id) AS number_of_teachers,
    AVG(t.salary) AS average_salary,
    MAX(t.salary) AS maximum_salary
FROM department AS d
INNER JOIN teacher AS t
    ON d.department_id = t.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(t.teacher_id) >= 2
   AND AVG(t.salary) > (
       SELECT AVG(salary)
       FROM teacher
   );

-- 30.1. Display departments without teachers, using NOT EXISTS.
SELECT *
FROM department AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM teacher AS t
    WHERE t.department_id = d.department_id
);

-- 30.2. Display classes without students, using LEFT JOIN.
SELECT
    c.class_id,
    c.class_name,
    c.department_id
FROM class AS c
LEFT JOIN student AS s
    ON c.class_id = s.class_id
WHERE s.student_id IS NULL;

-- 30.3. Display students without a class, using LEFT JOIN.
-- This includes students whose class_id is NULL or has no matching class.
SELECT
    s.*
FROM student AS s
LEFT JOIN class AS c
    ON s.class_id = c.class_id
WHERE c.class_id IS NULL;

-- 31. Display all teachers with their department average, salary category,
-- and comparison with the department average.
-- Salary categories use the example thresholds stated at the top.
WITH department_stats AS (
    SELECT
        department_id,
        AVG(salary) AS department_average_salary
    FROM teacher
    GROUP BY department_id
)
SELECT
    t.teacher_id,
    t.last_name,
    t.first_name,
    d.department_name,
    t.salary,
    ds.department_average_salary,
    CASE
        WHEN t.salary IS NULL THEN 'Not specified'
        WHEN t.salary >= 70000 THEN 'High'
        WHEN t.salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    CASE
        WHEN t.salary IS NULL OR ds.department_average_salary IS NULL
            THEN 'Not specified'
        WHEN t.salary > ds.department_average_salary
            THEN 'Above Department Average'
        WHEN t.salary = ds.department_average_salary
            THEN 'At Department Average'
        ELSE 'Below Department Average'
    END AS department_salary_comparison
FROM teacher AS t
LEFT JOIN department AS d
    ON t.department_id = d.department_id
LEFT JOIN department_stats AS ds
    ON t.department_id = ds.department_id
ORDER BY
    d.department_name ASC,
    t.salary DESC;
