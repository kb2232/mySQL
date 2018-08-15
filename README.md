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

