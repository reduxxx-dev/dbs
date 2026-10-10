WITH daily_sales AS (
    SELECT sale_date, SUM(total_amount) AS total_sales
    FROM flourmills_sales
    GROUP BY sale_date
)
SELECT sale_date, total_sales
FROM daily_sales
WHERE total_sales > 3000000
ORDER BY total_sales DESC;