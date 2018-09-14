-- Create a new postgres user named has_many_user

CREATE USER has_many_user;

--Create a new database named has_many_blogs owned by has_many_user
--DROP DATABASE has_many_blogs;

CREATE DATABASE has_many_blogs;
ALTER DATABASE has_many_blogs 
OWNER TO has_many_user;

-- Before each create table statement, add a drop table if exists statement.
-- In has_many_blogs.sql Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the has_many_blogs schema below.
-- Create the necessary FKs needed to relate the tables according to the relationship table below.
-- Run the provided scripts/blog_data.sql

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR (90) NOT NULL,
  first_name VARCHAR (90) NULL DEFAULT NULL,
  last_name VARCHAR (90) NULL DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
  id  SERIAL PRIMARY KEY,
  title VARCHAR (180) NULL DEFAULT NULL,
  url VARCHAR (510) NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  postsUsersID INTEGER REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  body VARCHAR (510) NULL DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  commentsUsersID INTEGER REFERENCES users(id),
  commentsPostsID INTEGER REFERENCES posts(id)
);

ALTER TABLE posts
ADD COLUMN user_id SERIAL NOT NULL;

ALTER TABLE posts
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE comments
ADD COLUMN user_id SERIAL NOT NULL;

ALTER TABLE comments
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE comments
ADD COLUMN posts_id SERIAL NOT NULL;

ALTER TABLE comments
ADD FOREIGN KEY (posts_id) REFERENCES posts(id);