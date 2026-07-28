
-- olist database: create tables and load data

-- 1. customers
create table customers (
customer_id varchar(50) primary key,
customer_unique_id varchar(50),
customer_zip_code_prefix varchar(10),
customer_city varchar(100),
customer_state varchar(5)
);

-- 2. geolocation
create table geolocation (
geolocation_zip_code_prefix varchar(10),
geolocation_lat numeric(10, 6),
geolocation_lng numeric(10, 6),
geolocation_city varchar(100),
geolocation_state varchar(5)
);

-- 3. orders
create table orders (
order_id varchar(50) primary key,
customer_id varchar(50) references customers(customer_id),
order_status varchar(20),
order_purchase_timestamp timestamp,
order_approved_at timestamp,
order_delivered_carrier_date timestamp,
order_delivered_customer_date timestamp,
order_estimated_delivery_date timestamp
);

-- 4. order_items
create table order_items (
order_id varchar(50) references orders(order_id),
order_item_id integer,
product_id varchar(50),
seller_id varchar(50),
shipping_limit_date timestamp,
price numeric(10, 2),
freight_value numeric(10, 2),
primary key (order_id, order_item_id)
);

-- 5. order_payments
create table order_payments (
order_id varchar(50) references orders(order_id),
payment_sequential integer,
payment_type varchar(20),
payment_installments integer,
payment_value numeric(10, 2),
primary key (order_id, payment_sequential)
);

-- 6. order_reviews
create table order_reviews (
review_id varchar(50) primary key,
order_id varchar(50) references orders(order_id),
review_score integer,
review_comment_title text,
review_comment_message text,
review_creation_date timestamp,
review_answer_timestamp timestamp
);

-- 7. products
create table products (
product_id varchar(50) primary key,
product_category_name varchar(100),
product_name_lenght integer,
product_description_lenght integer,
product_photos_qty integer,
product_weight_g numeric(10, 2),
product_length_cm numeric(10, 2),
product_height_cm numeric(10, 2),
product_width_cm numeric(10, 2)
);

-- 8. sellers
create table sellers (
seller_id varchar(50) primary key,
seller_zip_code_prefix varchar(10),
seller_city varchar(100),
seller_state varchar(5)
);

-- 9. category_translation
create table category_translation (
product_category_name varchar(100) primary key,
product_category_name_english varchar(100)
);


COPY customers 
FROM 'C:/Users/anast/data/olist_customers_dataset.csv' 
WITH CSV HEADER;

COPY geolocation 
FROM 'C:/Users/anast/data/olist_geolocation_dataset.csv' 
WITH CSV HEADER;

COPY orders 
FROM 'C:/Users/anast/data/olist_orders_dataset.csv' 
WITH CSV HEADER;

COPY order_items 
FROM 'C:/Users/anast/data/olist_order_items_dataset.csv' 
WITH CSV HEADER;

COPY order_payments 
FROM 'C:/Users/anast/data/olist_order_payments_dataset.csv' 
WITH CSV HEADER;

COPY order_reviews 
FROM 'C:/Users/anast/data/olist_order_reviews_dataset.csv' 
WITH CSV HEADER;

COPY products 
FROM 'C:/Users/anast/data/olist_products_dataset.csv' 
WITH CSV HEADER;

COPY sellers 
FROM 'C:/Users/anast/data/olist_sellers_dataset.csv' 
WITH CSV HEADER;

COPY category_translation 
FROM 'C:/Users/anast/data/product_category_name_translation.csv' 
WITH CSV HEADER;