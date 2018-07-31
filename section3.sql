-- to run this script - open you mysql on the command line:
-- >> mysql -u {user} -p {password};
-- then type "source creatingDatabase.sql";

-- Task: Create a database name socialAPP;
-- 1. Inside the database, 
--   a. create a table name tweets
--   b. the table should have columns:
--    - username (max 15 chars)
--    - tweet content (max 140 charac)
--    - number of favorites



-- CREATE DATABASE socialAPP;
-- SHOW DATABASES;
-- USE socialAPP;

-- to delete this database;
-- >>DROP DATABASE socialAPP;

CREATE TABLE tweets(
  tweets VARCHAR(15),
  tweetContent VARCHAR(140),
  favorites INT
);

--to see all tables in this database;
SHOW TABLES;
SHOW COLUMNS FROM tweets;

-- to delete table;
-- DROP TABLE tweets;