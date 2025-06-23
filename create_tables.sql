SELECT name, salary, department_id
FROM (
    SELECT *,
           AVG(salary) OVER (PARTITION BY department_id) AS dept_avg
    FROM employees
) AS sub
WHERE salary > dept_avg;
