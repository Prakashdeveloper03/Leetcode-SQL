SELECT
    *
FROM
    (
        SELECT
            Emp.employee_id
        FROM
            Employees Emp
            LEFT JOIN Salaries Sal ON Emp.employee_id = Sal.employee_id
        WHERE
            Sal.salary IS NULL
        UNION
        SELECT
            Sal.employee_id
        FROM
            Employees Emp
            RIGHT JOIN SALARIES Sal ON Emp.employee_id = Sal.employee_id
        WHERE
            Emp.name IS NULL
    ) T
ORDER BY
    T.employee_id;