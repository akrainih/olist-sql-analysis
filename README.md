
# SQL Analysis: Brazilian E-Commerce (Olist)

**Автор:** Крайних Анастасия  
**Инструменты:** PostgreSQL, pgAdmin  
**Датасет:** [Brazilian E-Commerce — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — 100k заказов, 9 таблиц

---

## Цель

Анализ операционных показателей бразильского маркетплейса Olist
через SQL: продажи по регионам, топ категории товаров, поведение
покупателей и влияние доставки на удовлетворённость клиентов.



---

## Ключевые запросы

| Файл | Техника | Задача |
|------|---------|--------|
| [01_basic.sql](https://github.com/akrainih/olist-sql-analysis/blob/636d8498b7d43bf28ea829373108cbe942d5d369/01_basic.sql) | GROUP BY, ORDER BY | Топ штатов по заказам и выручке |
| [01_basic.sql](https://github.com/akrainih/olist-sql-analysis/blob/636d8498b7d43bf28ea829373108cbe942d5d369/01_basic.sql) | GROUP BY, COUNT| Распределение заказов по статусам |
| [02_joins.sql](https://github.com/akrainih/olist-sql-analysis/blob/83c338d296a903ee8b54df74efdb7da6e73f9415/02_joins.sql) | 4 JOIN | Сводная таблица: заказ + покупатель + оценка + доставка |
| [02_joins.sql](https://github.com/akrainih/olist-sql-analysis/blob/83c338d296a903ee8b54df74efdb7da6e73f9415/02_joins.sql) | LEFT JOIN | Заказы без отзывов |
| [03_cte.sql](https://github.com/akrainih/olist-sql-analysis/blob/a06f0d7b81f34e845dcbc6ca097fbab34f11d191/03_CTE%20.sql) | WITH | Продавцы с выручкой > 10 000 R$ |
| [03_cte.sql](https://github.com/akrainih/olist-sql-analysis/blob/a06f0d7b81f34e845dcbc6ca097fbab34f11d191/03_CTE%20.sql) | Subquery | Штаты со средним чеком выше среднего по платформе |
| [04_window_functions.sql](https://github.com/akrainih/olist-sql-analysis/blob/0ee2cbd9d0a00c9323dff0155124e391877b84ba/04_window_functions.sql) | RANK() OVER | Топ-1 продавец в каждом штате |
| [04_window_functions.sql](https://github.com/akrainih/olist-sql-analysis/blob/0ee2cbd9d0a00c9323dff0155124e391877b84ba/04_window_functions.sql) | LAG() OVER | Прирост выручки по месяцам (%) |
| [04_window_functions.sql](https://github.com/akrainih/olist-sql-analysis/blob/0ee2cbd9d0a00c9323dff0155124e391877b84ba/04_window_functions.sql)| SUM() OVER | Накопительная выручка — когда достигли 1 млн R$ |
| [04_window_functions.sql](https://github.com/akrainih/olist-sql-analysis/blob/0ee2cbd9d0a00c9323dff0155124e391877b84ba/04_window_functions.sql)| NTILE(4) | Сегментация покупателей по сумме покупок |

