# Hyunjin Kim / 8751595 / Hkim1595@conestogac.on.ca 

CREATE DATABASE midterm_2;

USE midterm_2;
CREATE TABLE municipalities (
id INT PRIMARY KEY,
name VARCHAR(50),
province VARCHAR(50),
population INT,
land_area DECIMAL(10,2)
);

CREATE TABLE schools (
id INT PRIMARY KEY,
name VARCHAR(50),
municipality_id INT,
school_type VARCHAR(20),
student_count INT
);

CREATE TABLE mayors (
id INT PRIMARY KEY,
name VARCHAR(50),
municipality_id INT,
term_start DATE,
term_end DATE
);

USE midterm_2;
INSERT INTO municipalities
VALUES
(1, 'Toronto', 'Ontario', 2731571, 630.20),
(2, 'Vancouver', 'British Columbia', 647540, 114.97),
(3, 'Calgary', 'Alberta', 1237656, 825.29),
(4, 'Halifax', 'Nova Scotia', 403131, 547.00),
(5, 'Winnipeg', 'Manitoba', 705244, 464.08),
(6, 'Mississauga', 'Ontario', 828854, 292.43),
(7, 'Markham', 'Ontario', 328966, 212.58),
(8, 'Richmond Hill', 'Ontario', 209701, 101.11),
(9, 'Brampton', 'Ontario', 594388, 266.36),
(10, 'Vaughan', 'Ontario', 330000, 273.56);

USE midterm_2;
INSERT INTO schools
VALUES
(1, 'Central High School', 1, 'Public', 1200),
(2, 'North Secondary School', 1, 'Public', 1000),
(3, 'South Middle School', 1, 'Public', 800),
(4, 'West Elementary School', 2, 'Public', 500),
(5, 'East Elementary School', 2, 'Public', 450);

USE midterm_2;
INSERT INTO mayors
VALUES
(1, 'John Smith', 1, '2020-01-01', '2022-12-31'),
(2, 'Jane Doe', 2, '2019-01-01', '2022-12-31'),
(3, 'Bob Johnson', 3, '2022-01-01', '2024-12-31'),
(4, 'Alice Lee', 4, '2021-01-01', '2023-12-31'),
(5, 'Mike Chen', 5, '2022-01-01', '2024-12-31');


