/*Farming Equipment Tracking Database
Description: Design a practical relational database to manage farming equipment tracking data and business operations.
Tables:
• Owners
  · Owner_ID (PK)
  · Owner_Name
  · Phone
  · Farm_Name
  · Village
• Equipment
  · Equipment_ID (PK)
  · Owner_ID (FK)
  · Equipment_Type
  · Brand
  · Model
  · Purchase_Date
  · Status
• Maintenance
  · Maintenance_ID (PK)
  · Equipment_ID (FK)
  · Service_Date
  · Service_Type
  · Cost
  · Next_Due_Date
• Locations
  · Location_ID (PK)
  · Equipment_ID (FK)
  · Latitude
  · Longitude
  · Recorded_At
• Usage_Logs
  · Usage_ID (PK)
  · Equipment_ID (FK)
  · Usage_Date
  · Hours_Used
  · Fuel_Used_Liters
  · Operator_Name
• Insurance
  · Insurance_ID (PK)
  · Equipment_ID (FK)
  · Policy_No
  · Provider
  · Premium
  · Expiry_Date
Relationships:
· Owners can be associated with multiple equipment records (one-to-many).
· Equipment can be associated with multiple maintenance records (one-to-many).
· Equipment can be associated with multiple locations records (one-to-many).
· Equipment can be associated with multiple usage_logs records (one-to-many).
· Equipment can be associated with multiple insurance records (one-to-many).
*/
/*PARENT TABLE*/
CREATE TABLE Owners
(
  Owner_ID  VARCHAR(10)PRIMARY KEY,
  Owner_Name VARCHAR(30),
  Phone NUMBER CHECK(LENGTH(Phone)=10),
  Farm_Name VARCHAR(20),
  Village VARCHAR(20)
  
);

INSERT INTO Owners VALUES ('O01','Rajesh Patil',9876543210,'Patil Farm','Pune');
INSERT INTO Owners VALUES ('O02','Suresh Shinde',9876543211,'Shinde Farm','Nashik');
INSERT INTO Owners VALUES ('O03','Amit Deshmukh',9876543212,'Deshmukh Farm','Amravati');
INSERT INTO Owners VALUES ('O04','Vijay Pawar',9876543213,'Pawar Farm','Satara');
INSERT INTO Owners VALUES ('O05','Mahesh Jadhav',9876543214,'Jadhav Farm','Kolhapur');
SELECT *FROM Owners ;

/*CHILD TABLE*/
CREATE TABLE Equipment(
    Equipment_ID VARCHAR2(10) PRIMARY KEY,
    Owner_ID VARCHAR(10),
    Equipment_Type VARCHAR(20),
    Brand VARCHAR(20),
    Model VARCHAR(20),
    Purchase_Date DATE,
    Status VARCHAR(20),
    CONSTRAINT OR1_ID FOREIGN KEY(Owner_ID)REFERENCES Owners(Owner_ID)

);

SELECT * FROM Equipment;
INSERT INTO Equipment VALUES ('E01','O01','Tractor','Mahindra','575 DI','15-JAN-2022','Active');
INSERT INTO Equipment VALUES ('E02','O01','Cultivator','John Deere','90 HP','20-MAR-2021','Active');
INSERT INTO Equipment VALUES ('E03','O01','Harvester','Kubota','DC-68G','10-JUL-2023','Active');
INSERT INTO Equipment VALUES ('E04','O02','Tractor','Sonalika','DI 750 III','05-FEB-2020','Active');
INSERT INTO Equipment VALUES ('E05','O02','Rotavator','Mahindra','Jumbo 205','18-AUG-2022','Maintenance');
INSERT INTO Equipment VALUES ('E06','O02','Sprayer','KisanKraft','KK-SP20','12-APR-2023','Active');
INSERT INTO Equipment VALUES ('E07','O03','Tractor','New Holland','3630 TX','22-JUN-2021','Active');
INSERT INTO Equipment VALUES ('E08','O03','Plough','Fieldking','FKMDP','30-SEP-2022','Active');
INSERT INTO Equipment VALUES ('E09','O03','Seeder','Mahindra','MSD-200','15-NOV-2023','Active');
INSERT INTO Equipment VALUES ('E10','O04','Tractor','John Deere','5310','08-JAN-2020','Active');
INSERT INTO Equipment VALUES ('E11','O04','Harvester','Kubota','DC-70','25-MAY-2022','Maintenance');
INSERT INTO Equipment VALUES ('E12','O04','Sprayer','KisanKraft','KK-PS16','14-JUL-2023','Active');
INSERT INTO Equipment VALUES ('E13','O05','Tractor','Mahindra','Arjun 605','02-MAR-2021','Active');
INSERT INTO Equipment VALUES ('E14','O05','Rotavator','Fieldking','FKRTMG','19-OCT-2022','Active');
INSERT INTO Equipment VALUES ('E15','O05','Seeder','John Deere','JD-110','11-DEC-2023','Active');


/*CHILD TABLE*/
CREATE TABLE Maintenance(
   Maintenance_ID VARCHAR(20) PRIMARY KEY, 
   Equipment_ID VARCHAR2(10),
   Service_Date DATE,
   Service_Type VARCHAR(20),
   Costs NUMBER CHECK(Costs>0),
   Next_Due_Date DATE ,
   CONSTRAINT EQ_ID FOREIGN KEY (Equipment_ID) REFERENCES Equipment
(Equipment_ID)
);


SELECT * FROM  Maintenance;
INSERT INTO Maintenance VALUES ('M01','E01','10-JAN-2024','Engine Service',5000,'10-JUL-2024');
INSERT INTO Maintenance VALUES ('M02','E02','15-FEB-2024','Oil Change',2500,'15-AUG-2024');
INSERT INTO Maintenance VALUES ('M03','E03','20-MAR-2024','Blade Service',3500,'20-SEP-2024');
INSERT INTO Maintenance VALUES ('M04','E04','05-APR-2024','Engine Service',4500,'05-OCT-2024');
INSERT INTO Maintenance VALUES ('M05','E05','12-APR-2024','Gear Service',3000,'12-OCT-2024');
INSERT INTO Maintenance VALUES ('M06','E06','18-MAY-2024','Pump Service',1800,'18-NOV-2024');
INSERT INTO Maintenance VALUES ('M07','E07','25-MAY-2024','Oil Change',2200,'25-NOV-2024');
INSERT INTO Maintenance VALUES ('M08','E08','02-JUN-2024','Blade Replacement',2800,'02-DEC-2024');
INSERT INTO Maintenance VALUES ('M09','E09','15-JUN-2024','Seeder Service',1900,'15-DEC-2024');
INSERT INTO Maintenance VALUES ('M10','E10','20-JUN-2024','Engine Service',5200,'20-DEC-2024');
INSERT INTO Maintenance VALUES ('M11','E11','05-JUL-2024','Harvester Service',6000,'05-JAN-2025');
INSERT INTO Maintenance VALUES ('M12','E12','15-JUL-2024','Pump Service',1700,'15-JAN-2025');
INSERT INTO Maintenance VALUES ('M13','E13','25-JUL-2024','Oil Change',2400,'25-JAN-2025');
INSERT INTO Maintenance VALUES ('M14','E14','05-AUG-2024','Gear Service',3200,'05-FEB-2025');
INSERT INTO Maintenance VALUES ('M15','E15','15-AUG-2024','Seeder Service',2100,'15-FEB-2025');

/*CHILD TABLE*/
CREATE TABLE  Locations
(   Location_ID  NUMBER PRIMARY KEY ,
    Equipment_ID VARCHAR2(10),
    Latitude  NUMBER ,
    Longitude NUMBER,
    Recorded_At DATE,
    CONSTRAINT EQ1_ID FOREIGN KEY (Equipment_ID) REFERENCES Equipment
(Equipment_ID)

);
SELECT * FROM  Locations;
INSERT INTO Locations VALUES (1,'E01',18.5204000,73.8567000,'01-JAN-2024');
INSERT INTO Locations VALUES (2,'E02',18.5314000,73.8446000,'02-JAN-2024');
INSERT INTO Locations VALUES (3,'E03',18.5074000,73.8077000,'03-JAN-2024');
INSERT INTO Locations VALUES (4,'E04',19.9975000,73.7898000,'04-JAN-2024');
INSERT INTO Locations VALUES (5,'E05',20.0059000,73.7835000,'05-JAN-2024');
INSERT INTO Locations VALUES (6,'E06',20.0110000,73.7900000,'06-JAN-2024');
INSERT INTO Locations VALUES (7,'E07',20.9374000,77.7796000,'07-JAN-2024');
INSERT INTO Locations VALUES (8,'E08',20.9300000,77.7500000,'08-JAN-2024');
INSERT INTO Locations VALUES (9,'E09',20.9500000,77.8000000,'09-JAN-2024');
INSERT INTO Locations VALUES (10,'E10',17.6805000,74.0183000,'10-JAN-2024');
INSERT INTO Locations VALUES (11,'E11',17.6900000,74.0250000,'11-JAN-2024');
INSERT INTO Locations VALUES (12,'E12',17.6700000,74.0100000,'12-JAN-2024');
INSERT INTO Locations VALUES (13,'E13',16.7050000,74.2433000,'13-JAN-2024');
INSERT INTO Locations VALUES (14,'E14',16.7100000,74.2500000,'14-JAN-2024');
INSERT INTO Locations VALUES (15,'E15',16.7000000,74.2350000,'15-JAN-2024');

/*CHILD TABLE*/

CREATE TABLE Usage_Logs(
 Usage_ID VARCHAR(10) PRIMARY KEY,
   Equipment_ID VARCHAR2(10),
   Usage_Date DATE,
   Hours_Used NUMBER ,
   Fuel_Used_Liters NUMBER,
   Operator_Name VARCHAR(20),
   CONSTRAINT EQ2_ID FOREIGN KEY (Equipment_ID) REFERENCES Equipment
(Equipment_ID)

);

SELECT * FROM  Usage_Logs;
INSERT INTO Usage_Logs VALUES ('U01','E01','01-FEB-2024',8,12.5,'Ramesh');
INSERT INTO Usage_Logs VALUES ('U02','E02','02-FEB-2024',6,8.2,'Sanjay');
INSERT INTO Usage_Logs VALUES ('U03','E03','03-FEB-2024',7,15.5,'Ganesh');
INSERT INTO Usage_Logs VALUES ('U04','E04','04-FEB-2024',9,14.2,'Prakash');
INSERT INTO Usage_Logs VALUES ('U05','E05','05-FEB-2024',5,6.5,'Dinesh');
INSERT INTO Usage_Logs VALUES ('U06','E06','06-FEB-2024',4,4.8,'Rohit');
INSERT INTO Usage_Logs VALUES ('U07','E07','07-FEB-2024',8,11.7,'Akash');
INSERT INTO Usage_Logs VALUES ('U08','E08','08-FEB-2024',6,5.5,'Nitin');
INSERT INTO Usage_Logs VALUES ('U09','E09','09-FEB-2024',5,4.2,'Sachin');
INSERT INTO Usage_Logs VALUES ('U10','E10','10-FEB-2024',10,16.8,'Vikas');
INSERT INTO Usage_Logs VALUES ('U11','E11','11-FEB-2024',7,13.5,'Ajay');
INSERT INTO Usage_Logs VALUES ('U12','E12','12-FEB-2024',4,4.5,'Manoj');
INSERT INTO Usage_Logs VALUES ('U13','E13','13-FEB-2024',9,14.7,'Kiran');
INSERT INTO Usage_Logs VALUES ('U14','E14','14-FEB-2024',6,7.2,'Santosh');
INSERT INTO Usage_Logs VALUES ('U15','E15','15-FEB-2024',5,5.8,'Deepak');

/*CHILD TABLE*/
CREATE TABLE  Insurance(
  Insurance_ID VARCHAR(15) PRIMARY KEY,
  Equipment_ID VARCHAR2(10),
  Policy_No NUMBER,
  Provider VARCHAR(20),
  Premium VARCHAR(20),
  Expiry_Date DATE,
CONSTRAINT EQ3_ID FOREIGN KEY (Equipment_ID) REFERENCES Equipment
(Equipment_ID)

);
SELECT *FROM Insurance;
INSERT INTO Insurance VALUES ('I01','E01',100001,'ICICI Lombard','15000','01-JAN-2025');
INSERT INTO Insurance VALUES ('I02','E02',100002,'HDFC Ergo','12000','15-FEB-2025');
INSERT INTO Insurance VALUES ('I03','E03',100003,'Bajaj Allianz','18000','20-MAR-2025');
INSERT INTO Insurance VALUES ('I04','E04',100004,'ICICI Lombard','14000','05-APR-2025');
INSERT INTO Insurance VALUES ('I05','E05',100005,'HDFC Ergo','10000','12-APR-2025');
INSERT INTO Insurance VALUES ('I06','E06',100006,'Bajaj Allianz','8000','18-MAY-2025');
INSERT INTO Insurance VALUES ('I07','E07',100007,'ICICI Lombard','13000','25-MAY-2025');
INSERT INTO Insurance VALUES ('I08','E08',100008,'HDFC Ergo','9000','02-JUN-2025');
INSERT INTO Insurance VALUES ('I09','E09',100009,'Bajaj Allianz','8500','15-JUN-2025');
INSERT INTO Insurance VALUES ('I10','E10',100010,'ICICI Lombard','16000','20-JUN-2025');
INSERT INTO Insurance VALUES ('I11','E11',100011,'HDFC Ergo','19000','05-JUL-2025');
INSERT INTO Insurance VALUES ('I12','E12',100012,'Bajaj Allianz','7500','15-JUL-2025');
INSERT INTO Insurance VALUES ('I13','E13',100013,'ICICI Lombard','14500','25-JUL-2025');
INSERT INTO Insurance VALUES ('I14','E14',100014,'HDFC Ergo','11000','05-AUG-2025');
INSERT INTO Insurance VALUES ('I15','E15',100015,'Bajaj Allianz','9500','15-AUG-2025');