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

CREATE TABLE Courses(
    Course_ID VARCHAR(20) ,
    Course_Name VARCHAR(30),
    Duration_Months NUMBER ,
    FEES NUMBER CHECK(FEES>0)
);

ALTER TABLE Courses
ADD CONSTRAINT COURSE_PK PRIMARY KEY (Course_ID);

CREATE TABLE Trainers(
    Trainer_ID VARCHAR(10) PRIMARY KEY,
    Trainer_Name VARCHAR(20),
    Specialization VARCHAR(20)      
);

CREATE TABLE Batches(
     Batch_ID  VARCHAR(20) PRIMARY KEY,
     Course_ID VARCHAR(20),
     Trainer_ID VARCHAR(10),
     CONSTRAINT CID FOREIGN KEY(Course_ID) REFERENCES Courses(Course_ID),
     CONSTRAINT TID FOREIGN KEY(Trainer_ID) REFERENCES Trainers(Trainer_ID)
);

CREATE TABLE Enrollments(
     Enrollment_ID VARCHAR(10) PRIMARY KEY,
     Student_ID VARCHAR(12),
     Batch_ID VARCHAR(20),
     CONSTRAINT SID FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID),
     CONSTRAINT BID FOREIGN KEY(Batch_ID) REFERENCES Batches(Batch_ID)
);

  CREATE TABLE Fees(
         Payment_ID VARCHAR(12) PRIMARY KEY,
         Student_ID VARCHAR(12),
         Amount NUMBER ,
         CONSTRAINT SID1 FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID)
  );

CREATE TABLE Exams(
  Exam_ID VARCHAR(20) PRIMARY KEY,
  Student_ID VARCHAR(12),
  Course_ID VARCHAR(20) ,
  CONSTRAINT STD2 FOREIGN KEY (Student_ID)  REFERENCES STUDENT(Student_ID),
  CONSTRAINT CID1 FOREIGN KEY (Course_ID)  REFERENCES Courses(Course_ID)
  
);