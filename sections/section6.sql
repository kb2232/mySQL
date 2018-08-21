/*
Run file: source section6.sql
*/

/*
1. create a new database shirts_db
2. create a new table called SHIRTS
shirt_id	article	    color	    shirt_size	last_worn
1	        t-shirt	    white	      S	        10
2	        t-shirt	    green	      S	        200
3	        polo-shirt  black   	  M	        10
4	        tank top    blue	      S	        50
5	        t-shirt	    pink	      S	        0
6	        polo-shirt  red	        M	        5
7	        tan top     white	      S	        200
8	        tank top    blue	      M	        15

3. you can just copy the data below:
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15)

4. add manually the ninth data: Purple polo shirt, size M last worn 50 days ago

    QUERY TASK:
1. Only print out article and color
2. Print out everything except shirt_id
3. Change all polo shirts size to L
4. if last worn is 15 days ago, change it to 0
5. change all white shirts SIZE to "xs" and color to "off white"
6. delete all shirts last worn over 200 days ago
7. delete all tank tops
8. delete all shirts
9. drop the table;
*/

SHOW DATABASES;
CREATE DATABASE shirts_db;
SHOW DATABASES;
USE shirts_db;

CREATE TABLE shirts(
  id INT NOT NULL AUTO_INCREMENT,
  article VARCHAR(100) NOT NULL,
  color VARCHAR(50) NOT NULL,
  shirt_size CHARACTER(1) NOT NULL,
  last_worn INT NOT NULL,
  PRIMARY KEY(id)
);

SHOW TABLES;

INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

-- selecting all values;
SELECT * FROM shirts;

-- 1. Only print out article and color;
SELECT article, color
FROM shirts;
-- 2. Print out everything except shirt_id;
-- i will propse two ways; 
-- recommended;
SELECT article, color, shirt_size, last_worn
FROM shirts;
-- nice and creative but not efficient;
-- a. duplicate table;
CREATE TABLE temp
AS
SELECT * FROM shirts;
-- b. drop columns;
ALTER TABLE temp
DROP article;
ALTER TABLE temp
DROP color;
ALTER TABLE temp
DROP shirt_size;
ALTER TABLE temp
DROP last_worn;

-- 3. Change all polo shirts size to L;
UPDATE shirts
SET shirt_size = "L" 
WHERE article="polo shirt";

SELECT * FROM shirts;

-- 4. if last worn is 15 days ago, change it to 0
-- first i want to see how many is 15 or less;
SELECT *, 
IF(last_worn <= 15, "YES", "NO")
AS "recent"
FROM shirts;

-- now update;
UPDATE shirts
SET last_worn=0
WHERE last_worn=15;

SELECT * FROM shirts;

-- 5. change all white shirts SIZE to "xs" and color to "off white";
UPDATE shirts
SET shirt_size="XS", color="off-white"
WHERE color = "white";
-- notice the above is set such that the earlier shirt_size type to 
-- character(1); Below I show how to update it. It should work now;
ALTER TABLE shirts 
MODIFY shirt_size VARCHAR(3) NOT NULL;

UPDATE shirts
SET shirt_size="XS", color="off-white"
WHERE color = "white";
-- 5b. print out polo shirt rows only;
SELECT * FROM shirts
WHERE article="polo shirt";
-- 6. delete all shirts last worn over 200 days ago;
DELETE FROM shirts
WHERE last_worn >= 200;

SELECT * FROM shirts;

-- 7. delete all tank tops;
DELETE FROM shirts
WHERE article = "tank top";
-- 8. delete all shirts;
DELETE FROM shirts;

