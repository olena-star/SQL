
-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt
SELECT department_id, COUNT(*) AS employeescnt
FROM employees
GROUP BY department_id;
-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt
SELECT departments.department_name, COUNT(employees.employee_id) AS employeescnt
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
GROUP BY departments.department_name;
-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt
SELECT manager_id, COUNT(*) AS employeescnt
FROM employees
GROUP BY manager_id;
-- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt
use hr2;
select * from departments;
SELECT employees.first_name, employees.last_name, COUNT(employees.employee_id) AS employees_cnt
FROM employees
INNER JOIN departments ON employees.manager_id = departments.manager_id
GROUP BY employees.first_name, employees.last_name;
-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary

SELECT department_id, MAX(salary) AS maxsalary
FROM employees
GROUP BY department_id;

-- Найти сотрудников, у которых наибольшая зарплата в их департаменте
SELECT e.employee_id, e.department_id, e.salary
FROM employees e
INNER JOIN (
  SELECT department_id, MAX(salary) AS maxsalary
  FROM employees
  GROUP BY department_id
) m ON e.department_id = m.department_id AND e.salary = m.maxsalary;





