/*Project 1: Student Management System Database
Manage students, courses, trainers, batches, exams, and fee records.
Tables:
Students
• Student_ID (PK)
• Student_Name
• Phone_Number
• Email
• City
Courses
• Course_ID (PK)
• Course_Name
• Duration_Months
• Fees
Trainers
• Trainer_ID (PK)
• Trainer_Name
• Specialization
Batches
• Batch_ID (PK)
• Course_ID (FK)
• Trainer_ID (FK)
Enrollments
• Enrollment_ID (PK)
• Student_ID (FK)
• Batch_ID (FK)
Fees
• Payment_ID (PK)
• Student_ID (FK)
• Amount
Exams
• Exam_ID (PK)
• Student_ID (FK)
• Course_ID (FK)
Relationships:
• A course can have multiple batches (one-to-many).
• A trainer can handle multiple batches (one-to-many).
• A student can enroll in multiple batches (one-to-many).
*/

CREATE TABLE STUDENT(
    Student_ID  VARCHAR(12) PRIMARY KEY,
    Student_Name VARCHAR(20),
    Phone_Number NUMBER CHECK(LENGTH(Phone_Number)=10),
    Email VARCHAR(20),
    CITY VARCHAR(20)

);

SELECT * FROM STUDENT;
INSERT INTO STUDENT VALUES('S01','SHRUTI',8883254888,'shruti@gmail.com','hydrabad');
INSERT INTO STUDENT VALUES('S02','POOJA',8883254454,'pooja@gmail.com','PUNE');
INSERT INTO STUDENT VALUES('S03','RUTUJA',9353254888,'rutujs@gmail.com','BANGOLRE');
INSERT INTO STUDENT VALUES('S04','SHREE',9767254888,'shr@gmail.com','DELHI');
INSERT INTO STUDENT VALUES('S05','DEEP',6482254888,'deep@gmail.com','NAGPUR');

SELECT * FROM STUDENT ORDER BY STUDENT_ID;
COMMIT;



CREATE TABLE Courses(
    Course_ID VARCHAR(20) ,
    Course_Name VARCHAR(30),
    Duration_Months NUMBER ,
    FEES NUMBER CHECK(FEES>0)
);

ALTER TABLE Courses
ADD CONSTRAINT COURSE_PK PRIMARY KEY (Course_ID);

SELECT * FROM Courses;
INSERT INTO Courses VALUES('PYTHO-12','PYTHON',8,45000);
INSERT INTO Courses VALUES('HTML-03','HTML',4,5000);
INSERT INTO Courses VALUES('CSS-045','CSS',2,3000);
INSERT INTO Courses VALUES('SQL-30','SQL',6,3500);
INSERT INTO Courses VALUES('JAVA-32','JAVA',8,55000);


CREATE TABLE Trainers(
    Trainer_ID VARCHAR(10) PRIMARY KEY,
    Trainer_Name VARCHAR(20),
    Specialization VARCHAR(20)      
);

SELECT * FROM Trainers;
INSERT INTO Trainers VALUES('P-12','PRABHU','PYTHON');
INSERT INTO Trainers VALUES('H-03','PRASAD','HTML');
INSERT INTO Trainers VALUES('C-45','PRASAD','CSS');
INSERT INTO Trainers VALUES('S-30','SHANKAR','SQL');
INSERT INTO Trainers VALUES('J-32','TEJAS','JAVA');


CREATE TABLE Batches(
     Batch_ID  VARCHAR(20) PRIMARY KEY,
     Course_ID VARCHAR(20),
     Trainer_ID VARCHAR(10),
     CONSTRAINT CID FOREIGN KEY(Course_ID) REFERENCES Courses(Course_ID),
     CONSTRAINT TID FOREIGN KEY(Trainer_ID) REFERENCES Trainers(Trainer_ID)
);
SELECT * FROM Batches;
INSERT INTO Batches VALUES('B01','PYTHO-12','P-12');
INSERT INTO Batches VALUES('B02','HTML-03','H-03');

INSERT INTO Batches VALUES('B03','CSS-045','C-45');

INSERT INTO Batches VALUES('BO4','SQL-30','S-30');
INSERT INTO Batches VALUES('BO5','JAVA-32','J-32');

SELECT * FROM Trainers
ORDER BY Trainer_ID;


CREATE TABLE Enrollments(
     Enrollment_ID VARCHAR(10) PRIMARY KEY,
     Student_ID VARCHAR(12),
     Batch_ID VARCHAR(20),
     CONSTRAINT SID FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID),
     CONSTRAINT BID FOREIGN KEY(Batch_ID) REFERENCES Batches(Batch_ID)
);

SELECT * FROM Enrollments;
INSERT INTO Enrollments VALUES('EO1','S01','B01');
INSERT INTO Enrollments VALUES('EO2','S03','B02');
INSERT INTO Enrollments VALUES('EO3','S04','BO4');
INSERT INTO Enrollments VALUES('E04','S02','BO4');
INSERT INTO Enrollments VALUES('EO5','S05','BO4');


  CREATE TABLE Fees(
         Payment_ID VARCHAR(12) PRIMARY KEY,
         Student_ID VARCHAR(12),
         Amount NUMBER ,
         CONSTRAINT SID1 FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID)
  );

  SELECT *FROM FEES;
  INSERT INTO FEES VALUES('MA8080909','S01',48552);
    INSERT INTO FEES VALUES('MFH90908','S02',33550);
  INSERT INTO FEES VALUES('MA80809809','S03',40500);
  INSERT INTO FEES VALUES('MUO0080909','S05',4000);
  INSERT INTO FEES VALUES('MA89080909','S04',48000);


CREATE TABLE Exams(
  Exam_ID VARCHAR(20) PRIMARY KEY,
  Student_ID VARCHAR(12),
  Course_ID VARCHAR(20) ,
  CONSTRAINT STD2 FOREIGN KEY (Student_ID)  REFERENCES STUDENT(Student_ID),
  CONSTRAINT CID1 FOREIGN KEY (Course_ID)  REFERENCES Courses(Course_ID)
  
);
SELECT * FROM Exams;
INSERT INTO Exams VALUES('S-2024','S01','PYTHO-12');
INSERT INTO Exams VALUES('S-2022','S03','HTML-03');
INSERT INTO Exams VALUES('W-2026','S05','CSS-045');
INSERT INTO Exams VALUES('W-2025','S02','SQL-30');
INSERT INTO Exams VALUES('S-2023','S04','JAVA-32');