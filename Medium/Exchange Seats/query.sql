SELECT
    CASE
        WHEN id <> (
            SELECT
                MAX(id)
            FROM
                seat
        ) THEN CASE
            WHEN mod(id, 2) <> 0 THEN id + 1
            ELSE id - 1
        END
        WHEN id = (
            SELECT
                MAX(id)
            FROM
                seat
        ) THEN CASE
            WHEN id % 2 <> 0 THEN id
            ELSE id - 1
        END
    END AS id,
    student
FROM
    seat
ORDER BY
    id