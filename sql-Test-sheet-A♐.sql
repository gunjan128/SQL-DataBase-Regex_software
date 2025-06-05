

-- 1. Find employees who have the lowest salary in the company
SELECT * 
FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 2. Find the department with the highest average salary
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- 3. Find the name of the manager of 'Alice Johnson'
SELECT e.name AS manager_name
FROM employees e
JOIN employees a ON e.employee_id = a.manager_id
WHERE a.name = 'Alice Johnson';

-- 4. Get the total number of projects completed per employee, sorted by the highest count
SELECT employee_id, COUNT(project_id) AS total_projects
FROM projects
GROUP BY employee_id
ORDER BY total_projects DESC;

-- 5. Calculate the running total of salaries in the company based on joining date
SELECT employee_id, name, salary, joining_date, 
       SUM(salary) OVER(ORDER BY joining_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_salary
FROM employees;

-- 6. Find the number of employees who joined after 2018
SELECT COUNT(*) AS total_employees
FROM employees
WHERE joining_date > '2018-12-31';

-- 7. Find the total number of projects handled by each employee
SELECT employee_id, COUNT(project_id) AS total_projects
FROM projects
GROUP BY employee_id;

-- 8. Find employees whose salary is above the average salary of their department
SELECT employee_id, name, department_id, salary
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

-- 9. Find the employee id, name, and department who don’t have any manager
SELECT employee_id, name, department_id
FROM employees
WHERE manager_id IS NULL;