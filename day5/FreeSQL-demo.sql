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

CREATE TABLE Movies(
  Movie_ID VARCHAR(10) PRIMARY KEY,
  Movie_Title VARCHAR(20),
  Genre VARCHAR(20),
  Language VARCHAR(20),
  Duration_Minutes NUMBER
);

CREATE TABLE  Theatres(
  Theatre_ID VARCHAR(20) PRIMARY KEY ,
  Theatre_Name VARCHAR(20),
  City VARCHAR(20),
  Address VARCHAR2(60)
);

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

CREATE TABLE Seats(
   Seat_ID VARCHAR(20) PRIMARY KEY,
   Theatre_ID VARCHAR(20),
  
   Seat_Number  NUMBER,
   Seat_Type VARCHAR(20),
   Ticket_Price NUMBER,
   CONSTRAINT TE_ID FOREIGN KEY ( Theatre_ID)REFERENCES Theatres
( Theatre_ID));

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