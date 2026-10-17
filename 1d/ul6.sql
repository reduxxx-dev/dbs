WITH customer_max_orders AS (
    SELECT DISTINCT
        c.customer_id,
        c.customer_name,
        MAX(o.order_date) OVER (PARTITION BY o.customer_id) AS last_order_date,
        MAX(o.order_date) OVER () AS latest_order_date
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
),
filtered_inactive AS (
    SELECT 
        customer_id,
        customer_name,
        last_order_date
    FROM customer_max_orders
    WHERE last_order_date < (latest_order_date - INTERVAL '90 days')
)
SELECT 
    customer_id,
    customer_name,
    last_order_date
FROM filtered_inactive
ORDER BY last_order_date ASC;