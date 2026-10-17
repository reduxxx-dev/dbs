WITH customer_profit AS (
    SELECT 
        c.region AS region,
        c.customer_name,
        SUM(o.profit) AS total_profit
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.region, c.customer_name
),
ranked_customers AS (
    SELECT 
        region,
        customer_name,
        total_profit,
        RANK() OVER (PARTITION BY region ORDER BY total_profit DESC) AS profit_rank,
        DENSE_RANK() OVER (PARTITION BY region ORDER BY total_profit DESC) AS profit_dense_rank
    FROM customer_profit
)
SELECT 
    region,
    customer_name,
    total_profit,
    profit_rank,
    profit_dense_rank
FROM ranked_customers
ORDER BY region ASC, profit_rank ASC, customer_name ASC;