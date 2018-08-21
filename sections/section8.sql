SHOW DATABASES;
USE bamazon;
SHOW TABLES;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- select all in smaller view;
SELECT title,
author_fname AS 'fname',
author_lname AS 'lname',
released_year AS 'ryear',
stock_quantity AS 'quant',
pages
FROM books;
-- USING DISTINCT - it gives unique values - no duplicates;
SELECT DISTINCT title AS 'Unique'
FROM books;
SELECT DISTINCT author_lname
FROM books;
SELECT DISTINCT author_Fname, author_Lname FROM books;
-- using order by;
SELECT DISTINCT author_lname 
FROM books 
ORDER BY author_lname;
-- in descending order;
SELECT DISTINCT author_lname 
FROM books 
ORDER BY author_lname
DESC;
-- using limit n;
SELECT author_Lname
AS 'lname'
FROM books
ORDER BY author_Lname
DESC
LIMIT 3;
-- using limit n,m;
SELECT author_Lname
AS 'lname'
FROM books
ORDER BY author_Lname
DESC
LIMIT 4,5;
-- using like;
SELECT SUBSTRING(title, 1, 10) 
AS 'title', author_Fname
FROM books
WHERE author_Fname
LIKE '%da%';