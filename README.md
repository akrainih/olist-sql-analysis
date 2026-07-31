# olist-sql-analysis
SQL analysis of Brazilian e-commerce · PostgreSQL · JOINs · CTEs · window functions

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

## Схема базы данных

![Database schema](results/schema.png)

---

## Ключевые запросы

| Файл | Техника | Задача |
|------|---------|--------|
| 01_basic.sql | GROUP BY, ORDER BY | Топ штатов по заказам и выручке |
| 01_basic.sql | AVG, HAVING | Средняя оценка по штатам |
| 02_joins.sql | 4 JOIN | Сводная таблица: заказ + покупатель + оценка + доставка |
| 02_joins.sql | LEFT JOIN | Заказы без отзывов |
| 03_cte.sql | WITH | Продавцы с выручкой > 10 000 R$ |
| 03_cte.sql | Subquery | Штаты со средним чеком выше среднего по платформе |
| 04_window_functions.sql | RANK() OVER | Топ-1 продавец в каждом штате |
| 04_window_functions.sql | LAG() OVER | Прирост выручки по месяцам (%) |
| 04_window_functions.sql | SUM() OVER | Накопительная выручка — когда достигли 1 млн R$ |
| 04_window_functions.sql | NTILE(4) | Сегментация покупателей по сумме покупок |

---

## Как запустить

1. Установить PostgreSQL и pgAdmin
2. Скачать датасет с [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
3. Создать БД и таблицы: запустить `00_create tables and load data.sql`
4. Запускать запросы из папки файлов с запросами.
