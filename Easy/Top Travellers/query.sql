SELECT
    u.name,
    IFNULL(SUM(distance), 0) AS travelled_distance
FROM
    users u
    LEFT JOIN rides r ON u.id = r.user_id
GROUP BY
    user_id
ORDER BY
    travelled_distance DESC,
    u.name ASC