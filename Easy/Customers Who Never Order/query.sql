SELECT
    name AS Customers
FROM
    customers
WHERE
    id NOT IN (
        SELECT
            customerId
        FROM
            orders
    )
ORDER BY
    name ASC;