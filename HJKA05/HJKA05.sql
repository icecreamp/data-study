# Hyunjin Kim
# PROG2220: Section 1

# Assignment 5: Task 1 - 1
# list_price: With 2 digits. Use FORMAT function
# discount_percent: Return it as INT. Use CAST
# discount_amount: Calculate it with list_price and discount_percent. Use ROUND to display 2 decimal digits
# month_day_added: Use DATE_FORMAT to return date_added in MM-DD format
USE my_guitar_shop;
SELECT FORMAT(list_price, 2) as list_price, CAST(discount_percent AS DECIMAL) as discount_percent, ROUND(list_price * discount_percent/100, 2) AS discount_amount, DATE_FORMAT(date_added, '%M-%D') as day_added
FROM products;


# Assignment 5: Task 1 - 2
# Return order_date, four-digit of year of order_date, Mon-DD-YYYY format of order_date, hour of order_date, MM/DD/YY HH:MI format of order_date
USE my_guitar_shop;
SELECT order_date, DATE_FORMAT(order_date, "%Y") AS year, DATE_FORMAT(order_date, '%a-%D-%Y') AS day, DATE_FORMAT(order_date, '%h-%p') AS time, DATE_FORMAT(order_date, '%m/%d/%y %h:%i')
FROM orders;

# Assignment 5: Task 2 - 1
# Display the evaluation score of 'Janet Park'. Round the result to two decimal places
USE swexpert;
SELECT e.evaluatee_id, CONCAT_WS(' ' , c.c_first, c.c_last) AS name, ROUND(AVG(e.score), 2) AS average
FROM evaluation e
JOIN consultant c 
ON e.evaluatee_id = c.c_id
WHERE c.c_last = "Park" AND c.c_first = "Janet"
GROUP BY e.evaluatee_id;


# Assignment 5: Task 2 - 2
# p_id: Pad spaces to align the output values with the column heading 
# consultant_id: Pad spaces to align the ouput values with the column heading
# months: Number of months between ROLL_OF and ROLL_ON. Use 30.4 days in a month to convert number of days to number of months.
# Turncate the total months. Align to the right. Use LPAD function
USE swexpert;
SELECT 
	LPAD(p_id, 4, ' ') AS p_id,
    LPAD(c_id, 6, ' ') AS consultant_id,
    LPAD(TRUNCATE(DATEDIFF(roll_off_date, roll_on_date) / 30.4, 0), 4, ' ') AS months
FROM 
    project_consultant;


