-- Обчислити загальний денний дохід за датами за останній місяць

-- added more orders to show revenue over a full month and not just 3 days

INSERT INTO orders (order_date, status, employee_id, client_id, table_id) VALUES
('2026-10-15 13:20:00', 'completed', 1, 1, 1),   -- order 8
('2026-10-28 19:45:00', 'completed', 2, 2, 2),   -- order 9
('2026-10-10 11:30:00', 'completed', 1, 3, 3),   -- order 10
('2026-10-25 20:15:00', 'completed', 7, 1, 4);   -- order 11

INSERT INTO order_items (quantity, order_id, item_id) VALUES
(2, 8, 1),  -- Order #8 (Oct 15): 2 x Shrimp and Pumpkin Salad
(1, 8, 14), -- Order #8: 1 x Citrus Lemonade
(1, 9, 3),  -- Order #9 (Oct 28): 1 x Beer Platter
(2, 9, 14), -- Order #9: 2 x Citrus Lemonade
(2, 10, 8), -- Order #10 (Oct 10): 2 x Tom Yum Soup
(1, 11, 9), -- Order #11 (Oct 25): 1 x Chicken Fillet with Pumpkin Puree
(2, 11, 14);-- Order #11: 2 x Citrus Lemonade

select date(o.order_date) as order_day, sum(oi.quantity*mi.price) as daily_revenue from orders o 
inner join order_items oi using (order_id)
inner join menu_items mi on oi.item_id=mi.menu_item_id
where o.status = 'completed' and o.order_date >= current_date - interval '1 month'
group by date(o.order_date)
order by order_day;


-- Знайти топ-10 найбільш популярних позицій меню

select mi.menu_item_name, sum(oi.quantity) as item_quantity from order_items oi 
inner join menu_items mi on oi.item_id=mi.menu_item_id
group by mi.menu_item_name
order by item_quantity desc
limit 10;

-- Обчислити середню вартість замовлення за часом доби (сніданок,
-- обід, вечеря)
select
    case
        when extract(hour from order_summary.order_date) between 10 and 11 then 'breakfast'
        when extract(hour from order_summary.order_date) between 12 and 17 then 'lunch'
        when extract(hour from order_summary.order_date) between 18 and 22 then 'dinner'
        else 'not working hours'
    end as time_of_day, round(avg(order_total), 2) as avg_order
from (
    select
        o.order_id,
        o.order_date,
        sum(oi.quantity * mi.price) as order_total
    from orders o
    join order_items oi on o.order_id = oi.order_id
    join menu_items mi on oi.item_id = mi.menu_item_id
    where o.is_deleted = false and mi.is_deleted = false and o.status = 'completed'
    group by o.order_id, o.order_date 
) as order_summary
group by time_of_day;

-- Визначити клієнтів з найбільшими загальними витратами (CTE)

with customer_spending as (
    select c.client_id, c.first_name, c.last_name, sum(oi.quantity * mi.price) as total_spent
    from clients c
    join orders o on c.client_id = o.client_id
    join order_items oi on o.order_id = oi.order_id
    join menu_items mi on oi.item_id = mi.menu_item_id
    where c.is_deleted = false and o.is_deleted = false and mi.is_deleted = false and o.status = 'completed'
    group by c.client_id, c.first_name, c.last_name
)
select client_id, first_name, last_name, round(total_spent, 2) as total_spent
from customer_spending
order by total_spent desc;