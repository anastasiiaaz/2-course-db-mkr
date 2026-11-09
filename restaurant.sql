-- клієнти (ім'я, телефон, email)
-- столики (номер столика, місткість, розташування)
-- позиції меню (назва, опис, ціна, категорія)
-- замовлення (час замовлення, статус)
-- позиції замовлення (позиції в кожному замовленні з кількістю)
-- додано: працівники 

drop table if exists order_items cascade;
drop table if exists orders cascade;
drop table if exists menu_items cascade;
drop table if exists tables cascade;
drop table if exists clients cascade;
drop table if exists employees cascade; 

drop type if exists order_status cascade;
drop type if exists category cascade;
drop type if exists employee_role cascade;

create type category as enum ('main course', 'side dish', 'dessert', 'beverage', 'appetizer', 'salad', 'soup');
create type order_status as enum ('new', 'preparing', 'ready', 'completed', 'cancelled');
create type employee_role as enum ('waiter', 'chef', 'manager', 'bartender');
create type table_location as enum ('main_hall', 'terrace', 'vip_room', 'bar_zone');

create table if not exists clients
(
  client_id int generated always as identity primary key,
  first_name     varchar(50) not null,
  last_name   varchar(50) not null,
  email     varchar(100) not null unique,
  phone     varchar(15) not null unique,
  is_deleted boolean not null default false
);

create table if not exists employees 
(
  employee_id int generated always as identity primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null, 
  role employee_role not null,
  phone varchar(15) not null unique,
  hire_date date default current_date not null
);

create table if not exists tables
(
  table_id     int generated always as identity primary key,
  table_number integer not null unique check (table_number > 0),
  location     table_location not null,
  capacity     integer not null check (capacity > 0),
  is_deleted   boolean not null default false
);

create table if not exists menu_items
(
  menu_item_id     int generated always as identity primary key,
  menu_item_name        varchar(100)    not null,
  description text,
  price        numeric(10, 2) not null check (price > 0),
  category     category       not null,
  is_deleted   boolean not null default false
);

create table if not exists orders
(
  order_id   int generated always as identity primary key,
  order_date timestamp    not null default current_timestamp,
  status     order_status not null default 'new',
  employee_id int references employees(employee_id),
  client_id  integer      not null references clients (client_id),
  table_id   integer references tables (table_id),
  is_deleted  boolean not null default false
);

create table if not exists order_items
(
  order_item_id int generated always as identity primary key,
  quantity       integer not null check (quantity > 0),
  order_id       integer not null references orders (order_id) on delete cascade,
  item_id        integer not null references menu_items (menu_item_id)
);