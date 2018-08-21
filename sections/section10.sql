-- -->CHAR(n): it has a fixed length - every input would have n length no more!!!
-- //examples are: state abbreviations (NY, NJ, etc..), gender, Y/N
-- -->VARCHAR(n): variable length;

-- -->NUMBERS
-- 1. INT : works with whole numbers;

-- 2. DECIMAL(n, m): (precision is awesome)
-- n - total number of digits
-- m - total number after digits;

-- 3. FLOAT and DOUBLE - store larger numbers using less space
-- - it comes in the cost of precision
-- float : after 7 digits precision is lost (4 bytes)
-- double : after 15 digits precision is lost (8 bytes);

-- 1. DATE: format is 'YYYY-MM-DD'
-- 2. TIME: format is 'HH:MM:SS'
-- 3. DATETIME: format is 'YYYY-MM-DD HH:MM:SS';ss;
SHOW DATABASES;
USE bamazon;
SHOW TABLES;

CREATE TABLE people (
  name VARCHAR(100),
  birthDATE DATE,
  birthTIME TIME,
  birthDAY DATETIME
);
INSERT INTO people 
(name, birthdate, birthtime, birthday)
VALUES 
('Padma','1983-11-11','10:07:35','1983-11-11 10:07:35'),
('Larry','1943-12-25','04:10:42','1943-12-25 04:10:42');

SELECT * FROM people;

INSERT INTO people 
(name, birthdate, birthtime, birthday)
VALUES 
('Microwave',CURDATE(), CURTIME(), NOW());

/*give the actual date*/
SELECT DAY(birthDATE) 
FROM people;

-- print out current time;
SELECT CURTIME();

-- print out current date;
SELECT CURDATE();

-- Day name;
SELECT DAY(CURDATE());
SELECT DAYNAME(CURDATE());

-- FORMATTING;
SELECT DATE_FORMAT(NOW(),'%W %M %Y') AS 'today';
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y')
AS 'today';


SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

/*
create a tweets table
that stores 
- tweet content
- a username
- time it was created
*/
CREATE TABLE tweets(
  Tcontent VARCHAR(100),
  username VARCHAR(100),
  create_at TIMESTAMP DEFAULT NOW()
);
INSERT INTO tweets(Tcontent,username)
VALUES ("this sucks","kbmoneymaker"),
("omg so cool","notmayn45t");