-- source section4.sql;
SHOW DATABASES;
-- From the list of database you have - simply select the socialAPP;
-- make sure you put a semicolon after your comments or you will get errors;
USE socialAPP;
SHOW TABLES;
SHOW COLUMNS FROM tweets;
 
INSERT INTO tweets(tweets, favorites)
VALUES ("money",10),
       ("food",11);
-- to view our table;
SELECT * FROM tweets;

-- notice that the tweet content is empty and we did not insert a value into it.
-- this is because we left everything as null - we did not specify that it had
-- to be NOT NULL. We also did not specify a default value.;

-- let us add more content into all the values;

INSERT INTO tweets()
VALUES ("money","i love a whole lot of money", 200),
       ("food","i do not like to eat too much", 150);

SELECT * FROM tweets;


-- view favorites only;
SELECT favorites
FROM tweets;

-- view favorites as "fav" - changing the alias name;
SELECT favorites
AS "fav"
FROM tweets;

-- at this point, you have probably have duplicated information. This is fine.
-- we will learn how to remove duplicates in later section;

-- Define employers;
CREATE TABLE employers (
  id INT NOT NULL AUTO_INCREMENT,
  lname VARCHAR(180) NOT NULL,
  fname VARCHAR(180) NOT NULL,
  Mname VARCHAR(180),
  age INT NOT NULL,
  curr_status VARCHAR(100) DEFAULT "employed",
  PRIMARY KEY (id)
);

SHOW TABLES;
SHOW COLUMNS FROM employers;