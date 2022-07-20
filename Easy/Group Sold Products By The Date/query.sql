SELECT
    sell_date,
    COUNT(DISTINCT product) AS "num_sold",
    GROUP_CONCAT(
        DISTINCT product
        ORDER BY
            product
    ) AS "products"
FROM
    activities
GROUP BY
    sell_date;