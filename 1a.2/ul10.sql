CREATE OR REPLACE PROCEDURE get_sales_between(start_date DATE, end_date DATE)
LANGUAGE plpgsql
AS $$
DECLARE
    v_total_sales NUMERIC(10, 2);
BEGIN
    SELECT SUM(sales)
    INTO v_total_sales
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;

    RAISE NOTICE 'From: %, To: %, Total Sales: %', start_date, end_date, v_total_sales;
END;
$$;

CALL get_sales_between('2024-01-01', '2024-03-31');