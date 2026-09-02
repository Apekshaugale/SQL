/*
Department & Employee ⭐

Write a query to create the department table and the employee table.

Department table
did → number, primary key
dname → varchar, mandatory and unique
location → varchar
budget → number, should be greater than 50000
Employee table
eid → number, primary key
ename → varchar, mandatory
salary → number, should be greater than 10000
joining_date → date
did → same as did of department table, foreign key

*/
CREATE TABLE DEPT(
    DID NUMBER PRIMARY KEY,
    DNAME VARCHAR(15) NOT NULL UNIQUE,
    LOCATION VARCHAR(18),
    BUDGET NUMBER CHECK(BUDGET>50000)
);



--Table DEPT created.--

--Elapsed: 00:00:00.019--

CREATE TABLE EMP(
    EID NUMBER PRIMARY KEY,
    ENAME VARCHAR(30) NOT NULL ,
    SALARY NUMBER CHECK(SALARY>10000),
    JOININGDATE DATE,
    DID NUMBER,
    CONSTRAINT DEPT_EMP FOREIGN KEY(DID) REFERENCES DEPT(DID)
);