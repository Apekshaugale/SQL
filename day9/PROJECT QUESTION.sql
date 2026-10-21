SELECT * FROM Books1 WHERE Category = 'Fantasy';

Q4. Books published after 1950
SELECT * FROM Books1 WHERE published_Year >'1950';

Q5. Distinct categories
SELECT Distinct CATEGORY FROM Books1;

Books by year, oldest first
SELECT TITLES ,published_Year FROM Books1
 ORDER BY published_Year;

  Members by name, Z to A
  SELECT * FROM Members ORDER BY MEMBER_NAME DESC;

Q9. Unpaid fines
SELECT * FROM fines WHERE PAYMENT_STATUS='UNPAID';

Q10. Fines whose Paid_Date is NULL
SELECT * FROM Fines WHERE Paid_Date IS NULL;

Q11. Fines whose Paid_Date is not NULL
SELECT * FROM Fines WHERE Paid_Date IS  NOT NULL;

Q12. Copies not available
SELECT * FROM BOOK_COPIES WHERE COPY_STATUS='NOT AVAILABLE';

SELECT * FROM BOOK_COPIES;

Q24. Gmail users
SELECT * FROM Members WHERE EMAIL LIKE '%@gmail.com';

Q25. Titles NOT starting with 'The'
SELECT * FROM Books1 WHERE TITLES NOT LIKE 'The%';

Loans not yet returned
SELECT * FROM Loans WHERE Return_Date IS NULL;

Q28. Length of title
SELECT Titles, LENGTH(Titles) FROM Books1;

Q29. First 3 letters of name

SELECT SUBSTR(Member_Name,1,3) FROM Members;

Q44. Days each book was kept
SELECT LOAN_ID,Return_Date-ISSUE_DATE AS KEPT FROM Loans;

Q45. Late returns with late days

SELECT LOAN_ID ,Return_Date-DUE_DATE 
AS LATERETURN FROM LOANS WHERE Return_Date>DUE_DATE;

Q47. Loans issued in 2024
SELECT * FROM LOANS WHERE ISSUE_DATE BETWEEN '1-JAN-2024' AND '31-DEC-2024';
Q47. Loans issued in FEB
SELECT * FROM LOANS WHERE ISSUE_DATE BETWEEN '1-FEB-2024' AND '28-FEB-2024';

SELECT * FROM Loans
WHERE ISSUE_DATE LIKE '%FEB%';



Q58. Loans per member
select MEMBER_ID ,COUNT(*) FROM LOANS GROUP BY MEMBER_ID;

Q59. Total fine per payment status
SELECT SUM(FINE_AMOUNT)  FROM FINES WHERE 
PAYMENT_STATUS='PAID';

SELECT SUM(FINE_AMOUNT) FROM FINES GROUP BY PAYMENT_STATUS;
SELECT * FROM BOOK_COPIES;