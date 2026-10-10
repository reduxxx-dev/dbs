WITH ranked_purchases AS (
    SELECT customer_id, product_name, sale_date, total_amount,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY sale_date DESC) as rn
    FROM flourmills_sales
)
SELECT customer_id, product_name, sale_date, total_amount
FROM ranked_purchases
WHERE rn = 1
ORDER BY customer_id ASC;