/*
Think of the minimum relationship that is associated with books database:
orders
genres
reviews
customers
versions
authors
released years
...

Relationship basics:
1. 1-1 relationship (not that common) - basically two tables
2. 1-many relationship ( think of one book have many reviews; all those reviews belong to just one book)
3. many-many relationships ( one book can have many authors, and those authors can have a whole bunch of other books)

1 to many: try to keep all your data seperate all the time....helps with duplicated data
Data to store:
student info: Student's first name, last name, email, unique id, the date student joined;
attendance: Student's unique id, check-in record, latness excuses, absent excuses, data reported;
personal info: unique id, alergies, pick-up-from-school-contact;
parent contact: unique id, mom contact, dad contact, mom name, dad name
behavior: unique id, behavior report, date reported;

Notice the unique id is in all tables. this is what makes it one to many.
the unique id in all other tables is a reference to that particular student.

*/
CREATE DATABASE IF NOT EXISTS 1tomany;
SHOW DATABASES;
USE 1tomany;

CREATE TABLE customers(
  id INT AUTO_INCREMENT PRIMARY KEY,
  fname VARCHAR(128),
  lname VARCHAR(128),
  email VARCHAR(128)
);
-- basically customer id is a foreign key which references id in the customer table.;
CREATE TABLE orders(
  id INT AUTO_INCREMENT PRIMARY KEY,
  orderDate TIMESTAMP DEFAULT NOW(),
  amount DECIMAL(8,2),
  customer_id INT,
  FOREIGN KEY(customer_id) REFERENCES customers(id)
);

SHOW TABLES;

-- insert information;
INSERT INTO customers(fname,lname,email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (orderDate, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

SELECT * FROM customers;
SELECT * FROM orders;

INSERT INTO orders (orderDate, amount, customer_id)
VALUES ('2016/03/10', 199.99, 5);

-- using join;
-- HOW can i find the orders placed by Boy George?;

--1. one way is to use sub queries;
SELECT * FROM orders
WHERE customer_id = (
  SELECT id FROM customers
  WHERE lname = "George"
);
/*
+----+---------------------+--------+-------------+
| id | orderDate           | amount | customer_id |
+----+---------------------+--------+-------------+
|  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
|  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
+----+---------------------+--------+-------------+
*/
-- another way is to use join...But first let's do a simple "cross join";
-- join is just combing tables together in meaningful manners;

-- CROSS JOIN; this takes evry possible combination;
SELECT * FROM customers, orders;
-- check readme for results.;


--implicit inner join;
SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;
-- explicit inner join;
SELECT * FROM customers
JOIN orders
  ON customers.id = orders.customer_id;

