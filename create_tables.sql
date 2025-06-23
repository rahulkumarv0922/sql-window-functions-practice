/*
1. Find the second highest salary in each department
employee_id	name	salary	department_id
1	Alice	70000	10
2	Bob	90000	10
3	Charlie	85000	10
4	David	80000	20
5	Eva	75000	20

*/

SELECT name, salary, department_id
FROM (
    SELECT *,
           AVG(salary) OVER (PARTITION BY department_id) AS dept_avg
    FROM employees
) AS sub
WHERE salary > dept_avg;
