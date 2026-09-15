CREATE TABLE Pat
(
    Patient_ID VARCHAR(10) PRIMARY KEY,
    Patient_Name VARCHAR(30),
    DOB DATE,
    Gender VARCHAR(10),
    Phone NUMBER CHECK(LENGTH(Phone)=10),
    Blood_Group VARCHAR(5)
);
INSERT INTO Pat VALUES('P01','Aarav Sharma','15-JAN-1998','Male',9876543210,'A+');
INSERT INTO Pat VALUES('P02','Priya Patil','22-MAR-2000','Female',9876543211,'B+');
INSERT INTO Pat VALUES('P03','Rahul Deshmukh','10-JUL-1995','Male',9876543212,'O+');
INSERT INTO Pat VALUES('P04','Sneha Joshi','05-SEP-1999','Female',9876543213,'AB+');
INSERT INTO Pat VALUES('P05','Vikram More','18-NOV-1992','Male',9876543214,'O-');

select *from Pat;

INSERT INTO Pat VALUES('P06','Riya Sharma','10-FEB-2000','Female',9876543215,'A+');

INSERT INTO Pat VALUES('P01','Test Patient','10-FEB-2000','Male',9876543216,'B+');

rollback;
DELETE FROM Pat
WHERE Patient_ID = 'P01';
rollback;
alter table pat drop column BLOOD_GROUP;
rollback;
FLASHBACK table Pat to before drop;
INSERT INTO Pat VALUES('P08','Riya Sharma','10-FEB-2000','Female',9876543217);
select *from Pat;
rollback;
select *from Pat;