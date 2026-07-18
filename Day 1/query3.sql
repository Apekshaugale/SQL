CREATE DATABASE company;

--serial data type used

CREATE TABLE employee (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
postiion VARCHAR(50),
department VARCHAR(50),
hire_date DATE,
salary NUMERIC (10,2)
);

SELECT * FROM employee;
--deleting table
TRUNCATE TABLE employee;

---now ,we use int data type
-- in this CREATE DATABASE company we are adding ;


--step1(create the table)
CREATE TABLE employee2 (
employee_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
postiion VARCHAR(50),
department VARCHAR(50),
hire_date DATE,
salary NUMERIC (10,2)
);
----step2
SELECT * FROM employee2;

---step3 (Adding data into table)
INSERT INTO employee2(employee_id, name, position, department, hire_date, salary)
VALUES
(101, 'Rohan Patil', 'Software Engineer', 'IT', '2021-08-12', 72000.00),
(102, 'Priya Sharma', 'HR Executive', 'Human Resources', '2020-03-18', 58000.00),
(103, 'Karan Mehta', 'Business Analyst', 'Business', '2022-11-05', 67000.00),
(104, 'Neha Joshi', 'Data Scientist', 'Data Science', '2019-07-22', 91000.00),
(105, 'Vikram Deshmukh', 'Project Manager', 'Management', '2018-01-15', 98000.00),
(106, 'Sneha Kulkarni', 'UI Designer', 'Design', '2023-06-10', 60000.00),
(107, 'Arjun Verma', 'Network Engineer', 'Infrastructure', '2020-09-25', 69000.00),
(108, 'Pooja Nair', 'QA Engineer', 'Testing', '2021-12-01', 62000.00),
(109, 'Rahul Singh', 'Cloud Engineer', 'Cloud', '2022-04-19', 88000.00),
(110, 'Anjali Gupta', 'Finance Executive', 'Finance', '2019-10-30', 64000.00);
---to delete table  all rows
TRUNCATE TABLE employee2;
--i make mistake in name to to correct it mkae this changes
ALTER TABLE employee2
RENAME COLUMN postiion TO position;

--To delete specific row from table 
DELETE FROM employee2
WHERE name='Rohan Patil';--after where we can use any name from elmplyee table which you want to delete  i.e.employee_id='102',position='IT'
---after deletig (step2)run select *from employee to see the chnages in table.
--and you can seee that 101 name is deleted from the table


--Now how to delete specific column the use ALTER and run step2
ALTER TABLE employee2
DROP COLUMN salary; ---to delete table,column,table then we use DROP 

--PERMANENTLY DELETED THE DATA
DROP TABLE IF EXISTS employee3;

----IF YOU WANT TO DLEETE ONLY DATABASE
DROP DATABASE IF EXISTS COMPANY3;

