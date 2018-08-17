
-- relationships to discuss:
-- - users
-- - comments
-- - photos
-- - likes
-- - hashtags
-- - followers;
-- user schema;

-- username must be unique, no one should be able to use same username;
-- also username cannot be null;
-- we need to know the time user's sign up;
-- the above is just to test - never do this;

DROP DATABASE ig_clone;
SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS ig_clone;

USE ig_clone;

CREATE TABLE users
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW()
);
SHOW TABLES;
INSERT INTO users(username)
VALUES ("kmoney123"),("fightforwomen"),("obama4presidentAgain");
SELECT * FROM users;
-- comments schema;

-- photos schema;

-- likes schema;

-- hashtags schema;

-- followers schema;