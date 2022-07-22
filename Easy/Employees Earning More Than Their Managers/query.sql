SELECT
    emp.name AS Employee
FROM
    Employee AS emp
    INNER JOIN Employee AS manager ON emp.managerId = manager.id
WHERE
    emp.salary > manager.salary;