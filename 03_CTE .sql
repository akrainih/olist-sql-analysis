-- 03_CTE .sql 


-- 1. Cначала посчитать выручку по продавцам, потом отфильтровать только тех у кого > 10 000 (через CTE)
with seller_income as (
select seller_id, sum(price) as income 
from sellers 
inner join order_items using(seller_id)
group by seller_id)

select seller_id, income 
from seller_income 
where income > 10000;


-- 2. Подзапрос: найти штаты у которых средний чек выше среднего по всей платформе
select customer_state, round(avg(payment_value),1) as avg_state, round((select avg(payment_value) from order_payments),1) as avg_
from customers
inner join orders using(customer_id)
inner join order_payments using(order_id) 
group by customer_state 
having avg(payment_value)  > (select avg(payment_value) from order_payments);


-- 3. CTE: ТОП-3 категории по выручке в каждом штате 
with categories_states as (
select product_category_name, sum(price) as revenue, customer_state
from products
inner join order_items using(product_id)
inner join orders using(order_id)
inner join customers using(customer_id)
group by product_category_name, customer_state
), 
ranked_categories as (
select product_category_name, revenue, customer_state,
row_number() over( partition by customer_state
order by revenue desc) as ranks
from categories_states
)

select product_category_name, revenue, customer_state, ranks
from ranked_categories
where ranks <=3;


-- 4. Найти покупателей сделавших более 1 заказа (через CTE)
with one_purchase as(
select customer_id, count(order_id) as orders_count
from customers
inner join orders using(customer_id)
group by customer_id
)

select customer_id
from one_purchase 
where orders_count > 1;



