-- 02_joins.sql 
-- JOIN 

-- 1. Для каждого заказа: имя штата покупателя, сумма заказа, оценка, срок доставки в днях 
select distinct order_id, customer_state, price, review_score, (order_delivered_customer_date - order_purchase_timestamp ) as срок_жоставки
from orders
left join customers using(customer_id)
left join order_items using(order_id)
left join order_reviews using(order_id)
WHERE order_delivered_customer_date IS NOT NULL;

-- 2. Топ-10 продавцов по выручке с их штатом 
select seller_id, seller_state ,sum(price) as выручка 
from sellers 
inner join order_items using(seller_id)
group by seller_id
order by выручка desc
limit 10;


-- 3. Категории товаров с их средней оценкой и средним сроком доставки 
select product_category_name, round(avg(review_score),1) as средняя_оценка, round(avg(extract(day from order_delivered_customer_date - order_purchase_timestamp)), 1) as срок_доставки
from products p
join order_items o on p.product_id = o.product_id
join order_reviews r on o.order_id = r.order_id
join orders od on r.order_id = od.order_id
where  order_delivered_customer_date is not null
group by  product_category_name;


-- 4. Все заказы включая те у которых нет отзыва колиечство
select count(*) as количество_всех_заказов
from orders
left join order_reviews using(order_id);