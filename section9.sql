-- 1. find the distinct authors in the book;
-- 2. how many titles contain "the"?;
-- 3. COUNT how many books each author has written;
-- 4. FIND minimum released year;
-- 5. find the title of the longest book?;
-- 6. FIND the year that each author published their first book;
-- 7. find the longest page count for each author;
-- 8. sum all pages in our database;
-- 9. sum all the pages each author has written
--  10. avg released year across all books;
-- 11. cal. the average stock quantity for books released in the same year;
-- 12. print number of books in the database;
-- 13. print out how many books released in each year;

SHOW DATABASES;
USE bamazon;
SHOW TABLES;


SELECT title,
  author_fname AS 'fname',
  author_lname AS 'lname',
  released_year AS 'ryear',
  stock_quantity AS 'quant',
  pages
FROM books;

-- 1;
SELECT DISTINCT CONCAT(author_fname," ",author_lname)
FROM books;
--2;
SELECT title
FROM books
WHERE title
LIKE "%the%";
-- 3.;
SELECT  author_fname, author_lname, 
COUNT(*) 
AS "written books"
FROM books
GROUP BY author_fname, author_lname;

-- 4;
SELECT MIN(released_year)
FROM books;
SELECT MAX(released_year)
FROM books;

--5; 
SELECT title, pages 
FROM books 
GROUP BY title, pages
ORDER BY pages
DESC
LIMIT 1;
--5;
SELECT title, pages 
FROM books
ORDER BY pages
DESC
LIMIT 1;
-- 5 - ANOTHER solution;
SELECT title, pages
FROM books
WHERE pages = (
  SELECT MAX(pages)
  FROM books
);

-- min and max;
SELECT MIN(released_year), MIN(pages)
FROM books;

--6;
SELECT author_fname, author_lname, MIN(released_year)
FROM books
GROUP BY author_fname, author_lname
ORDER BY MIN(released_year);

--7;
SELECT CONCAT(author_fname," ",author_lname) AS 'author', MAX(pages)
FROM books
GROUP BY CONCAT(author_fname," ",author_lname)
ORDER BY MAX(pages)
DESC;

--8; 
SELECT SUM(pages)
FROM books;
--9; 
SELECT CONCAT(author_fname," ",author_lname) AS 'author', SUM(pages)
FROM books
GROUP BY  CONCAT(author_fname," ",author_lname);

--10;
SELECT AVG(released_year)
FROM books;

--11;
SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year;
--12;
SELECT COUNT(released_year)
AS 'number of books'
FROM books;
--13;
SELECT released_year, COUNT(released_year)
FROM books
GROUP BY released_year;
