# Hyunjin Kim
# PROG2220: Section 1

# Assignment 1: Task 1 - 1
# Return three columns (vendor_name, vendor_contact_last_name, and vendor_contact_first_name)
# And add an ORDER BY to sort the result set last name and then first name in ascending sequence
USE ap;
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name 
FROM Vendors
ORDER BY vendor_contact_last_name ASC, vendor_contact_first_name ASC;

# Assignment 1: Task 1 - 2
# Return one column from the Vendors table named full_name that joins the vendor_contact_last_name and vendor_contact_first_name 
# Format like this: Doe, John
# And sort the result set by last name and then first name in ascending sequence
# Return only the contacts whose last name begins with the letter A, B, C, or E
USE ap;
SELECT concat(vendor_contact_last_name,', ', vendor_contact_first_name) AS name
FROM Vendors
WHERE vendor_contact_last_name BETWEEN 'A' and 'E'
ORDER BY vendor_contact_last_name, vendor_contact_first_name;


# Assignment 1: Task 1 - 3
# Retrun invoice_due_date, invoice_total, 10% of the value of invoice_total, the value of invoice_total plus 10%
# Return only the rows where 500 <= invoice_total <= 1000
# Sort the result by invoice_due_date in desc
USE ap;
SELECT invoice_due_date AS 'Due Date', invoice_total AS 'Invoice Total', invoice_total * 0.1 AS '10%', invoice_total + invoice_total * 0.1 AS 'Plus 10%'
FROM invoices
WHERE 500 <= invoice_total AND invoice_total <= 1000
ORDER BY invoice_due_date DESC;

# Assignment 1: Task 1- 4
# Return invoice_number, invoice_total, payment_credit_total, balance_due
# Return where 50 <= invoices that have a balance due
# Sort the rusult set by balance due in desc
# Use LIMIT to show the 5 largest balances
USE ap;
SELECT invoice_number, invoice_total, payment_total + credit_total AS payment_credit_total, invoice_total - (payment_total + credit_total) AS balance_due, invoice_total - (payment_total + credit_total) AS balance_due
FROM invoices
WHERE 50 < invoice_total - (payment_total + credit_total)
ORDER BY invoice_total - (payment_total + credit_total) DESC
LIMIT 5;

# Assignment 1: Task 1 - 5
# Return invoice_number, invoice_date, balance_due, payment_date
# Return where the paymen_date contains a null value
SELECT invoice_number, invoice_date, invoice_total - (payment_total + credit_total) AS balance_due, payment_date
FROM invoices
WHERE payment_date is null;

# Assignment 1: Task 1 - 6
# Use DATE_FORMAT to format the current date in the format: mm-dd-yyyy and name it current_date
SELECT
  DATE_FORMAT(NOW(), '%M-%D-%Y') AS 'current_Date';

# Assignment 1: Task 1 - 7
# Return starting_principal(starting pricipal of $50,000), interest(6.5% of the principal), principal_plus_interest(principal + interest)
SELECT 50000 AS starting_principal, 50000 * 6.5 AS interest, 50000 + 50000 * 6.5 AS principal_plus_interest;

# Assignment 1: Task 2 - 1
# Return product_name, list_price, discount_percent
# Sort the result set by list price in descending sequence
USE my_guitar_shop;
SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY list_price DESC;

# Assignment 1: Task 2 - 2
# Return product_name, list_price, date_added
# Return only where 500 < list_price < 2000
# Sort the result set in descending sequence by date_added
USE my_guitar_shop;
SELECT product_name, list_price, date_Added
FROM products
WHERE 500 < list_price AND list_price < 2000
ORDER BY date_added DESC;

# Assignment 1: Task 2 - 3
# Return item_id, item_price, discount_amount, quantity, price_total(price * quantity), discount_total(discount * quantity), item_total((item price - discount amount) * quantity)
# Only return where 500 < item_total
# Sort the result set by item total in descending sequence
USE my_guitar_shop;
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total, discount_amount * quantity AS discount_total, (item_price - discount_amount) * quantity AS item_total
FROM order_items
WHERE 500 < (item_price - discount_amount) * quantity
ORDER BY (item_price - discount_amount) * quantity DESC;

# Assignment 1: Task 2 - 4
# Return order_id, order_date, ship_date from orders table
# Return where ship_date contains a null value
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date is null;


# Assignment 1: Task 2 - 5
# Create a row with these columns 
# price: 100, tax_rate: 7%, tax_amount: price*tax, total: price + tax_amount
SELECT 100 AS price, 0.07 AS tax_rate, 100 * 0.07 AS tax_amount, 100 + 100 * 0.07 AS total;
