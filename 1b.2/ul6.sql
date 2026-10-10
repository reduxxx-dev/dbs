WITH RECURSIVE date_range AS (
    SELECT MIN(sale_date)::timestamp AS current_date_val, MAX(sale_date)::timestamp AS max_date
    FROM flourmills_sales
    UNION ALL
    SELECT current_date_val + INTERVAL '1 day', max_date
    FROM date_range
    WHERE current_date_val < max_date
)
SELECT current_date_val::date
FROM date_range;