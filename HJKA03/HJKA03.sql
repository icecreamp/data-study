# Hyunjin Kim 8751595
# PROG2220: Section 1

# Assignment 3: Task 1 - 1 5-04
# Write an INSERT statement that adds this row to the Invoices table
USE ap;
INSERT INTO invoices
(vendor_id, invoice_number, invoice_date, invoice_total, payment_total, credit_total, terms_id, invoice_due_date, payment_date)
VALUES
(32, 'AX-014-027', '2014-08-01', 434.58, 0, 0, 2, '2014-08-31', null);

# Assignment 3: Task 1 - 2 5-05
# Write an INSERT statement that adds these rwos to the Invoice_Line_Items
# Note: Instead of hard-coded primary key value, use the LAST_INSERT_ID() function.
USE ap;
INSERT INTO invoice_line_items
(invoice_id, invoice_sequence, account_number, line_item_amount, line_item_description)
VALUES
(LAST_INSERT_ID(), 1, 160, 180.23, 'Hard drive'),
(LAST_INSERT_ID(), 2, 527, 254.35, 'Exchange Server update');

# Assignment 3: Task 1 - 3 5-06
# Write a UPDATE statement that modifies the invoice you added in exercise 4
# This statement should change the credit_total column so it's 10% of the invoice_total column
# and it should change the payment_total column so the sum of the payment_total and credit_total columns are equal to the invoice_Total column
USE ap;
UPDATE invoices
SET credit_total = invoice_total * 10/100, payment_total = invoice_total * 90/100
WHERE invoice_id = LAST_INSERT_ID();

# Assignment 3: Task 1 - 4 5-09
# Write a DELETE statement that deletes the row that you added to the Invoices table in exercise 4
USE ap;
DELETE FROM Invoice_Line_Items WHERE invoice_id = LAST_INSERT_ID();
DELETE FROM Invoices WHERE invoice_id = LAST_INSERT_ID();

# Assignment 3: Task 2 - 1a
# Write an INSERT statement that adds this row to the Categories table: Category_name: Wind
# Code the INSERT statement so MySQL automatically generates the category_id column
USE my_guitar_shop;
INSERT INTO categories(category_name)
VALUES ('Wind');

# Assignment 3: Task 2 - 1b
# UPDATE statement that modifies the row you just added to the Categories table
# change the category_name column to "String", and it should use the category_id column to identify the row
USE my_guitar_shop;
UPDATE categories
SET category_name = "String"
WHERE category_id = 5;

# Assignment 3: Task 2 - 1c
# Write a DELETE statement that deletes the row you just added to the Categories table
# This statement should use the category_id column to identify the row
USE my_guitar_shop;
DELETE FROM categories WHERE category_id = 5;

# Assignment 3: Task 2 - 2a
# Write an INSERT statement that adds this row to the Products table

USE my_guitar_shop;
INSERT INTO products
(category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES
(4, "dgx_640", "Yamaha DGX 640 Digital Piano", "This is the Yamaha DGX 640 Digital Piano with 88 keys.", 845.95, 10, now());

# Assignment 3: Task 2 - 2b
# Write an UPDATE statement that modifies the product you just added
# Change the discount_percent column from 10% to 30%
USE my_guitar_shop;
UPDATE products
SET discount_percent = 30
WHERE product_id = 11;

# Assignment 3: Task 2 - 3a
USE my_guitar_shop;
INSERT INTO customers
(email_address, password, first_name, last_name)
VALUES
("HyunjinKim@conestogac.on.ca", "", "Hyunjin", "Kim");

# Assignment 3: Task 2 - 3b
# Write an UPDATE statement that modifies the Customers table
# Change the password column to "s3cr3t" 
# for the customer with an email address of yourname@conestogac.on.ca
USE my_guitar_shop;
UPDATE customers 
SET password = "s3cr3t"
WHERE email_address = "HyunjinKim@conestogac.on.ca";

# Assignment 3: Task 3 - 1
# Insert a new record in concultant table.
USE swexpert;
INSERT INTO consultant
(c_id, c_last, c_first, c_mi, c_add, c_city, c_state, c_zip, c_phone, c_email)
VALUES
(106, "Kim", "Hyunjin", "J", "123 Fake St", "Fake city", "ON", "N2N N2N", "1231231234", "email@gmail.com");

# Assignment 3: Task 3 - 2
# Add a new record in client table
USE swexpert;
INSERT INTO client
(client_id, client_name, contact_last, contact_first, contact_phone)
VALUES
(17, "City of Waterloo", "Jaworsky", "Dave", "5198861550");

# Assignment 3: Task 3 - 3
# Add a new project named 'ION Rapid Transit' with a project ID of 88
USE swexpert;
INSERT INTO project
(p_id, project_name, client_id, mgr_id)
VALUES
(88, "ION Rapid Transit", 17, 106);

# Assignment 3: Task 3 - 4
# Assign the project that you just created to rows where the parent_p_id is null but not in the latest project
USE swexpert;
UPDATE project
SET parent_p_id = 88
WHERE parent_p_id IS NULL AND p_id != 88;

