WITH unique_invoices AS (
    SELECT 
        customer_id,
        invoice_no,
        MIN(invoice_date) AS invoice_date
    FROM retail_sales
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id, invoice_no
),
lead_invoices AS (
    SELECT 
        customer_id,
        invoice_no,
        invoice_date,
        LEAD(invoice_date) OVER (PARTITION BY customer_id ORDER BY invoice_date) AS next_invoice_date
    FROM unique_invoices
),
calculated_days AS (
    SELECT 
        customer_id,
        invoice_no,
        invoice_date,
        next_invoice_date,
        EXTRACT(DAY FROM (next_invoice_date - invoice_date)) AS days_to_next_invoice
    FROM lead_invoices
    WHERE next_invoice_date IS NOT NULL
)
SELECT 
    customer_id,
    invoice_no,
    invoice_date,
    next_invoice_date,
    days_to_next_invoice
FROM calculated_days
ORDER BY days_to_next_invoice DESC;