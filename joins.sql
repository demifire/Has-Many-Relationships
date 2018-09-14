--Create a query to get all fields from the users table

SELECT * FROM users;

-- Returned 50k 944 ms

--Create a query to get all fields from the posts table where the user_id is 100

SELECT * FROM posts WHERE user_id = 100;

--Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200

SELECT posts.*, users.first_name, users.last_name
FROM posts
LEFT JOIN users ON posts.user_id = users.id
WHERE users.id = '200';

-- Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

SELECT posts.*, users.username
FROM posts
LEFT JOIN users ON posts.user_id = users.id
WHERE users.first_name='Norene' AND users.last_name = 'Schmitt';