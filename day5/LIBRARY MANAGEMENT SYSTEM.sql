/*Project 3
Library Management System Database
Description: Design a practical relational database to manage library management data and business operations.
Tables:
• Members
 · Member_ID (PK)
  · Member_Name
  · Phone
  · Email
  · Join_Date
• Books
  · Book_ID (PK)
  · Title
  · ISBN
  · Author_Name
  · Category
  · Published_Year
  · Shelf_Code
• Book_Copies
  · Copy_ID (PK)
  · Book_ID (FK)
  · Acquisition_Date
  · Copy_Status
• Loans
  · Loan_ID (PK)
  · Member_ID (FK)
  · Copy_ID (FK)
  · Issue_Date
  · Due_Date
  · Return_Date
• Authors
  · Author_ID (PK)
  · Author_Name
  · Country
  · Birth_Year
• Fines
  · Fine_ID (PK)
  · Loan_ID (FK)
  · Fine_Amount
  · Paid_Date
  · Payment_Status
Relationships:
· Books can be associated with multiple book_copies records (one-to-many).
· Members can be associated with multiple loans records (one-to-many).
· Loans can be associated with multiple fines records (one-to-many).
*/

/*PARENT TABLE=5*/
CREATE TABLE Members
(
    Member_ID  VARCHAR(10) PRIMARY KEY,
    Member_Name VARCHAR(20) ,
    Phone NUMBER CHECK (LENGTH(Phone)=10),
    EMAIL VARCHAR(20),
    Join_Date DATE 

);

INSERT INTO  Members VALUES('M01','SHRUTI',9782453216,'shruti@gmail.com',sysdate);
INSERT INTO  Members VALUES('M02','RUTUJA',9784444216,'rutuja@gmail.com',sysdate);
INSERT INTO  Members VALUES('M03','POOJA',9782451212,'pooja@gmail.com',sysdate);
INSERT INTO  Members VALUES('M04','BHAKTI',9782497821,'bhakti@gmail.com',sysdate);
INSERT INTO  Members VALUES('M05','DIPTI',9782495321,'dipti@gmail.com',sysdate);

select * from Members;
/*PARENT TABLE=5*/

CREATE TABLE Books(
    Book_ID NUMBER PRIMARY KEY,
    Titles VARCHAR(20),
    ISBN NUMBER,
    Author_Name VARCHAR(30),
    Category VARCHAR(20),
    Published_Year NUMBER,
    Shelf_Code NUMBER


);

INSERT INTO Books VALUES(01,'The Hobbit',12345678201865,'J.R.R. Tolkien','Fantasy',1937,4563);
INSERT INTO Books VALUES(02,'Dracula',12348875701865,'Bram Stoker','Horror',1981,4541);
INSERT INTO Books VALUES(03,'ATOMIC HABIT',123456782472581,'HEELO','Fantasy',1995,1534);
INSERT INTO Books VALUES(04,'The Alchemist',1234567889451,'Paulo Coelho','Fiction',1955,8647);
INSERT INTO Books VALUES(05,'Beloved',12345678288896,'Toni Morrison','Historical Fiction',1922,9574);


/*CHILD TABLE=15*/
CREATE TABLE Book_Copies(
    Copy_ID  VARCHAR(10) PRIMARY KEY,
    Book_ID NUMBER,
    Acquisition_Date DATE,
    Copy_Status VARCHAR(20),
    CONSTRAINT B1_FK FOREIGN KEY(Book_ID) REFERENCES  Books(Book_ID)

);

INSERT INTO Book_Copies VALUES('C01',01,'01-FEB-2024','AVAILABLE');
INSERT INTO Book_Copies VALUES('C02',02,'28-FEB-2026','NOT AVAILABLE');
INSERT INTO Book_Copies VALUES('C03',01,'01-APR-2025','AVAILABLE');
INSERT INTO Book_Copies VALUES('C04',04,'12-JAN-2024','NOT AVAILABLE');
INSERT INTO Book_Copies VALUES('C05',03,'01-FEB-2021','NOT AVAILABLE');
INSERT INTO Book_Copies VALUES('C06',05,'11-APR-2021','AVAILABLE');
INSERT INTO Book_Copies VALUES('C07',02,'10-JUN-2024','NOT AVAILABLE');
INSERT INTO Book_Copies VALUES('C08',04,'01-MAR-2024','AVAILABLE');
INSERT INTO Book_Copies VALUES('C09',03,'05-DEC-2024','NOT AVAILABLE');
INSERT INTO Book_Copies VALUES('C10',02,'19-SEP-2024','AVAILABLE');
INSERT INTO Book_Copies VALUES('C11',05,'20-JUL-2024','AVAILABLE');
INSERT INTO Book_Copies VALUES('C12',04,'21-MAY-2024','NOT AVAILABLE');
INSERT INTO Book_Copies VALUES('C13',03,'31-DEC-2022','AVAILABLE');
INSERT INTO Book_Copies VALUES('C14',02,'01-FEB-2021',' NOT AVAILABLE');
INSERT INTO Book_Copies VALUES('C15',01,'01-AUG-2024','AVAILABLE');

SELECT *FROM Book_Copies;

/*CHILD TABLE*/
CREATE TABLE Loans(
    Loan_ID VARCHAR(20) PRIMARY KEY,
    Member_ID VARCHAR(10),
    Copy_ID  VARCHAR(10),
    Issue_Date DATE,
    Due_Date DATE,
    Return_Date DATE,
    CONSTRAINT M1_ID FOREIGN KEY (Member_ID)REFERENCES Members(Member_ID),
    CONSTRAINT C1_ID FOREIGN KEY(Copy_ID)REFERENCES Book_Copies(Copy_ID)


);

INSERT INTO Loans VALUES('LN01','M01','C01','01-FEB-2024','07-FEB-2024','09-FEB-2024');
INSERT INTO Loans VALUES('LN02','M02','C02','28-FEB-2026','03-MAR-2026','02-MAR-2026');
INSERT INTO Loans VALUES('LN03','M03','C03','01-APR-2025','07-APR-2025','04-APR-2025');
INSERT INTO Loans VALUES('LN04','M04','C04','12-JAN-2024','18-JAN-2024','18-JAN-2024');
INSERT INTO Loans VALUES('LN05','M05','C05','01-FEB-2021','06-FEB-2021','10-FEB-2021');
INSERT INTO Loans VALUES('LN06','M03','C06','11-APR-2021','18-APR-2021','24-APR-2021');
INSERT INTO Loans VALUES('LN07','M02','C07','10-JUN-2024','17-JUN-2024','15-JUN-2024');
INSERT INTO Loans VALUES('LN08','M04','C08','01-MAR-2024','07-MAR-2024','05-MAR-2024');
INSERT INTO Loans VALUES('LN09','M01','C09','05-DEC-2024','12-DEC-2024','10-DEC-2024');
INSERT INTO Loans VALUES('LN10','M05','C10','19-SEP-2024','25-SEP-2024','28-SEP-2024');
INSERT INTO Loans VALUES('LN11','M03','C11','20-JUL-2024','27-JUL-2024','15-AUG-2024');
INSERT INTO Loans VALUES('LN12','M02','C12','21-MAY-2024','26-MAY-2024','24-MAY-2024');
INSERT INTO Loans VALUES('LN13','M01','C13','31-DEC-2022','05-JAN-2023','11-JAN-2023');
INSERT INTO Loans VALUES('LN14','M05','C14','01-FEB-2021','06-FEB-2021','04-FEB-2021');
INSERT INTO Loans VALUES('LN15','M04','C15','01-AUG-2024','06-AUG-2024','10-AUG-2024');

SELECT * FROM Loans;


/*PARENT TABLE=5*/
CREATE TABLE Authors
(
  Author_ID VARCHAR(10) PRIMARY KEY,
  Author_Name VARCHAR(20),
  Country VARCHAR(20),
  Birth_Year VARCHAR(4)

);
INSERT INTO Authors VALUES('AID01','J.R.R. Tolkien','INDIA','1891');
INSERT INTO Authors VALUES('AID02','Bram Stoker','INDIA','1899');
INSERT INTO Authors VALUES('AID03','HEELO','INDIA','1991');
INSERT INTO Authors VALUES('AID05','Paulo Coelho','INDIA','1881');
INSERT INTO Authors VALUES('AID04','Toni Morrison','INDIA','1879');
SELECT *FROM Authors;

/*PARENT TABLE=5*/

CREATE TABLE Fines
(
    Fine_ID VARCHAR(10) PRIMARY KEY,
    Loan_ID VARCHAR(20),
    Fine_Amount VARCHAR(10) CHECK(Fine_Amount>0),
    Paid_Date DATE,
    Payment_Status VARCHAR(10),
    CONSTRAINT L1_ID FOREIGN KEY (Loan_ID)REFERENCES Loans(Loan_ID)

);

INSERT INTO Fines VALUES('F01','LN01',200,SYSDATE,'PAID');
INSERT INTO Fines VALUES('F02','LN05',100,NULL,'UNPAID');
INSERT INTO Fines VALUES('F03','LN06',300,NULL,'UNPAID');
INSERT INTO Fines VALUES('F04','LN10',250,'28-SEP-2024','PAID');
INSERT INTO Fines VALUES('F05','LN13',350,NULL,'UNPAID');
SELECT *FROM Fines;