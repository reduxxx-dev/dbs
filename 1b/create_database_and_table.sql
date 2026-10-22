create database datacraftinglab_db;

create table flourmills_sales (
    sales_id int primary key,
    sale_date date,
    region varchar(100),
    state varchar(100),
    product_category varchar(100),
    product_name varchar(150),
    customer_type varchar(100),
    customer_id int,
    quantity_sold int,
    unit_price numeric(10, 2),
    discount_rate int,
    payment_method varchar(100),
    sales_rep varchar(150),
    warehouse varchar(100),
    delivery_status varchar(100),
    order_channel varchar(100),
    batch_number int,
    production_date date,
    total_amount numeric(10, 2)
);