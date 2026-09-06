/*
Write a query to create the product table and the order_details table.

Product table
pid → number, primary key
pname → varchar, mandatory
price → number, greater than 0
quantity → number, should be greater than or equal to 0
category → varchar, mandatory
Order_details table
oid → number, primary key
customer_name → varchar, mandatory
order_date → date
quantity → number, greater than 0
pid → same as pid of product table, foreign key
*/
CREATE TABLE PRODUCT(
     PID NUMBER PRIMARY KEY,
     PNAME VARCHAR(20) NOT NULL,
     PRICE NUMBER CHECK(PRICE>0),
     QUANTITY NUMBER CHECK(QUANTITY>=0) ,
    CATEGORY VARCHAR(20) NOT NULL
);

CREATE TABLE Order_details(
    OID NUMBER PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(20) NOT NULL,
    ORDER_DATE DATE,
    QUANTITY NUMBER CHECK(QUANTITY>0),
    PID NUMBER,
    CONSTRAINT Order_details FOREIGN KEY(PID) REFERENCES PRODUCT(PID)
);