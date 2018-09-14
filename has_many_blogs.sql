-- Create a new postgres user named has_many_user

CREATE USER has_many_user;

--Create a new database named has_many_blogs owned by has_many_user
--DROP DATABASE has_many_blogs;

CREATE DATABASE has_many_blogs;
ALTER DATABASE has_many_blogs 
OWNER TO has_many_user;