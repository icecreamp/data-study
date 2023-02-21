# Hyunjin Kim / 8751595 / Hkim1595@conestogac.on.ca 

# Which municipalities have a population greater than 1 million?
USE midterm_2;
SELECT name, population
FROM municipalities
WHERE population > 1000000;

# Which mayors have a term start date after January 1, 2021 and a term end date before December 31, 2023? [3 marks]
USE midterm_2;
SELECT name, term_start, term_end
FROM mayors
WHERE term_start >= '2021-01-01' AND term_end <= '2023-12-31';

# What is the name and population of all municipalities in the same province as Toronto but not including Toronto? [4 marks]
USE midterm_2;
SELECT name, province
FROM municipalities
WHERE province = 'Ontario' AND name != 'Toronto';


# What is the SQL query to select the names of all municipalities in the municipalities table that start with the letter "M"? [2 marks]
USE midterm_2;
SELECT *
FROM municipalities
WHERE name LIKE 'M%';