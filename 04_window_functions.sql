-- 04_window_functions.sql


-- 1. RANK() - пронумеровать продавцов по выручке внутри каждого штата. Топ-1 продавец в каждом регионе
with ranked as (select seller_id, sum(price) as revenue, seller_state, 
rank() over(partition by seller_state
order by sum(price) desc) as ranks 
from sellers
inner join order_items using(seller_id)
group by seller_id, seller_state)


select seller_id, revenue, seller_state, ranks
from ranked
where ranks = 1;


-- 2. SUM() OVER - накопительная выручка по месяцам (running total). Когда платформа достигла 1 млн R$?
with monthly_revenue as(
select  date_trunc('month', order_purchase_timestamp) as months, sum(price) as revenue 
from orders 
inner join order_items using(order_id)
group by months),

running_total as(
select months, sum(revenue) over(
order by months) as total
from monthly_revenue
)

select months, total
from running_total
where total >= 1000000
order by months
limit 1;


-- 3. LAG() — сравнить выручку каждого месяца с предыдущим. Рассчитать % прироста
with monthly_revenue as(
select date_trunc('month', order_purchase_timestamp) as months, sum(price) as revenue
from orders 
inner join order_items using(order_id)
group by months)


select months, revenue, 
(lag(revenue) over(
order by months)) as diff, 
round(((revenue/ (lag(revenue) over(
order by months))) - 1)*100,1) as growth
from monthly_revenue;


-- 4. NTILE(4) - разбить покупателей на 4 квартиля по сумме покупок. Сравнить поведение топ-25% с остальными 
with quantiles as (select customer_id, sum(payment_value) as payment,
ntile(4) over(
order by sum(payment_value) desc) as quantile
from customers 
inner join orders using(customer_id)
inner join order_payments using(order_id)
group by customer_id
)


select quantile, round(avg(payment),1) as average_payment, round(min(payment),2) as min_payment, round(max(payment),2) as max_payment
from quantiles
group by quantile
order by quantile; 