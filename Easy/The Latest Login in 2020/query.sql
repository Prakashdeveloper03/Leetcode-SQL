SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM
    Logins
WHERE
    SUBSTRING(time_stamp, 1, 4) = "2020"
GROUP BY
    user_id;