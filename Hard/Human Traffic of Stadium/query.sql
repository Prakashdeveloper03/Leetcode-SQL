WITH cte1 AS (
    SELECT
        *,
        (
            id - ROW_NUMBER() over (
                ORDER BY
                    visit_date
            )
        ) AS rnk
    FROM
        stadium
    WHERE
        people >= 100
),
cte2 AS (
    SELECT
        id,
        visit_date,
        people,
        count(rnk) over(PARTITION by rnk) AS cnt
    FROM
        cte1
)
SELECT
    id,
    visit_date,
    people
FROM
    cte2
WHERE
    cnt > 2
ORDER BY
    visit_date