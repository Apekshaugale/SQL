/*
Question 1 — College & Student ⭐

Write a query to create the college table and the student table.

College table
college_id → number, primary key
college_name → varchar, mandatory
location → varchar
established_year → number, should be greater than or equal to 1900
Student table
sid → number, primary key
sname → varchar, mandatory
mobile_no → number, exactly 10 digits
dob → date
college_id → same as college_id of college table, foreign key
*/
CREATE TABLE COLLEGE(
    CID NUMBER PRIMARY KEY,
    CLG_NAME VARCHAR(20) NOT NULL,
    LOCATION VARCHAR(10),
    ESTABLISH_YEAR NUMBER CHECK(ESTABLISH_YEAR>=1900)
);

CREATE TABLE STD(
    SID NUMBER  PRIMARY KEY ,
    SNAME VARCHAR(20) NOT NULL,
    MNO NUMBER CHECK(LENGTH(MNO)=10),
    DOB DATE,
    CID NUMBER ,
    CONSTRAINT std FOREIGN KEY(CID) REFERENCES COLLEGE(CID)
);