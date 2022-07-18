SELECT
    DISTINCT x.num AS ConsecutiveNums
FROM
    (
        SELECT
            num,
            CASE
                WHEN num = lead(num) over()
                AND num = lead(num, 2) over() THEN 'true'
                ELSE 'false'
            END AS flag
        FROM
            LOGS
    ) x
WHERE
    x.flag = 'true';