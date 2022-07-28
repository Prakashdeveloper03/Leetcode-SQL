SELECT
    u.name,
    SUM(t.amount) AS balance
FROM
    Users u
    INNER JOIN Transactions t ON t.account = u.account
GROUP BY
    t.account
HAVING
    SUM(amount) > 10000;