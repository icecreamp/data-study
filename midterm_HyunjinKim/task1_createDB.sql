# Hyunjin Kim / 8751595 / Hkim1595@conestogac.on.ca 

# INSERT the following to customers table [1 mark]
USE midterm_1;
INSERT INTO customers
VALUES
(1, 'John Smith', 'johnsmith@example.com', '555-1234'),
(2, 'Jane Doe', 'janedoe@example.com', '555-5678'),
(3, 'Bob Johnson', 'bjohnson@example.com', '555-9012'),
(4, 'Alice Lee', 'alee@example.com', '555-3456'),
(5, 'Mike Chen', 'mchen@example.com', '555-7890');

USE midterm_1;
INSERT INTO orders
VALUES
(1, 1, '2022-01-01', 100.00),
(2, 1, '2022-01-15', 75.00),
(3, 2, '2022-02-01', 50.00),
(4, 3, '2022-02-15', 200.00),
(5, 4, '2022-03-01', 125.00);

USE midterm_1;
INSERT INTO order_items
VALUES
(1, 1, 'Widget A', 2, 25.00),
(2, 1, 'Widget B', 1, 50.00),
(3, 2, 'Widget A', 1, 25.00),
(4, 3, 'Widget C', 1, 50.00),
(5, 3, 'Widget D', 1, 150.00),
(6, 4, 'Widget B', 2, 25.00),
(7, 4, 'Widget D', 1, 150.00),
(8, 5, 'Widget A', 2, 25.00),
(9, 5, 'Widget C', 1, 50.00);