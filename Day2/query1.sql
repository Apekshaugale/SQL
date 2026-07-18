--deeelete table
DROP TABLE IF EXISTS users;

--create table
CREATE TABLE  users (
user_id INT PRIMARY KEY,---primary key does not allow duplicate user id so we use it.
name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
age INTEGER CHECK (age >= 18), --purple color are constraint in the code
reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP );

--step2
SELECT *FROM users;

---inserting data into table
INSERT INTO users (user_id, name, email, age) 
VALUES (1, 'John Doe', 'john.doe@example.com', 25);--ahter running this run step2

INSERT INTO users (user_id, name, email, age) 
VALUES (2, 'John Doe', 'john.de@example.com', 25);