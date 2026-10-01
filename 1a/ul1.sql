create database superstore;

create table customers (
    customer_id varchar(20) primary key,
    customer_name varchar(100),
    segment varchar(50),
    country varchar(50),
    region varchar(50)
);

create table products (
    product_id varchar(20) primary key,
    category varchar(50),
    sub_category varchar(50),
    product_name varchar(100)
);

create table orders (
    order_id varchar(20) primary key,
    customer_id varchar(20) references customers(customer_id),
    product_id varchar(20) references products(product_id),
    order_date date,
    ship_date date,
    sales numeric(10, 2),
    quantity int,
    discount numeric(10, 2),
    profit numeric(10, 2)
);