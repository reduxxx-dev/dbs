CREATE OR REPLACE PROCEDURE apply_regional_discount(region_name VARCHAR, discount_rate NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE orders o
    SET sales = sales * (1 - discount_rate)
    FROM customers c
    WHERE o.customer_id = c.customer_id
      AND c.region = region_name;

    RAISE NOTICE 'Discount of % applied to region %', discount_rate, region_name;
END;
$$;

CALL apply_regional_discount('west', 0.10);