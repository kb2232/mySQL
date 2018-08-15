# mySQL

# Installation

1.  First You need to download mysql or simply use cloud 9
2.  On Cloud9:
    >> mysql-ctl start

    >> mysql-ctl cli

    >> mysql-ctl stop

3.  If you have downloaded mysql - then
    >> export PATH=${PATH}:/usr/local/mysql/bin/

    >> mysql -u {user} -p {password};

# section 3 (filename: section3.sql)
  * In this section, you will be able:
  - writing scripts and running them from command line:
  >> source name-of-file.sql

  - Creating, Showing and Deleting Databases
  - creating and deleting tables
# section 4 (fileanmeL section4.sql)
  * In this section you will be:
  - inserting values into your table created in section 3
  - view all data in table
  - view only specific values
  - creating alias with column names
  - using not null and auto increment
# section 5 (filename section5.sql)
  - CRUD commands
  - CREATE TABLE tablename
  - INSERT INTO tablename()
  - UPDATE tableName SET colume_name='newName' WHERE colume_name='oldName'
  - DROP TABLE tablename;
# section 6 (filename section6.sql)
  - CRUD Challenge
# section7 ( book data)
  - creating book data
  - using string functions on book data
  - CONCAT, CONCAT_WS
  - SUBSTRING
  - REPLACE
  - REVERSE
  - CHAR_LENGTH
  - UPPER()
  - LOWER()
# section 8 (refining selections)
  - DISTINCT
  - ORDER BY - sorting - ascending by defaults
  - LIMIT
  - LIKE
  - wildcards
# section 9 (aggregate functions)
  - count function
  - GROUP BY
  - MIN and MAX
  - MIN, MAX and GROUP BY
  - SUM function
  - AVG
# section 10 (time)
  - DATE
  - TIME
  - DATETIME
  - curdate()
  - curtime()
  - now()
  - formatting time and date
# section 11 (logical operators)
  - !=
  - =
  - LIKE NOT LIKE
  - AND OR
  - BETWEEN
  - IN
  - less than or greater than
  - IF ELSE
  - if else if
# section 12 (one to many)-relationships and joins - real world data is messy
- 1 to 1 relationship
- 1 to many relationship
- using foreign keys
```sql
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
```
# Section 12 - JOIN
  0. A ={ 2,3,f,5}; B={2,f,6,7}
  1. CROSS JOIN. = {2,3,f,5,2,f,6,7}
     - think of the question below
  ```sql
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
  ```

-- another way is to use join...But first let's do a simple "cross join";
-- join is just combing tables together in meaningful manners;

 >> SELECT * FROM customers, orders;

* that is the result below;This is basically useless...It's multiplying....This is the most basic join.
```
+----+--------+---------+------------------+----+---------------------+--------+-------------+
| id | fname  | lname   | email            | id | orderDate           | amount | customer_id |
+----+--------+---------+------------------+----+---------------------+--------+-------------+
|  1 | Boy    | George  | george@gmail.com |  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
|  2 | George | Michael | gm@gmail.com     |  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
|  3 | David  | Bowie   | david@gmail.com  |  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
|  4 | Blue   | Steele  | blue@gmail.com   |  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
|  5 | Bette  | Davis   | bette@aol.com    |  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
|  1 | Boy    | George  | george@gmail.com |  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
|  2 | George | Michael | gm@gmail.com     |  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
|  3 | David  | Bowie   | david@gmail.com  |  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
|  4 | Blue   | Steele  | blue@gmail.com   |  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
|  5 | Bette  | Davis   | bette@aol.com    |  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
|  1 | Boy    | George  | george@gmail.com |  3 | 2014-12-12 00:00:00 | 800.67 |           2 |
|  2 | George | Michael | gm@gmail.com     |  3 | 2014-12-12 00:00:00 | 800.67 |           2 |
|  3 | David  | Bowie   | david@gmail.com  |  3 | 2014-12-12 00:00:00 | 800.67 |           2 |
|  4 | Blue   | Steele  | blue@gmail.com   |  3 | 2014-12-12 00:00:00 | 800.67 |           2 |
|  5 | Bette  | Davis   | bette@aol.com    |  3 | 2014-12-12 00:00:00 | 800.67 |           2 |
|  1 | Boy    | George  | george@gmail.com |  4 | 2015-01-03 00:00:00 |  12.50 |           2 |
|  2 | George | Michael | gm@gmail.com     |  4 | 2015-01-03 00:00:00 |  12.50 |           2 |
|  3 | David  | Bowie   | david@gmail.com  |  4 | 2015-01-03 00:00:00 |  12.50 |           2 |
|  4 | Blue   | Steele  | blue@gmail.com   |  4 | 2015-01-03 00:00:00 |  12.50 |           2 |
|  5 | Bette  | Davis   | bette@aol.com    |  4 | 2015-01-03 00:00:00 |  12.50 |           2 |
|  1 | Boy    | George  | george@gmail.com |  5 | 1999-04-11 00:00:00 | 450.25 |           5 |
|  2 | George | Michael | gm@gmail.com     |  5 | 1999-04-11 00:00:00 | 450.25 |           5 |
|  3 | David  | Bowie   | david@gmail.com  |  5 | 1999-04-11 00:00:00 | 450.25 |           5 |
|  4 | Blue   | Steele  | blue@gmail.com   |  5 | 1999-04-11 00:00:00 | 450.25 |           5 |
|  5 | Bette  | Davis   | bette@aol.com    |  5 | 1999-04-11 00:00:00 | 450.25 |           5 |
|  1 | Boy    | George  | george@gmail.com |  7 | 2016-03-10 00:00:00 | 199.99 |           5 |
|  2 | George | Michael | gm@gmail.com     |  7 | 2016-03-10 00:00:00 | 199.99 |           5 |
|  3 | David  | Bowie   | david@gmail.com  |  7 | 2016-03-10 00:00:00 | 199.99 |           5 |
|  4 | Blue   | Steele  | blue@gmail.com   |  7 | 2016-03-10 00:00:00 | 199.99 |           5 |
|  5 | Bette  | Davis   | bette@aol.com    |  7 | 2016-03-10 00:00:00 | 199.99 |           5 |
+----+--------+---------+------------------+----+---------------------+--------+-------------+
```
  2. implicit INNER JOIN - join them where they match;
    -  A ={ 2,3,f,5}; B={2,f,6,7}
    - they only match at {2,f}
    
    --implicit inner join;
    SELECT * FROM customers, orders
    WHERE customers
    id = orders.customer_id;
      +----+--------+---------+------------------+----+---------------------+--------+-------------+
    |  1 | Boy    | George  | george@gmail.com |  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
    |  1 | Boy    | George  | george@gmail.com |  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
    |  2 | George | Michael | gm@gmail.com     |  3 | 2014-12-12 00:00:00 | 800.67 |           2 |
    |  2 | George | Michael | gm@gmail.com     |  4 | 2015-01-03 00:00:00 |  12.50 |           2 |
    |  5 | Bette  | Davis   | bette@aol.com    |  5 | 1999-04-11 00:00:00 | 450.25 |           5 |
    |  5 | Bette  | Davis   | bette@aol.com    |  7 | 2016-03-10 00:00:00 | 199.99 |           5 |
    +----+--------+---------+------------------+----+---------------------+--------+-------------+

  3. explicit inner join;
