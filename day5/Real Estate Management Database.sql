/*Real Estate Management Database
Description: Design a practical relational database to manage real estate management data and business operations.
Tables:
• Owners
  · Owner_ID (PK)
  · Owner_Name
  · Phone
  · Email
• Properties
  · Property_ID (PK)
  · Owner_ID (FK)
  · Property_Type
  · Address
  · Area_SqFt
  · Market_Value
• Listings
  · Listing_ID (PK)
  · Property_ID (FK)
  · Listing_Date
  · Asking_Price
  · Listing_Status
• Agents
  · Agent_ID (PK)
  · Agent_Name
  · Phone
  · License_No
  · Agency
• Property_Agents
  · Assignment_ID (PK)
  · Listing_ID (FK)
  · Agent_ID (FK)
  · Assigned_Date
  · Commission_Percent
• Transactions
  · Transaction_ID (PK)
  · Listing_ID (FK)
  · Buyer_Name
  · Transaction_Date
  · Final_Price
  · Status
  Relationships:
· Owners can be associated with multiple properties records (one-to-many).
· Listings can be associated with multiple property_agents records (one-to-many).
· Agents can be associated with multiple property_agents records (one-to-many).
· Listings can be associated with multiple transactions records (one-to-many).

*/

/*PARENT TABLE */
CREATE TABLE Owners1
(
  Owner_ID VARCHAR(10) PRIMARY KEY, 
   Owner_Name VARCHAR(20),
   Phone NUMBER CHECK(LENGTH(Phone)=10),
   Email VARCHAR(20) UNIQUE
 
);
INSERT INTO Owners1 VALUES ('O01','Rajesh Patil',9876543210,'rajesh@gmail.com');
INSERT INTO Owners1 VALUES ('O02','Suresh Shinde',9876543211,'suresh@gmail.com');
INSERT INTO Owners1 VALUES ('O03','Amit Deshmukh',9876543212,'amit@gmail.com');
INSERT INTO Owners1 VALUES ('O04','Vijay Pawar',9876543213,'vijay@gmail.com');
INSERT INTO Owners1 VALUES ('O05','Mahesh Jadhav',9876543214,'mahesh@gmail.com');

SELECT *FROM Owners1;

CREATE TABLE Properties
(
  Property_ID VARCHAR(10)PRIMARY KEY,
  Owner_ID VARCHAR(10),
  Property_Type VARCHAR(10),
  Addres VARCHAR2(200),
  Area_SqFt NUMBER,
  Market_Value NUMBER,
  CONSTRAINT O1_ID FOREIGN KEY (Owner_ID)REFERENCES Owners1(Owner_ID)

);
INSERT INTO Properties VALUES ('P01','O01','House','Pune, Maharashtra',1200,7500000);
INSERT INTO Properties VALUES ('P02','O01','Flat','Mumbai, Maharashtra',850,9500000);
INSERT INTO Properties VALUES ('P03','O01','Shop','Nashik, Maharashtra',600,4200000);
INSERT INTO Properties VALUES ('P04','O02','House','Nashik, Maharashtra',1500,6800000);
INSERT INTO Properties VALUES ('P05','O02','Plot','Pune, Maharashtra',2000,5500000);
INSERT INTO Properties VALUES ('P06','O02','Flat','Nagpur, Maharashtra',1100,6200000);
INSERT INTO Properties VALUES ('P07','O03','House','Amravati, Maharashtra',1350,4800000);
INSERT INTO Properties VALUES ('P08','O03','Shop','Amravati, Maharashtra',500,3500000);
INSERT INTO Properties VALUES ('P09','O03','Plot','Akola, Maharashtra',1800,3900000);
INSERT INTO Properties VALUES ('P10','O04','Flat','Satara, Maharashtra',950,5100000);
INSERT INTO Properties VALUES ('P11','O04','House','Satara, Maharashtra',1600,7200000);
INSERT INTO Properties VALUES ('P12','O04','Shop','Kolhapur, Maharashtra',700,4600000);
INSERT INTO Properties VALUES ('P13','O05','Plot','Kolhapur, Maharashtra',2500,6000000);
INSERT INTO Properties VALUES ('P14','O05','Flat','Pune, Maharashtra',1000,8500000);
INSERT INTO Properties VALUES ('P15','O05','House','Sangli, Maharashtra',1400,5800000);

SELECT *FROM Properties;


CREATE TABLE  Listings(
  Listing_ID VARCHAR(10) PRIMARY KEY ,
  Property_ID VARCHAR(10),
  Listing_Date DATE,
  Asking_Price NUMBER CHECK(Asking_Price>0),
  Listing_Status VARCHAR(20),
CONSTRAINT PY_ID FOREIGN KEY (Property_ID)REFERENCES Properties(Property_ID)
);
INSERT INTO Listings VALUES ('L01','P01','01-JAN-2025',7800000,'Active');
INSERT INTO Listings VALUES ('L02','P02','05-JAN-2025',9800000,'Active');
INSERT INTO Listings VALUES ('L03','P03','10-JAN-2025',4500000,'Sold');
INSERT INTO Listings VALUES ('L04','P04','15-JAN-2025',7000000,'Active');
INSERT INTO Listings VALUES ('L05','P05','20-JAN-2025',5700000,'Active');
INSERT INTO Listings VALUES ('L06','P06','25-JAN-2025',6500000,'Sold');
INSERT INTO Listings VALUES ('L07','P07','01-FEB-2025',5000000,'Active');
INSERT INTO Listings VALUES ('L08','P08','05-FEB-2025',3700000,'Active');
INSERT INTO Listings VALUES ('L09','P09','10-FEB-2025',4100000,'Active');
INSERT INTO Listings VALUES ('L10','P10','15-FEB-2025',5300000,'Sold');
INSERT INTO Listings VALUES ('L11','P11','20-FEB-2025',7500000,'Active');
INSERT INTO Listings VALUES ('L12','P12','25-FEB-2025',4800000,'Active');
INSERT INTO Listings VALUES ('L13','P13','01-MAR-2025',6300000,'Active');
INSERT INTO Listings VALUES ('L14','P14','05-MAR-2025',8800000,'Sold');
INSERT INTO Listings VALUES ('L15','P15','10-MAR-2025',6000000,'Active');
SELECT *FROM Listings;

CREATE TABLE Agents
(
 Agent_ID  VARCHAR(10) PRIMARY KEY ,
   Agent_Name VARCHAR(20),
   Phone NUMBER CHECK (LENGTH(Phone)=10),
   License_No VARCHAR(15),
   
    Agency VARCHAR(20)

);
INSERT INTO Agents VALUES ('A01','Rohan Kulkarni',9876500001,'LIC001','ABC Realty');
INSERT INTO Agents VALUES ('A02','Sneha Joshi',9876500002,'LIC002','Prime Estate');
INSERT INTO Agents VALUES ('A03','Aakash Patil',9876500003,'LIC003','City Homes');
INSERT INTO Agents VALUES ('A04','Neha Deshmukh',9876500004,'LIC004','ABC Realty');
INSERT INTO Agents VALUES ('A05','Rahul Pawar',9876500005,'LIC005','Prime Estate');
INSERT INTO Agents VALUES ('A06','Pooja Shinde',9876500006,'LIC006','City Homes');
INSERT INTO Agents VALUES ('A07','Kunal Jadhav',9876500007,'LIC007','Dream Properties');
INSERT INTO Agents VALUES ('A08','Priya More',9876500008,'LIC008','ABC Realty');
INSERT INTO Agents VALUES ('A09','Sagar Chavan',9876500009,'LIC009','Prime Estate');
INSERT INTO Agents VALUES ('A10','Anjali Patil',9876500010,'LIC010','City Homes');
INSERT INTO Agents VALUES ('A11','Vivek Pawar',9876500011,'LIC011','Dream Properties');
INSERT INTO Agents VALUES ('A12','Riya Kulkarni',9876500012,'LIC012','ABC Realty');
INSERT INTO Agents VALUES ('A13','Nikhil Shinde',9876500013,'LIC013','Prime Estate');
INSERT INTO Agents VALUES ('A14','Kavita More',9876500014,'LIC014','City Homes');
INSERT INTO Agents VALUES ('A15','Om Deshmukh',9876500015,'LIC015','Dream Properties');
SELECT *FROM Agents;

CREATE TABLE  Property_Agents
(
 Assignment_ID  VARCHAR(10) PRIMARY KEY,
   Listing_ID VARCHAR(10),
   Agent_ID VARCHAR(10),
   Assigned_Date DATE ,
   Commission_Percent NUMBER ,
CONSTRAINT LG_ID FOREIGN KEY (Listing_ID)REFERENCES Listings
(Listing_ID),
CONSTRAINT AT_ID FOREIGN KEY (Agent_ID)REFERENCES Agents
(Agent_ID)
);
INSERT INTO Property_Agents VALUES ('AS01','L01','A01','02-JAN-2025',2.5);
INSERT INTO Property_Agents VALUES ('AS02','L02','A02','06-JAN-2025',3.0);
INSERT INTO Property_Agents VALUES ('AS03','L03','A03','11-JAN-2025',2.0);
INSERT INTO Property_Agents VALUES ('AS04','L04','A04','16-JAN-2025',2.5);
INSERT INTO Property_Agents VALUES ('AS05','L05','A05','21-JAN-2025',3.0);
INSERT INTO Property_Agents VALUES ('AS06','L06','A06','26-JAN-2025',2.0);
INSERT INTO Property_Agents VALUES ('AS07','L07','A07','02-FEB-2025',2.5);
INSERT INTO Property_Agents VALUES ('AS08','L08','A08','06-FEB-2025',3.0);
INSERT INTO Property_Agents VALUES ('AS09','L09','A09','11-FEB-2025',2.5);
INSERT INTO Property_Agents VALUES ('AS10','L10','A10','16-FEB-2025',2.0);
INSERT INTO Property_Agents VALUES ('AS11','L11','A11','21-FEB-2025',3.0);
INSERT INTO Property_Agents VALUES ('AS12','L12','A12','26-FEB-2025',2.5);
INSERT INTO Property_Agents VALUES ('AS13','L13','A13','02-MAR-2025',3.0);
INSERT INTO Property_Agents VALUES ('AS14','L14','A14','06-MAR-2025',2.0);
INSERT INTO Property_Agents VALUES ('AS15','L15','A15','11-MAR-2025',2.5);
SELECT *FROM Property_Agents;

CREATE TABLE Transactions
(
 Transaction_ID VARCHAR(20) PRIMARY KEY  ,
   Listing_ID VARCHAR(10),
   Buyer_Name VARCHAR(20),
   Transaction_Date DATE ,
   Final_Price NUMBER CHECK (Final_Price>0),
   Statuss VARCHAR(20),
  CONSTRAINT LG1_ID FOREIGN KEY (Listing_ID)REFERENCES Listings
(Listing_ID)
);
INSERT INTO Transactions VALUES ('T01','L01','Amit Sharma','15-FEB-2025',7600000,'Completed');
INSERT INTO Transactions VALUES ('T02','L02','Priya Mehta','20-FEB-2025',9600000,'Completed');
INSERT INTO Transactions VALUES ('T03','L03','Rahul Verma','25-FEB-2025',4400000,'Completed');
INSERT INTO Transactions VALUES ('T04','L04','Sneha Patil','05-MAR-2025',6900000,'Completed');
INSERT INTO Transactions VALUES ('T05','L05','Kiran Joshi','10-MAR-2025',5600000,'Completed');
INSERT INTO Transactions VALUES ('T06','L06','Vikas Shah','15-MAR-2025',6400000,'Completed');
INSERT INTO Transactions VALUES ('T07','L07','Neha Sharma','20-MAR-2025',4900000,'Completed');
INSERT INTO Transactions VALUES ('T08','L08','Rohit Mehta','25-MAR-2025',3600000,'Completed');
INSERT INTO Transactions VALUES ('T09','L09','Pankaj Patil','01-APR-2025',4000000,'Completed');
INSERT INTO Transactions VALUES ('T10','L10','Anjali Joshi','05-APR-2025',5200000,'Completed');
INSERT INTO Transactions VALUES ('T11','L11','Suresh Verma','10-APR-2025',7400000,'Completed');
INSERT INTO Transactions VALUES ('T12','L12','Manoj Shah','15-APR-2025',4700000,'Completed');
INSERT INTO Transactions VALUES ('T13','L13','Deepak Patil','20-APR-2025',6200000,'Completed');
INSERT INTO Transactions VALUES ('T14','L14','Pooja Mehta','25-APR-2025',8700000,'Completed');
INSERT INTO Transactions VALUES ('T15','L15','Ganesh Sharma','30-APR-2025',5900000,'Completed');
SELECT *FROM Transactions;