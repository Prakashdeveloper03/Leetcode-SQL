SELECT
    p.product_name,
    s.year,
    s.price
FROM
    Sales AS s
    LEFT JOIN Product AS p ON p.product_id = s.product_id;