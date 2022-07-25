WITH t1 AS (
    SELECT
        t.id,
        t.client_id,
        u1.banned AS is_client_banned,
        t.driver_id,
        u2.banned AS is_driver_banned,
        t.city_id,
        t.status,
        t.request_at
    FROM
        Trips t
        INNER JOIN Users u1 ON t.client_id = u1.users_id
        INNER JOIN Users u2 ON t.driver_id = u2.users_id
)
SELECT
    request_at AS DAY,
    ROUND(
        (
            SUM(IF(STATUS = "cancelled_by_client", 1, 0)) + SUM(IF(STATUS = "cancelled_by_driver", 1, 0))
        ) / COUNT(id),
        2
    ) AS 'Cancellation Rate'
FROM
    t1
WHERE
    request_at BETWEEN "2013-10-01"
    AND "2013-10-03"
    AND is_client_banned = 'No'
    AND is_driver_banned = 'No'
GROUP BY
    request_at
ORDER BY
    request_at ASC