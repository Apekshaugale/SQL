--deeelete table
DROP TABLE IF EXISTS users;

--create table
CREATE TABLE IF NOT EXISTS users (
user_id SERIAL PRIMARY KEY,---primary key does not allow duplicate user id so we use it.
username VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
age INT, --purple color are constraint in the code
city VARCHAR(50) );

--step2
SELECT *FROM users;

---inserting data into table
INSERT INTO users (username, email, age, city)
VALUES
('Aarav Sharma', 'aarav.sharma@gmail.com', 24, 'Mumbai'),
('Priya Patil', 'priya.patil@gmail.com', 22, 'Pune'),
('Rahul Verma', 'rahul.verma@gmail.com', 27, 'Delhi'),
('Sneha Kulkarni', 'sneha.kulkarni@gmail.com', 23, 'Nagpur'),
('Karan Mehta', 'karan.mehta@gmail.com', 29, 'Ahmedabad'),
('Neha Joshi', 'neha.joshi@gmail.com', 25, 'Nashik'),
('Rohan Deshmukh', 'rohan.deshmukh@gmail.com', 30, 'Hyderabad'),
('Pooja Nair', 'pooja.nair@gmail.com', 21, 'Bengaluru'),
('Vikram Singh', 'vikram.singh@gmail.com', 28, 'Jaipur'),
('Anjali Gupta', 'anjali.gupta@gmail.com', 26, 'Indore');



--* is used to slect all .

--to seee perticular column
SELECT user_id,username,city from users;

--when you want to update data i.e to chnage data
 UPDATE users
 SET ag