SELECT
    Department,
    name AS Employee,
    salary AS Salary
FROM
    (
        SELECT
            Department,
            name,
            salary,
            dense_rank() over (
                PARTITION by Department
                ORDER BY
                    salary DESC
            ) rank_v
        FROM
            (
                SELECT
                    emp.*,
                    dep.name Department
                FROM
                    Employee emp
                    LEFT JOIN Department dep ON emp.departmentId = dep.id
            ) temp1
    ) temp2
WHERE
    rank_v < 4