# Hyunjin Kim
# PROG2220: Section 1

# Assignment 2: Task 1 - 1
# Return three columns (category_name, product_name, and list_price)
# Sort the result set by category_name and product_name in ASC
USE my_guitar_shop;
SELECT c.category_name, p.product_name, p.list_price
FROM categories c
JOIN products p
ON c.category_id = p.category_id
ORDER BY category_name, product_name;

# Assignment 2: Task 1 - 2
# Return three columns (first_name, last_name, line1, city, state and zip_code)
# Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com
USE my_guitar_shop;
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers c
JOIN addresses a
ON c.customer_id = a.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';

# Assignment 2: Task 1 - 3
# Return three columns (last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity)
# Use aliaess for the tables and sort the final result set by last_name, order_date, and product_name.
USE my_guitar_shop;
SELECT c.last_name AS 'last name', c.first_name AS 'first name', o.order_date AS 'order date', p.product_name AS 'product name', i.item_price AS 'item price', i.discount_amount AS 'discount amount', i.quantity AS 'quantity'
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items i
ON o.order_id = i.order_id
JOIN products p
ON i.product_id = p.product_id;

# Assignment 2: Task 1 - 4
# Return three columns (product_id, product_name, and list_price)
# Return one row for each product that has the same list price as another product
USE my_guitar_shop;
SELECT p1.product_id, p1.product_name, p1.list_price, p2.product_id, p2.product_name, p2.list_price
FROM products p1
JOIN products p2
ON p1.list_price = p2.list_price;

# Assignment 2: Task 1 - 5
# ship_status: A calculated column that contains a value of SHIPPED or NOT SHIPPED
# order_id: The order_id column
# order_date: The order_date column
# If the order has a value in the ship_date column, the ship_status column should contain a value of SHIPPED.
# Otherwise, it should contain a value of NOT SHIPPED. 
# Sort the result set by order_date.
USE my_guitar_shop;
SELECT order_id, order_date, "SHIPPED" AS ship_status
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT order_id, order_date, "NOT SHIPPED" AS ship_status
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date;

# Assignment 2: Task 2 - 1
# Retrieve the names of the cities which each consultant lives. 
# Suppress duplicate outputs, and display the values in alphabetical order.
USE swexpert;
SELECT DISTINCT c_city
FROM consultant
ORDER BY c_city;

# Assignment 2: Task 2 - 2
#  Retrieve the project ID and project name of all projects that have parent projects.
USE swexpert;
SELECT p_id AS 'project ID', project_name AS 'name'
FROM project
WHERE parent_p_id IS NOT NULL;

# Assignment 2: Task 2 - 3
# Use only project table, display the project id, name, parent project's id and name.
# Include all the projects even if they don't have any parent project.
USE swexpert;
SELECT p1.p_id, p1.project_name, p1.parent_p_id, p2.project_name AS 'Parent project name'
FROM project p1
LEFT JOIN project p2
ON p1.parent_p_id = p2.p_id;

# Assignment 2: Task 2 - 4
# Return consultant ID, skill ID and certification
# List only consultants with skills that are certified. 
# Sort the final result set by skill ID, followed by consuultant ID.
USE swexpert;
SELECT c_id, skill_id
FROM consultant_skill
WHERE certification = 'Y'
ORDER BY c_id, skill_id;

# Assignment 2: Task 2 - 5
# List all the consultant ID, last name and first name, skill ID and skill description.
# Only for consultants with skills that are certified.
# Sore the final result set by skill ID, followed by consultant ID.
USE swexpert;
SELECT c.c_id, c.c_last, c.c_first, cs.skill_id, s.skill_description
FROM consultant c
JOIN consultant_skill cs
ON c.c_id = cs.c_id
JOIN skill s
ON cs.skill_id = s.skill_id
WHERE cs.certification = 'Y'
ORDER BY cs.skill_id, c.c_id