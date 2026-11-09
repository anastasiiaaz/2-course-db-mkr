--- Notice: The following text was created using an AI assistant.

-- 1. Populate Clients table
INSERT INTO clients (first_name, last_name, email, phone) VALUES
('Marta', 'Horichko', 'horichko.m@gmail.com', '+380972223344'),
('Maryna', 'Hrytsenko', 'hrytsenko.m@gmail.com', '+380973334455'),
('Arina', 'Humeniuk', 'humeniuk.a@gmail.com', '+380974445566'),
('Anna', 'Denisova', 'denisova.a@gmail.com', '+380975556677'),
('Tetiana', 'Denisova', 'denisova.t@gmail.com', '+380976667788'),
('Kira', 'Kim', 'kim.k@gmail.com', '+380977778899'),
('Sofiia', 'Kiosova', 'kiosova.s@gmail.com', '+380978889900'),
('Tetiana', 'Petrovska', 'petrovska.t@gmail.com', '+380979990011'),
('Yaroslava', 'Semeniuk', 'semeniuk.y@gmail.com', '+380980001122'),
('Yelyzaveta', 'Shneer', 'shneer.e@gmail.com', '+380981112233'),
('Andrii', 'Boichuk', 'boichuk.a@gmail.com', '+380982223344'),
('Artem', 'Brahar', 'brahar.a@gmail.com', '+380983334455'),
('Denys', 'Buntovskyi', 'buntovskyi.d@gmail.com', '+380984445566'),
('Maksym', 'Haviaz', 'haviaz.m@gmail.com', '+380985556677'),
('Anton', 'Dashuk', 'dashuk.a@gmail.com', '+380986667788'),
('Maksym', 'Kovalenko', 'kovalenko.m@gmail.com', '+380987778899'),
('Viktor', 'Krot', 'krot.v@gmail.com', '+380988889900'),
('Kyrylo', 'Nikiforov', 'nikiforov.k@gmail.com', '+380989990011'),
('Oleksandr', 'Oksiuk', 'oksiuk.o@gmail.com', '+380990001122');

-- 2. Populate Employees table
INSERT INTO employees (first_name, last_name, role, phone, hire_date) VALUES
('Arkhyp', 'Onyshchenko', 'waiter', '+380501112233', '2024-01-15'),
('Artur', 'Pashchenko', 'waiter', '+380502223344', '2024-02-01'),
('Dmytro', 'Pyrih', 'chef', '+380503334455', '2023-05-10'),
('Arsen', 'Pleskach', 'chef', '+380504445566', '2023-08-20'),
('Vladyslav', 'Puhach', 'bartender', '+380505556677', '2024-03-12'),
('Anton', 'Semianistyi', 'manager', '+380506667788', '2022-11-01'),
('Andrii', 'Teodorovych', 'waiter', '+380507778899', '2024-06-15'),
('Mykhailo', 'Shkola', 'waiter', '+380508889900', '2024-07-01');

-- 3. Populate Tables entity
INSERT INTO tables (table_number, capacity, location) VALUES
(1, 2, 'main hall'),
(2, 2, 'terrace'),
(3, 4, 'terrace'),
(4, 4, 'main hall'),
(5, 6, 'vip room'),
(6, 8, 'bar zone');


-- 4. Populate Menu Items table
INSERT INTO menu_items (menu_item_name, description, price, category) VALUES
('Shrimp and Pumpkin Salad', 'Salad mix, arugula, cherry tomatoes, tiger shrimp, roasted pumpkin, Feta cheese', 265.00, 'salad'),
('Beef Carpaccio with Parmesan', 'Marinated beef, capers, arugula, Parmesan cheese, grissini', 260.00, 'appetizer'),
('Beer Platter', 'Breaded Cheddar cheese, tempura shrimp, smoked sausages, prosciutto', 355.00, 'appetizer'),
('Crispy Chicken Caesar Salad', 'Salad mix, smoked bacon chips, Parmesan, Caesar dressing, crispy chicken fillet', 230.00, 'salad'),
('Greek Salad with Feta Mousse', 'Cucumber, tomatoes, bell pepper, green olives, Feta mousse', 195.00, 'salad'),
('Shrimp Bisque Soup', 'Shrimp bisque, Parmesan, garlic paste, tiger shrimp, arugula', 175.00, 'soup'),
('Chicken Ramen', 'Fish broth, linguine, breaded chicken fillet, shiitake mushrooms, marinated egg', 195.00, 'soup'),
('Tom Yum', 'Fish broth, shiitake mushrooms, mussels, salmon fillet, tiger shrimp, coconut milk', 290.00, 'soup'),
('Chicken Fillet with Pumpkin Puree', 'Marinated chicken fillet, button mushrooms, shiitake mushrooms, pumpkin puree', 285.00, 'main course'),
('Bacon & Pumpkin Gnocchi', 'Pumpkin gnocchi, smoked bacon, cream, Parmesan cheese', 185.00, 'main course'),
('Bread + Meze', 'House-made grain bread & brioche, caper and tomato spread', 85.00, 'side dish'),
('Cheese Fries with Kasai Sauce', 'Breaded Cheddar cheese, Kasai sauce', 165.00, 'side dish'),
('Pumpkin Tartlet Dessert', 'Delicate dessert with pumpkin cream and caramel', 140.00, 'dessert'),
('Citrus Lemonade', 'Refreshing lemonade with orange and lemon', 85.00, 'beverage');

-- 5. Populate Orders table
INSERT INTO orders (order_date, status, employee_id, client_id, table_id) VALUES
('2026-11-01 12:30:00', 'completed', 1, 1, 1),
('2026-11-01 13:15:00', 'completed', 2, 2, 3),
('2026-11-02 18:00:00', 'completed', 7, 3, 4),
('2026-11-02 19:45:00', 'completed', 1, 4, 5),
('2026-11-03 14:10:00', 'ready', 8, 5, 2),
('2026-11-03 15:30:00', 'preparing', 2, 6, 3),
('2026-11-03 16:00:00', 'new', 7, 7, 1);


-- 6. Populate Order Items table
INSERT INTO order_items (quantity, order_id, item_id) VALUES
(1, 1, 1), -- Order 1: Shrimp and Pumpkin Salad
(2, 1, 14),-- Order 1: 2 Citrus Lemonades
(1, 2, 4), -- Order 2: Crispy Chicken Caesar Salad
(1, 2, 6), -- Order 2: Shrimp Bisque Soup
(2, 3, 8), -- Order 3: 2 Tom Yum Soups
(1, 3, 3), -- Order 3: Beer Platter
(3, 4, 9), -- Order 4: 3 Chicken Fillets with Pumpkin Puree
(2, 4, 13),-- Order 4: 2 Pumpkin Tartlets
(1, 5, 7), -- Order 5: Chicken Ramen
(1, 6, 10),-- Order 6: Bacon & Pumpkin Gnocchi
(1, 7, 5);  -- Order 7: Greek Salad