/*
CRUD:
CREATE
READ
UPDATE
DELETE

--creat
//CREATE:
>>INSERT INTO nameofTable(colume_name1, colume_name2, colume_name3, ...) values(...),(...),(...)...;

//READ:
>>SELECT * FROM tableName;

//READ -> the WHERE clause
>>SELECT * FROM tableName WHERE colume_name = ...;
//READ -> Aliases (specify how to display)
>>SELECT colume_name AS anotherName FROM tableName;

/////UPDATE (we made mistake or we need to reset password)
>>UPDATE tableName SET colume_name='newName' WHERE colume_name='oldName';
//example
>>UPDATE people2 SET fname="Jack"
WHERE fname = "Jery";

//delete:
>>DROP DATABASE databaseName;
>>DROP TABLE tableName;//deletes table and content
>>DELETE FROM tableName WHERE colume_name='..'
******WARNING********
>>DELETE FROM tableName; //deletes ALL entry
*/


-- lets Show, create and select the database sec5;
-- run script below: source section5.sql
SHOW DATABASES;
CREATE DATABASE sec5;
USE sec5;

-- let us create the table below and insert the following values;

CREATE TABLE books
(
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(100),
  author_Fname VARCHAR(100),
  author_Lname VARCHAR(100),
  released_year INT,
  stock_quantity INT,
  pages INT,
  PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_Fname, author_Lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


-- Writing Queries;
-- select the whole table and make it fit unto screen;
SELECT title, 
author_Fname AS "fname",
author_Lname AS "lname",
released_year AS "Ryr",
stock_quantity AS "quan", pages
FROM books;

-- write the query to select just the stock quantity;
SELECT stock_quantity 
FROM books;

-- count them;
SELECT COUNT(stock_quantity)
AS "total"
FROM books;

-- select rows where released year is 2003
SELECT * FROM books
WHERE released_year = 2003;

-- select the first name and pages;
SELECT author_Fname, pages
FROM books;

-- select the first name and pages where first name = neil or raymond;
SELECT author_Fname
As "fnam", pages
FROM books
WHERE author_Fname = "Neil" 
OR author_Fname = "Raymond";

-- Change first name "Neil" to "Derek"
UPDATE books
SET author_Fname = "Derek"
WHERE author_Fname = "Neil";

-- count how many derek names "should be three"; count how many first names you have
-- "should be 0";

SELECT COUNT(author_Fname) 
AS "fname = 'Derek'"
FROM books
WHERE author_Fname = "Derek";

SELECT COUNT(author_Fname) 
AS "fname = 'Neil'"
FROM books
WHERE author_Fname = "Neil";

-- GO TO THE socialAPP database, then delete the tweets table enitrely;
SHOW DATABASES;
USE socialAPP;
DROP TABLE tweets;