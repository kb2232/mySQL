-- relationships to discuss:
-- - users
-- - comments
-- - photos
-- - likes
-- - hashtags
-- - followers;
-------------------------------------------------------------------
DROP DATABASE ig_clone;
SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS ig_clone;

USE ig_clone;
-------------------------------------------------------------------
-- user schema;
-- username must be unique, no one should be able to use same username;
-- also username cannot be null;
-- we need to know the time user's sign up;
-- the above is just to test - never do this;
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

-------------------------------------------------------------------
-- photos schema;
-- we need to match the image to the user who created it - users table;
-- id, image_url, user_id, createdAt;
CREATE TABLE photo(
  id INT AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  user_id INTEGER NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id)
);
SHOW TABLES;
SHOW COLUMNS FROM photo;
INSERT INTO photo(image_url,user_id)
VALUES ("/asktwewe",2),("/kulfdfssdf",2),("/ssfsdsf",1),("/dfdsdsgs",3);

SELECT * FROM photo;

-- show the images created by each user;
SELECT username, image_url
FROM users
INNER JOIN photo
ON users.id = photo.user_id;

-------------------------------------------------------------------
-- comments schema;
CREATE TABLE comments(
  id INT AUTO_INCREMENT PRIMARY KEY,
  commentText VARCHAR(255) NOT NULL,
  photo_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photo(id)
);
SHOW TABLES;
SHOW COLUMNS FROM comments;
INSERT INTO comments(commentText,photo_id,user_id)
VALUES ("nice pic",2,2),("you look old",1,2),("wow",2,1),("this is nice",3,3),("ok",4,1);

SELECT * FROM comments;

-------------------------------------------------------------------
-- likes schema;
-- we need the user that is doing the liking, the photo that the user is liking and the time the user likes the photo.
-- we do not the a id column;
-- to make sure a user does not like twice, check last foreign key;

CREATE TABLE likes(
  user_id INTEGER NOT NULL,
  photo_id INTEGER NOT NULL,
  created_At TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photo(id),
  PRIMARY KEY(user_id, photo_id)
);

SHOW TABLES;
SHOW COLUMNS FROM likes;

INSERT INTO likes (user_id,photo_id)
VALUES (1,2),
(1,1),
(2,3),
(3,1), (2,2),(3,3);

-- if you insert (1,1) again, then it will not work bc user work already liked photo 1 - it will return as duplicate entry;

SELECT * FROM likes;

-------------------------------------------------------------------
-- followers schema;
-- this is a one-way relationship;
-- one user follows another, the other does not have to follow back;
-- a user cannot follow himself.;
-- ALSO no duplication follow;
-- this does not prevent you from following youself;
CREATE TABLE follow(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(follower_id) REFERENCES users(id),
  FOREIGN KEY(followee_id) REFERENCES users(id),
  PRIMARY KEY(follower_id, followee_id)
);
SHOW TABLES;
INSERT INTO follow(follower_id,followee_id)
VALUES (1,2),(1,3),(3,1),(2,1);
SELECT * FROM follow;
-------------------------------------------------------------------;
-- hashtags schema part1;
CREATE TABLE hashtags(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tagname VARCHAR(125) NOT NULL UNIQUE,
  createdAT TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photoTag(
  photo_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL,
  FOREIGN KEY(photo_id) REFERENCES photo(id),
  FOREIGN KEY(tag_id) REFERENCES hashtags(id),
  PRIMARY KEY(photo_id, tag_id)
);

SHOW TABLES;

INSERT INTO hashtags(tagname)
VALUES ("adorable"),
("cute"),
("wow");

SELECT * FROM hashtags;

INSERT INTO photoTag(photo_id,tag_id)
VALUES
(1,1),
(1,2),(2,1),(3,3),(2,3);

SELECT * FROM photoTag;