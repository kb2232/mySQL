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
  ```SQL
    SELECT * FROM customers, orders
    WHERE customers
    id = orders.customer_id;
  ```
  - 
    -  A ={ 2,3,f,5}; B={2,f,6,7}
    - they only match at {2,f}
    - implicit inner join; OUTPUT BELOW
  
  ```
      +----+--------+---------+------------------+----+---------------------+--------+-------------+
    |  1 | Boy    | George  | george@gmail.com |  1 | 2016-02-10 00:00:00 |  99.99 |           1 |
    |  1 | Boy    | George  | george@gmail.com |  2 | 2017-11-11 00:00:00 |  35.50 |           1 |
    |  2 | George | Michael | gm@gmail.com     |  3 | 2014-12-12 00:00:00 | 800.67 |           2 |
    |  2 | George | Michael | gm@gmail.com     |  4 | 2015-01-03 00:00:00 |  12.50 |           2 |
    |  5 | Bette  | Davis   | bette@aol.com    |  5 | 1999-04-11 00:00:00 | 450.25 |           5 |
    |  5 | Bette  | Davis   | bette@aol.com    |  7 | 2016-03-10 00:00:00 | 199.99 |           5 |
    +----+--------+---------+------------------+----+---------------------+--------+-------------+
  ```

  3. explicit inner join; what they have in common
  - 
  ```SQL
      SELECT * FROM customers
      INNER JOIN orders
      ON customers.id = orders.customer_id;
  ```
  - more complex queries
  ```sql
      SELECT fname, lname, email, 
      SUM(amount) AS 'total_spent' FROM customers
      INNER JOIN orders
      ON customers.id = orders.customer_id
      GROUP BY orders.customer_id
      ORDER BY total_spent
      DESC;
  ```

  4. LEFT JOIN and RIGHT JOIN
    - LEFT JOIN; take everything from customers and what both customers and orders have in common;
    - right join; take everything from ORDERS and what both customers and orders have in common;
  ```SQL
      SELECT * FROM customers
      LEFT JOIN orders
      ON customers.id = orders.customer_id;

      SELECT 
        fname, 
        lname,
        IFNULL(SUM(amount),0) AS 'total_spent'
      FROM customers
      LEFT JOIN orders
      ON customers.id = orders.customer_id
      GROUP BY customers.id
      ORDER BY total_spent
      DESC;

      SELECT * FROM customers
      RIGHT JOIN orders
      ON customers.id = orders.customer_id;
  ```
# SECTION 13 - MANY TO MANY
  - TABLE setup
  ```sql
      CREATE TABLE reviewers (
      id INT AUTO_INCREMENT PRIMARY KEY,
      fname VARCHAR(128),
      lname VARCHAR(128)
    );
    CREATE TABLE series (
      id INT AUTO_INCREMENT PRIMARY KEY,
      title VARCHAR(128),
      r_year YEAR(4),
      genre VARCHAR(128)
    );

    CREATE TABLE reviews (
      id INT AUTO_INCREMENT PRIMARY KEY,
      rating DECIMAL(2,1),
      series_id INT,
      reviewer_id INT,
      FOREIGN KEY(series_id) REFERENCES series(id),
      FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
    );
    -- check file for actual data and problem to solve;
    -- solution to first challenge is below;
    SELECT title, rating, series_id FROM series
    INNER JOIN reviews
    ON series.id = reviews.series_id
    WHERE title 
    IN ("Archer","Arrested Development","Bob's Burgers");
    -- challenge 2. show all title along with their respective average ratings.;
    -- SOLUTION below;
    SELECT title, AVG(rating)
    FROM series
    INNER JOIN reviews
    ON series.id = reviews.series_id
    GROUP BY series.id
    ORDER BY AVG(rating);
    -- challenge 3. show all first name and last name and rating;
    SELECT fname, lname, rating
    FROM reviewers
    INNER JOIN reviews
    ON reviewers.id = reviews.reviewer_id
    WHERE fname
    IN ("Thomas","Wyatt","Kimbra");
  ```
# section 14 - instagram clone
  * users information
  ```sql
    CREATE TABLE users
    (
      id INT AUTO_INCREMENT PRIMARY KEY,
      username VARCHAR(255) UNIQUE NOT NULL,
      createdAt TIMESTAMP DEFAULT NOW()
    );
    -- username has to be unique and cannot be repeated;
  ```
  * photos information
  ```sql
  CREATE TABLE photo(
  id INT AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  user_id INTEGER NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id)
  );
  SHOW TABLES;
  SHOW COLUMNS FROM photo;
  INSERT INTO photo(image_url,user_id)
  VALUES ("/asktwewe",2),("/kulfdfssdf",2),("/ssfsdsf",1),("/dfdsdsgs",3);

  SELECT * FROM photo;

  -- show the images created by each user;
  SELECT username, image_url
  FROM users
  INNER JOIN photo
  ON users.id = photo.user_id;
  ```
  * comments information
  ```SQL
  -- comments schema;
  CREATE TABLE comments(
  id INT AUTO_INCREMENT PRIMARY KEY,
  commentText VARCHAR(255) NOT NULL,
  photo_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photo(id)
  );
  SHOW TABLES;
  SHOW COLUMNS FROM comments;
  INSERT INTO comments(commentText,photo_id,user_id)
  VALUES ("nice pic",2,2),("you look old",1,2),("wow",2,1),("this is nice",3,3),("ok",4,1);

  SELECT * FROM comments;
```
  * follow schema information
  ```sql
  -- followers schema;
  -- this is a one-way relationship;
  -- one user follows another, the other does not have to follow back;
  -- a user cannot follow himself.;
  -- ALSO no duplication follow;
  -- this does not prevent you from following youself;
  CREATE TABLE follow(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(follower_id) REFERENCES users(id),
  FOREIGN KEY(followee_id) REFERENCES users(id),
  PRIMARY KEY(follower_id, followee_id)
  );
  SHOW TABLES;
  INSERT INTO follow(follower_id,followee_id)
  VALUES (1,2),(1,3),(3,1),(2,1);
  SELECT * FROM follow;
  ```
  * hashtag information
  ```sql
  CREATE TABLE hashtags(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tagname VARCHAR(125) NOT NULL UNIQUE,
  createdAT TIMESTAMP DEFAULT NOW()
  );
  CREATE TABLE photoTag(
  photo_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL,
  FOREIGN KEY(photo_id) REFERENCES photo(id),
  FOREIGN KEY(tag_id) REFERENCES hashtags(id),
  PRIMARY KEY(photo_id, tag_id)
);
```