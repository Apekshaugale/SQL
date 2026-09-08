/*Project 9
Movie Ticket Booking System Database
Description: Design a practical relational database to manage movie ticket booking data and business operations.
Tables:
• Moviegoers
  · Moviegoer_ID (PK)
  · Moviegoer_Name
  · Phone
  · Email
• Movies
  · Movie_ID (PK)
  · Movie_Title
  · Genre
  · Language
  · Duration_Minutes
  · Release_Date
• Theatres
  · Theatre_ID (PK)
  · Theatre_Name
  · City
  · Address
• Shows
  · Show_ID (PK)
  · Movie_ID (FK)
  · Theatre_ID (FK)
  · Show_Date
  · Start_Time
  · Screen_No
• Seats
  · Seat_ID (PK)
  · Theatre_ID (FK)
  · Screen_No
  · Seat_Number
  · Seat_Type
  · Ticket_Price
• Tickets
  · Ticket_ID (PK)
  · Show_ID (FK)
  · Seat_ID (FK)
  · Moviegoer_ID (FK)
  · Booked_At
  · Ticket_Status
Relationships:
· Movies can be associated with multiple shows records (one-to-many).
· Theatres can be associated with multiple shows records (one-to-many).
· Theatres can be associated with multiple seats records (one-to-many).
· Shows can be associated with multiple tickets records (one-to-many).
· Seats can be associated with multiple tickets records (one-to-many).
· Moviegoers can be associated with multiple tickets records (one-to-many).
*/
CREATE TABLE Moviegoers
(
  Moviegoer_ID VARCHAR(10) PRIMARY KEY,
   Moviegoer_Name VARCHAR(20),
   Phone NUMBER CHECK(LENGTH (Phone)=10),
   Email VARCHAR(30) UNIQUE

);
INSERT INTO Moviegoers VALUES('MG01','Aarav Sharma',9876543210,'aarav@gmail.com');
INSERT INTO Moviegoers VALUES('MG02','Priya Patil',9876543211,'priya@gmail.com');
INSERT INTO Moviegoers VALUES('MG03','Rahul Deshmukh',9876543212,'rahul@gmail.com');
INSERT INTO Moviegoers VALUES('MG04','Sneha Joshi',9876543213,'sneha@gmail.com');
INSERT INTO Moviegoers VALUES('MG05','Vikram More',9876543214,'vikram@gmail.com');
SELECT *FROM Moviegoers;

CREATE TABLE Movies(
  Movie_ID VARCHAR(10) PRIMARY KEY,
  Movie_Title VARCHAR(20),
  Genre VARCHAR(20),
  Language VARCHAR(20),
  Duration_Minutes NUMBER
);
INSERT INTO Movies VALUES('MV01','Avengers Endgame','Action','English',181);
INSERT INTO Movies VALUES('MV02','3 Idiots','Comedy','Hindi',170);
INSERT INTO Movies VALUES('MV03','Dangal','Sports','Hindi',161);
INSERT INTO Movies VALUES('MV04','Inception','Sci-Fi','English',148);
INSERT INTO Movies VALUES('MV05','Drishyam 2','Thriller','Hindi',140);

SELECT *FROM Movies;

CREATE TABLE  Theatres(
  Theatre_ID VARCHAR(20) PRIMARY KEY ,
  Theatre_Name VARCHAR(20),
  City VARCHAR(20),
  Address VARCHAR2(60)
);
INSERT INTO Theatres VALUES('TH01','PVR Cinemas','Pune','Phoenix Mall Pune');
INSERT INTO Theatres VALUES('TH02','INOX','Mumbai','Malad West Mumbai');
INSERT INTO Theatres VALUES('TH03','Cinepolis','Nagpur','Central Mall Nagpur');
INSERT INTO Theatres VALUES('TH04','City Pride','Pune','Kothrud Pune');
INSERT INTO Theatres VALUES('TH05','Miraj Cinemas','Nashik','College Road Nashik');
SELECT *FROM Theatres;

CREATE TABLE Shows(
  Show_ID NUMBER PRIMARY KEY,
  Movie_ID VARCHAR(10),
  Theatre_ID VARCHAR(20),
  Show_Date DATE ,
  Start_Time NUMBER,
  Screen_No NUMBER ,
  CONSTRAINT ME1_ID FOREIGN KEY (Movie_ID)REFERENCES Movies(Movie_ID),
   CONSTRAINT TE1_ID FOREIGN KEY ( Theatre_ID)REFERENCES Theatres
( Theatre_ID));
INSERT INTO Shows VALUES(101,'MV01','TH01','10-SEP-2026',1000,1);
INSERT INTO Shows VALUES(102,'MV02','TH01','10-SEP-2026',1400,2);
INSERT INTO Shows VALUES(103,'MV03','TH02','10-SEP-2026',1900,1);
INSERT INTO Shows VALUES(104,'MV04','TH02','11-SEP-2026',1100,2);
INSERT INTO Shows VALUES(105,'MV05','TH03','11-SEP-2026',1500,1);
INSERT INTO Shows VALUES(106,'MV01','TH03','11-SEP-2026',2000,2);
INSERT INTO Shows VALUES(107,'MV02','TH04','12-SEP-2026',1000,1);
INSERT INTO Shows VALUES(108,'MV03','TH04','12-SEP-2026',1600,2);
INSERT INTO Shows VALUES(109,'MV04','TH05','12-SEP-2026',1900,1);
INSERT INTO Shows VALUES(110,'MV05','TH05','13-SEP-2026',1100,2);
INSERT INTO Shows VALUES(111,'MV01','TH01','13-SEP-2026',1800,1);
INSERT INTO Shows VALUES(112,'MV03','TH02','13-SEP-2026',2100,2);
INSERT INTO Shows VALUES(113,'MV05','TH03','14-SEP-2026',1700,1);
SELECT *FROM Shows ;

CREATE TABLE Seats(
   Seat_ID VARCHAR(20) PRIMARY KEY,
   Theatre_ID VARCHAR(20),
  
   Seat_Number  NUMBER,
   Seat_Type VARCHAR(20),
   Ticket_Price NUMBER,
   CONSTRAINT TE_ID FOREIGN KEY ( Theatre_ID)REFERENCES Theatres
( Theatre_ID));

INSERT INTO Seats VALUES('S01','TH01',1,'Regular',180);
INSERT INTO Seats VALUES('S02','TH01',2,'Premium',250);
INSERT INTO Seats VALUES('S03','TH02',3,'Regular',180);
INSERT INTO Seats VALUES('S04','TH02',4,'Premium',280);
INSERT INTO Seats VALUES('S05','TH03',5,'Regular',160);
INSERT INTO Seats VALUES('S06','TH03',6,'Premium',240);
INSERT INTO Seats VALUES('S07','TH04',7,'Regular',150);
INSERT INTO Seats VALUES('S08','TH04',8,'Premium',220);
INSERT INTO Seats VALUES('S09','TH05',9,'Regular',170);
INSERT INTO Seats VALUES('S10','TH05',10,'Premium',260);
INSERT INTO Seats VALUES('S11','TH01',11,'Regular',180);
INSERT INTO Seats VALUES('S12','TH02',12,'Premium',280);
INSERT INTO Seats VALUES('S13','TH03',13,'Regular',160);
SELECT *FROM Seats ;

CREATE TABLE Tickets(
  Ticket_ID NUMBER PRIMARY KEY, 
  Show_ID NUMBER ,

  Seat_ID VARCHAR(20),
  Moviegoer_ID VARCHAR(10),
  Booked_At DATE,
  Ticket_Status VARCHAR(15),
  CONSTRAINT SHO_ID FOREIGN KEY (Show_ID)REFERENCES Shows
(Show_ID),
   CONSTRAINT SET_ID FOREIGN KEY ( Seat_ID)REFERENCES Seats
( Seat_ID),
CONSTRAINT MOV_ID FOREIGN KEY (Moviegoer_ID)REFERENCES  Moviegoers

(Moviegoer_ID)
);
INSERT INTO Tickets VALUES(1001,101,'S01','MG01','10-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1002,102,'S02','MG02','10-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1003,103,'S03','MG03','10-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1004,104,'S04','MG04','11-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1005,105,'S05','MG05','11-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1006,106,'S06','MG01','11-SEP-2026','Cancelled');
INSERT INTO Tickets VALUES(1007,107,'S07','MG02','12-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1008,108,'S08','MG03','12-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1009,109,'S09','MG04','12-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1010,110,'S10','MG05','13-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1011,111,'S11','MG01','13-SEP-2026','Booked');
INSERT INTO Tickets VALUES(1012,112,'S12','MG02','13-SEP-2026','Cancelled');
INSERT INTO Tickets VALUES(1013,113,'S13','MG03','14-SEP-2026','Booked');
SELECT *FROM Tickets;