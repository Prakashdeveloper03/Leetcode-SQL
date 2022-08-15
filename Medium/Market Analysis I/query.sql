SELECT
    user_id AS buyer_id,
    join_date,
    IFNULL(COUNT(order_date), 0) AS orders_in_2019
FROM
    Users AS u
    LEFT JOIN Orders AS o ON user_id = buyer_id
    AND YEAR(order_date) = '2019'
GROUP BY
    user_id