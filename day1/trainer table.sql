/* 
WRITE A QUERY TO CREATE THE TRAINERS TABLE WHICH CONSISTS OF THE FOLLLOWING COLUMN 
-----------------------------------------------------------------------------------------------------
            TID        TNAME          MNO               DOB              JDATE              SAL
  ---------------------------------------------------------------------------------------------------------          
DATATYPE    NUM         VRACHAR      NUM               DATE               DATE            NUMBER
----------------------------------------------------------------------------------------------------------
CONSTRAINT                          10DIGIT
                                    CHECK                                                 <0
                                                                                         +VE
                                                                                          ONLY CHECK
 ---------------------------------------------------------------------------------------                                                                                        */
CREATE TABLE TRAINERS
(
   TID  NUMBER UNIQUE ,
   TNAME VARCHAR(30),
   MNO  NUMBER CHECK(LENGTH(MNO)=10),
   DOB DATE ,
   JDATE DATE,
   SAL NUMBER CHECK(SAL>0)

);

SELECT *FROM TRAINERS