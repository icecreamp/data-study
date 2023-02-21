# Hyunjin Kim / 8751595 / Hkim1595@conestogac.on.ca 

# total value of all orders for each customer, sorted by customer name
USE midterm_1;
SELECT c.name, SUM(o.total) AS 'total'
FROM customers c
LEFT JOIN orders o 
ON c.id = o.customer_id
GROUP BY c.name;


# average price per item for each product, sorted by product name
USE midterm_1;
SELECT product, AVG(price)
FROM order_items
GROUP BY product;


# update the phone number for customer with ID 3 to '555-5555'
USE midterm_1;
UPDATE customers
SET phone = '555-5555'
WHERE ID = 3;

# find the names and email addresses of customers who have not placed an order
USE midterm_1;
SELECT c.name, c.email
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL


