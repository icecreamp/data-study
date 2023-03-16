# Hyunjin Kim
# PROG2220: Section 1

# Assignment 4: Task 1 - 1
# Count of the number of orders in the orders table
# Sum of the tax_amount columns in the orders table
USE my_guitar_shop;
SELECT COUNT(*) AS 'orders', SUM(tax_amount) AS 'tax' 
FROM orders;

# Assignment 4: Task 1 - 2
# category_name column from Categories, count of products from Products
# list of price of the most expensive product in Products
# Sort the result set so the category with the most products appears first
USE my_guitar_shop;
SELECT c.category_name, COUNT(p.product_id), MAX(p.list_price)
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_id;


# Assignment 4: Task 1 - 3
# product name, total amount of each product, use WITH ROLL UP
USE my_guitar_shop;
SELECT p.product_name, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS 'Total'
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name WITH ROLLUP;


# Assignment 4: Task 1 - 4
# Return category_name that has never been assigned to any product in the Products table
# Use subquery and include NOT EXISTS
USE my_guitar_shop;
SELECT category_name
FROM categories c
WHERE NOT EXISTS
(SELECT category_id FROM products p WHERE p.category_id = c.category_id);

# Assignment 4: Task 2 - 1
# Display the averae evaluation score for evaluatee_id and round it to one decimal place
USE swexpert;
SELECT evaluatee_id, ROUND(AVG(score), 1)
FROM evaluation
GROUP BY evaluatee_id;

# Assignment 4: Task 2 - 2
# Count the number of consultants who are certified in skill ID 1
USE swexpert;
SELECT COUNT(c_id)
FROM consultant_skill
WHERE skill_id = 1;

# Assignment 4: Task 2 - 3
# List the first and last name of every consultant who has ever worked on a project with Mark Myers
# Include the name in the result set
# Use a subquery
USE swexpert;
SELECT DISTINCT CONCAT(c.c_last,' ', c.c_first) AS name
FROM consultant c
JOIN project_consultant pc ON c.c_id = pc.c_id
WHERE pc.p_id IN (
SELECT pc2.p_id FROM project_consultant pc2 JOIN consultant c2 ON pc2.c_id = c2.c_id
WHERE c2.c_first = 'Mark' AND c2.c_last = 'Myers'
);


# Assignment 4: Task 2 - 4
# Use UNION to generate the result set consisting of two columns: project ID and name
# The result must include all the projects with completed evaluations and 
# projects managed by consultant with last name that starts with 'Z'
# Use a subquery and remove duplicates
USE swexpert;
SELECT p_id, project_name
FROM project
WHERE p_id IN (
  SELECT p_id
  FROM evaluation
  WHERE score IS NOT NULL
  UNION
  SELECT pc.p_id
  FROM project_consultant pc
  INNER JOIN consultant c ON pc.c_id = c.c_id
  WHERE c.c_last LIKE 'Z%'
);

# Assignment 4: Task 3 - 1
# Write ALTER TABLE that adds 'total_days' column to the project_consultant table
# This should have a default value of 0 
# Update the new column with the different of ROLL OFF and ROLL ON dates
# Display all the contents of project_consultant table
# Drop the 'total_days' column 
-- USE swexpert;
-- ALTER TABLE project_consultant
-- ADD total_days INT DEFAULT(0);

-- USE swexpert;
-- UPDATE project_consultant
-- SET total_days = DATEDIFF(roll_off_date, roll_on_date);

-- SELECT * FROM swexpert.project_consultant;

-- ALTER TABLE project_consultant
-- DROP COLUMN total_days;

# Assignment 4: Task 3 - 2
# Create a new evaluation_audit table with these columns
# audit_id(primary, atuo increase): integer / audit_e_id: NOT NULL / audit_score: int / audit_user: string (length of 20)
# Insert a new row for consultant (e_id) 100 with a score of 90
# Display all the contents of evaluation_audit table

-- CREATE TABLE swexpert.evaluation_audit (
-- audit_id INT AUTO_INCREMENT ,
-- audit_e_id INT NOT NULL,
-- audit_score INT,
-- audit_user VARCHAR(20),
-- PRIMARY KEY (audit_id)
-- );

-- INSERT INTO swexpert.evaluation_audit
-- VALUES (DEFAULT, 100, 90, 'description');

-- SELECT * FROM swexpert.evaluation_audit;

# Assignment 4: Task 3 - 3
# Assign empty string to audit_user column that have NULL values
# Write a single ALTER TABLE statement that will disallow null values for the audit_user column
# Write an ALTER TABLE statement that adds a new 'audit_date' column
# Insert another row for consultant 100 with a score of 95 along with the current user and current date.
# Display all the contents of evaluation_audit table
# Write a negative test case by inserting a row for consultant 100 with a score of 99 with an unknown user and date

-- USE swexpert;
-- UPDATE evaluation_audit
-- SET audit_user = ''
-- WHERE audit_user IS NULL;

-- USE swexpert;
-- ALTER TABLE evaluation_audit
-- MODIFY audit_user VARCHAR(20) NOT NULL;

-- USE swexpert;
-- ALTER TABLE evaluation_audit
-- ADD audit_date DATE;

-- USE swexpert;
-- INSERT INTO evaluation_audit
-- VALUE (DEFAULT, 100, 95, USER(), CURRENT_DATE());

-- USE swexpert;
-- SELECT * FROM evaluation_audit;

-- USE swexpert;
-- INSERT INTO evaluation_audit
-- VALUES(DEFAULT, 100, 99, NULL, NULL);

# Assignment 4: Task 3 - 4
# Write a negative test case by inserting a new row with an unknown (NULL) skill_id to the project_skill table.
-- USE swexpert;
-- INSERT INTO project_skill
-- VALUES(DEFAULT, NULL);

# Assignment 4: Task 3 - 5
#  Write a negative test case by deleting a row from the consultant table that will violate a foreign key constraint.
USE swexpert;
DELETE FROM consultant WHERE c_id = 100;