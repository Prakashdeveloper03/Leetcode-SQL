SELECT
    event_day AS DAY,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM
    Employees
GROUP BY
    DAY,
    emp_id;