SELECT
    Department,
    Employee,
    Salary
FROM
    (
        SELECT
            d.name AS Department,
            e.name AS Employee,
            e.salary AS Salary,
            RANK() OVER(
                PARTITION BY d.name
                ORDER BY
                    e.salary DESC
            ) AS rnk
        FROM
            employee e
            INNER JOIN Department d ON e.departmentid = d.id
    ) AS temp
WHERE
    rnk = 1;