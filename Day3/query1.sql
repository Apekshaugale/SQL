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
 SET age=26
 WHERE user_id=1;

 SELECT *FROM users;

 --when we run this command our order of table cahnges after modification in it .so 
 --for that we are use below query
 SELECT * FROM users ORDER BY user_id ASC;--what oder you want ASC OR DSC you can cange(ORDER BY is used for odered )
---make changes according to city
 UPDATE users
 SET city='Shegaon'
 WHERE age>=26;

 SELECT * FROM users ORDER BY user_id ASC;


 --at a time two updation are possible
 UPDATE users
 SET  age=31,city='Pune'
 WHERE email='aarav.sharma@gmail.com';

 SELECT * FROM users ORDER BY user_id ASC;
 
--update the mail

 UPDATE users
 SET  email='aarav.sharma@yahoo.com'
 WHERE email='aarav.sharma@gmail.com';

 --use LIKE 
 UPDATE users
 SET age=age+1
 WHERE email LIKE '%@yahoo.com';---%is used that it will check 1st that condition @yahoo.com
 SELECT * FROM users ORDER BY user_id ASC;

 --delete command 
 DELETE FROM users WHERE user_id=6;
 