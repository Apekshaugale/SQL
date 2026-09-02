/*
Write a query to create the doctor table and the patient table.

Doctor table
doctor_id → number, primary key
doctor_name → varchar, mandatory
specialization → varchar
consultation_fee → number, should be between 500 and 5000
Patient table
pid → number, primary key
pname → varchar, mandatory
mobile_no → number, exactly 10 digits
dob → date
doctor_id → same as doctor_id of doctor table, foreign key
*/

CREATE TABLE DOCTOR(
    DOCTOR_ID NUMBER PRIMARY KEY,
    DOCTOR_NAME VARCHAR(20) NOT NULL ,
    SPECILIZATION VARCHAR(20),
    CONSULTATION_FEE NUMBER CHECK(500<=CONSULTATION_FEE) CHECK(CONSULTATION_FEE<=5000)
     
);
 
CREATE TABLE PATIENT(
    PID NUMBER PRIMARY KEY,
    PNAME VARCHAR(20) NOT NULL ,
    MOBILE_NO NUMBER CHECK(LENGTH(MOBILE_NO)=10),
    DOB DATE,
    DOCTOR_ID NUMBER ,
    CONSTRAINT PATIENT FOREIGN KEY(DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID)
);