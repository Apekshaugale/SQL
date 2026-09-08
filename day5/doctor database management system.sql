
Doctor Database management system.
Tables:
• Patients
  · Patient_ID (PK)
  · Patient_Name
  · DOB
  · Gender
  · Phone
• Doctors
  · Doctor_ID (PK)
  · Doctor_Name
  · Specialization
  · License_No
  · Department
• Visits
  · Visit_ID (PK)
  · Patient_ID (FK)
  · Doctor_ID (FK)
  · Visit_Date
  · Visit_Type
  · Diagnosis
• Lab_Tests
  · Test_ID (PK)
  · Test_Name
  · Category
  · Reference_Range
  · Price
• Lab_Orders
  · Order_ID (PK)
  · Visit_ID (FK)
  · Test_ID (FK)
  · Ordered_Date
  · Result_Value
  · Result_Status
• Medications
  · Medication_ID (PK)
  · Visit_ID (FK)
  · Medicine_Name
  · Dosage
  · Frequency
  · Duration_Days
Relationships:
· Patients can be associated with multiple visits records (one-to-many).
· Doctors can be associated with multiple visits records (one-to-many).
· Visits can be associated with multiple lab_orders records (one-to-many).
· Visits can be associated with multiple medications records (one-to-many).
*/

CREATE TABLE Patients
(
 Patient_ID VARCHAR(10) PRIMARY KEY,
   Patient_Name VARCHAR(30),
   DOB DATE,
   Gender VARCHAR(10),

   Phone NUMBER CHECK(LENGTH(Phone)=10)

);
INSERT INTO Patients VALUES('P01','Aarav Sharma','15-JAN-1998','Male',9876543210);
INSERT INTO Patients VALUES('P02','Priya Patil','22-MAR-2000','Female',9876543211);
INSERT INTO Patients VALUES('P03','Rahul Deshmukh','10-JUL-1995','Male',9876543212);
INSERT INTO Patients VALUES('P04','Sneha Joshi','05-SEP-1999','Female',9876543213);
INSERT INTO Patients VALUES('P05','Vikram More','18-NOV-1992','Male',9876543214);
SELECT * FROM Patients;

CREATE TABLE  Doctors
(
Doctor_ID  VARCHAR(10) PRIMARY KEY,
Doctor_Name VARCHAR(20),
Specialization VARCHAR(10),
License_No VARCHAR(20),
Department VARCHAR(30)

);
INSERT INTO Doctors VALUES('D01','Dr. Amit Kulkarni','Cardiology','LIC001','Cardiology');
INSERT INTO Doctors VALUES('D02','Dr. Neha Shah','Neurology','LIC002','Neurology');
INSERT INTO Doctors VALUES('D03','Dr. Raj Mehta','Orthopedic','LIC003','Orthopedics');
INSERT INTO Doctors VALUES('D04','Dr. Pooja Rao','Dermatology','LIC004','Dermatology');
INSERT INTO Doctors VALUES('D05','Dr. Kiran Patil','Pediatrics','LIC005','Pediatrics');
SELECT * FROM Doctors;

CREATE TABLE Visits(
   Visit_ID  VARCHAR(10) PRIMARY KEY,
   Patient_ID VARCHAR(10),
   Doctor_ID VARCHAR(10),
   Visit_Date DATE ,
   Visit_Type VARCHAR(20),
   Diagnosis VARCHAR(20),
CONSTRAINT PID FOREIGN KEY(Patient_ID)REFERENCES Patients(Patient_ID),
CONSTRAINT DID FOREIGN KEY(Doctor_ID)REFERENCES Doctors(Doctor_ID)
);
INSERT INTO Lab_Tests VALUES('T01','Blood Sugar','Blood',100,300);
INSERT INTO Lab_Tests VALUES('T02','Hemoglobin','Blood',15,250);
INSERT INTO Lab_Tests VALUES('T03','Cholesterol','Blood',200,500);
INSERT INTO Lab_Tests VALUES('T04','Vitamin B12','Vitamin',900,700);
INSERT INTO Lab_Tests VALUES('T05','Creatinine','Kidney',1,400);
SELECT *FROM Lab_Tests;

CREATE TABLE Lab_Tests(
 Test_ID VARCHAR(10) PRIMARY KEY ,
   Test_Name VARCHAR(20),
   Category VARCHAR(10),
   Reference_Range NUMBER,

   Price NUMBER CHECK(Price>0)

);
INSERT INTO Visits VALUES('V01','P01','D01','01-JAN-2026','Consultation','Chest Pain');
INSERT INTO Visits VALUES('V02','P02','D02','03-JAN-2026','Consultation','Headache');
INSERT INTO Visits VALUES('V03','P03','D03','05-JAN-2026','Follow-up','Knee Pain');
INSERT INTO Visits VALUES('V04','P04','D04','07-JAN-2026','Consultation','Skin Allergy');
INSERT INTO Visits VALUES('V05','P05','D05','09-JAN-2026','Consultation','Fever');
INSERT INTO Visits VALUES('V06','P01','D01','12-JAN-2026','Follow-up','High BP');
INSERT INTO Visits VALUES('V07','P02','D02','15-JAN-2026','Follow-up','Migraine');
INSERT INTO Visits VALUES('V08','P03','D03','18-JAN-2026','Consultation','Back Pain');
INSERT INTO Visits VALUES('V09','P04','D04','20-JAN-2026','Follow-up','Rash');
INSERT INTO Visits VALUES('V10','P05','D05','22-JAN-2026','Follow-up','Cold');
INSERT INTO Visits VALUES('V11','P01','D01','25-JAN-2026','Consultation','Heart Pain');
INSERT INTO Visits VALUES('V12','P03','D03','27-JAN-2026','Follow-up','Joint Pain');
INSERT INTO Visits VALUES('V13','P04','D04','29-JAN-2026','Consultation','Acne');
SELECT *FROM Visits;

CREATE TABLE Lab_Orders(
    Order_ID VARCHAR(10) PRIMARY KEY,
    Visit_ID VARCHAR(10),
    Test_ID VARCHAR(10),
    Ordered_Date DATE,
    Result_Value NUMBER,
    Result_Status VARCHAR(20),
    CONSTRAINT VI_D FOREIGN KEY(Visit_ID) REFERENCES Visits(Visit_ID),
    CONSTRAINT T_ID FOREIGN KEY(Test_ID) REFERENCES Lab_Tests(Test_ID)
);
INSERT INTO Lab_Orders VALUES('O01','V01','T01','01-JAN-2026',95,'Normal');
INSERT INTO Lab_Orders VALUES('O02','V02','T02','03-JAN-2026',13,'Normal');
INSERT INTO Lab_Orders VALUES('O03','V03','T03','05-JAN-2026',210,'High');
INSERT INTO Lab_Orders VALUES('O04','V04','T04','07-JAN-2026',850,'Normal');
INSERT INTO Lab_Orders VALUES('O05','V05','T05','09-JAN-2026',1,'Normal');
INSERT INTO Lab_Orders VALUES('O06','V06','T01','12-JAN-2026',110,'High');
INSERT INTO Lab_Orders VALUES('O07','V07','T02','15-JAN-2026',12,'Low');
INSERT INTO Lab_Orders VALUES('O08','V08','T03','18-JAN-2026',180,'Normal');
INSERT INTO Lab_Orders VALUES('O09','V09','T04','20-JAN-2026',750,'Low');
INSERT INTO Lab_Orders VALUES('O10','V10','T05','22-JAN-2026',2,'High');
INSERT INTO Lab_Orders VALUES('O11','V11','T01','25-JAN-2026',99,'Normal');
INSERT INTO Lab_Orders VALUES('O12','V12','T03','27-JAN-2026',190,'Normal');
INSERT INTO Lab_Orders VALUES('O13','V13','T04','29-JAN-2026',920,'High');
SELECT *FROM Lab_Orders;

CREATE TABLE Medications(
    Medication_ID VARCHAR(10) PRIMARY KEY,
    Visit_ID VARCHAR(10),
    Medicine_Name VARCHAR(30),
    Dosage VARCHAR(20),
    Frequency VARCHAR(20),
    Duration_Days NUMBER,
    CONSTRAINT VID1 FOREIGN KEY(Visit_ID) REFERENCES Visits(Visit_ID)
);
INSERT INTO Medications VALUES('M01','V01','Aspirin','75 mg','Once Daily',7);
INSERT INTO Medications VALUES('M02','V02','Paracetamol','500 mg','Twice Daily',5);
INSERT INTO Medications VALUES('M03','V03','Ibuprofen','400 mg','Twice Daily',7);
INSERT INTO Medications VALUES('M04','V04','Cetirizine','10 mg','Once Daily',5);
INSERT INTO Medications VALUES('M05','V05','Paracetamol','500 mg','Twice Daily',3);
INSERT INTO Medications VALUES('M06','V06','Amlodipine','5 mg','Once Daily',30);
INSERT INTO Medications VALUES('M07','V07','Sumatriptan','50 mg','Once Daily',5);
INSERT INTO Medications VALUES('M08','V08','Diclofenac','50 mg','Twice Daily',7);
INSERT INTO Medications VALUES('M09','V09','Cetirizine','10 mg','Once Daily',7);
INSERT INTO Medications VALUES('M10','V10','Paracetamol','500 mg','Twice Daily',5);
INSERT INTO Medications VALUES('M11','V11','Aspirin','75 mg','Once Daily',15);
INSERT INTO Medications VALUES('M12','V12','Ibuprofen','400 mg','Twice Daily',7);
INSERT INTO Medications VALUES('M13','V13','Clindamycin','300 mg','Twice Daily',10);
SELECT *FROM Medications;