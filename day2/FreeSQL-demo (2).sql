/*
Write a query to create the course table and the student table 

cousre table=
1.cid number primary key
2.cname  varchar
3.fee varchar num -ve <=5000
4.duration num

student table=
1.sid name 
2.sname varchar
3.mno num check(len)=10
4.dob date
5.cid same as cname varchar foreign key
*/

CREATE TABLE COURSE
(
    CID NUMBER PRIMARY KEY,
    CNAME VARCHAR(10),
    FEES NUMBER CHECK(FEES>0)  CHECK(FEES<=50000),
    DURATION NUMBER
);

CREATE TABLE STUDENTS
(
    SID NUMBER,
    SNAME VARCHAR(30),
    MNO NUMBER CHECK(LENGTH(MNO)=10),
    DOB DATE,
    CID NUMBER,
    CONSTRAINT STUD FOREIGN KEY(CID) REFERENCES COURSE(CID)
);