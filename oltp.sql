-- 2 insert запити до будь-яких таблиць
select * from order_items;
select * from employees;
select * from tables;

insert into employees (first_name, last_name, role, phone)
values ('Arsenii','Khmelnytskyi', 'manager', '+380981159933'),
('Anastasiia', 'Zotova', 'bartender', '+380677812233');

insert into tables (table_number, location, capacity )
values (15,'bar zone', 4),(16,'vip room', 2),(17,'terrace', 6);

insert into order_items (quantity, order_id, item_id) values (2, 5, 13),(2, 6, 11),(1, 7, 7);

select * from order_items;
select * from employees;
select * from tables;

-- 2 update запити до будь-яких таблиць

select * from orders;
update orders
set status='cancelled'
where order_id=6;

select order_id, status from orders;

select * from menu_items; 
update menu_items
set price = price * 1.1
where category = 'soup';

select menu_item_name, category, price from menu_items
where category = 'soup';


-- 2 delete запити з будь-яких таблиць

select * from order_items;
delete from order_items 
where order_id = 7 and item_id = 5;
select * from order_items;


select menu_item_name, price, category from menu_items;

delete from menu_items
where menu_item_name = 'Beef Carpaccio with Parmesan' ;

select menu_item_name, price, category
from menu_items
where menu_item_name = 'Beef Carpaccio with Parmesan';
-- physical delete works fine here as the item was never ordered, but its better to use soft delete (set is_deleted=true)

-- 2 прості select:
-- підготувати чек з чайовими

select order_id, table_number, order_date, menu_item_name, quantity, price, oi.quantity * mi.price as item_price, sum(oi.quantity*mi.price) over (partition by oi.order_id) as total_price, round(sum(oi.quantity*mi.price) over (partition by oi.order_id)*0.1, 2) as tips from tables
inner join orders o using (table_id)
inner join order_items oi using (order_id)
inner join menu_items mi on oi.item_id=mi.menu_item_id;


-- знайти всі не зайняті столики (столики, для яких немає
-- незавершених замовлень)
 
select t.table_number, t.capacity, t.location from tables t
where t.is_deleted = false and not exists (
select 1 from orders o 
where o.table_id = t.table_id and o.status in ('new', 'preparing', 'ready') and o.is_deleted = false);