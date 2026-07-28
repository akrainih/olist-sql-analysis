-- 01_basic.sql — базовые запросы
-- GROUP BY, ORDER BY, WHERE, HAVING

-- 1. Топ 5 штатов по количеству заказов
select customer_state, count(*) as total_orders 
from customers 
group by customer_state 
order by total_orders desc
limit 5; 


-- 2. Топ 10 категорий по выручке
select product_category_name, sum(price) as revenue
from  products 
inner join order_items using(product_id)
group by product_category_name
order by sum(price) desc
limit 10;


-- 3. Сколько заказов было доставлено с опозданием?
select count(*) as late
from orders 
where order_estimated_delivery_date < order_delivered_customer_date ;


-- 4. Распределение заказов по статусам 
select order_status, count(order_status) as количество
from orders
group by order_status;
