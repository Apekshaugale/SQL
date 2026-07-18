SELECT * FROM employee;

INSERT INTO employee(name,position,department,hire_date,salary)
 VALUES('Ajit Saha','Data Analyst','Computer','2022-05-13',65000.00),
 ('Amit Saha','HR Manager','Human Resources','2019-05-13',82000.00),
 ('Sushil Wagh','Software Engineer','IT','2023-02-15',55000.00),
 ('Giriraj Saha','Data scientist','DS','2016-05-14',65000.00),
 ('Lekha Bhavnagre','Data Analyst','Computer','2023-05-11',65000.00);

--delete the data
TRUNCATE TABLE employee;

 TRUNCATE TABLE employee RESTART IDENTITY;
 ---if you using serial data type then use restart identities to get proper sequence of serial number