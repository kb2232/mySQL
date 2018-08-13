-- select all in smaller view;
SELECT title,
author_fname AS 'fname',
author_lname AS 'lname',
released_year AS 'ryear',
stock_quantity AS 'quant',
pages
FROM books;

-- !=;
SELECT released_year
FROM books
WHERE released_year != 2001;

--> NOT LIKE;
SELECT COUNT(SUBSTRING(title,1,15)) AS 'title' FROM books WHERE title LIKE '%W%';
SELECT COUNT(SUBSTRING(title,1,15)) AS 'title' FROM books WHERE title  NOT LIKE '%W%';

-- evaluate;
SELECT 10 != 10;
-- THIS IS false;
SELECT 1 IN (5,3);
-- this is true;
SELECT 1 IN (5,3,2,1);
-- this is true;
SELECT 9 BETWEEN 8 AND 10;
-- select all books written before 1980;
SELECT author_fname
FROM books
WHERE released_year < 1980;
-- select all books written by chabon and eggers;
SELECT title, CONCAT(author_fname," ",author_lname)
FROM books
GROUP BY title, CONCAT(author_fname," ",author_lname);

SELECT released_year
FROM books
WHERE author_lname = "Chabon"
OR author_lname = "Eggers";

-- select all books written by Lahiri published after 2000;
SELECT released_year
FROM books
WHERE author_lname = "Lahiri"
AND released_year > 2000;
-- select all books where page count is between 100-200;
SELECT pages
FROM books
WHERE pages BETWEEN 100 AND 200;

-- SELECT all books where author last name starts with C or S;
SELECT released_year, author_lname
FROM books
WHERE author_lname
LIKE 'C%' OR 
author_lname
LIKE 'S%';
/*
if the title contains "stories" - put "novel";
if the title is "Just Kids" OR "A Heartbreaking Work of Staggering Genius" - put "memoir";
everything else is called a "novel";
*/
SELECT title,
  CASE
    WHEN title LIKE '%Stories%' THEN "short stories"
    WHEN title = "Just Kids" OR title="A Heartbreaking Work of Staggering Genius" THEN "memoir"
    ELSE "novel"
  END AS 'Type'
FROM books;
-- amount of books each author has written;
SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;
