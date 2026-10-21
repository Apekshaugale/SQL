--WAQTD department names in which all employees were hired after 1981.

SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM EMP1
    GROUP BY DEPTNO
    HAVING MIN(HIREDATE) > '31-DEC-81');

--WAQTD department names in which all employees are earning more than 2000.
Tables: EMP, DEPT
Hint: Think about which aggregate function checks the lowest salary in each department.

SELECT DNAME FROM DEPT
WHERE DEPTNO IN(SELECT DEPTNO FROM EMP1 GROUP BY DEPTNO HAVING MIN(SAL)>2000);

Question 2
WAQTD department numbers in which all employees were hired before 1982.
Hint: Use GROUP BY, HAVING, and an aggregate function on HIREDATE.

SELECT DEPTNO FROM EMP1 GROUP BY DEPTNO HAVING MAX(HIREDATE) < '01-JAN-1982';

Question 3
WAQTD department names in which all employees are earning less than 5000.
Hint: Which aggregate function finds the highest salary in a department?

SELECT DNAME FROM DEPT WHERE DEPTNO IN (
    SELECT DEPTNO  FROM EMP1 
    GROUP BY DEPTNO 
    HAVING MAX(SAL)<5000

);

Level 2: A little more challenging
Question 4
WAQTD department names in which at least one employee was hired after 1981.
Hint: You can solve this using IN and a subquery. Think about whether MIN() or MAX() is needed.

SELECT DNAME FROM DEPT WHERE DEPTNO IN  (
    SELECT DEPTNO FROM EMP1 WHERE HIREDATE >'31-DEC-81');

SELECT DNAME FROM DEPT WHERE DEPTNO IN ( SELECT DEPTNO FROM EMP1 WHERE HIREDATE >= DATE '1982-01-01');

Question 5
WAQTD department names in which no employee earns less than 2000.

SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM EMP1
    GROUP BY DEPTNO
    HAVING MIN(SAL) >= 1300
);

WAQTD department names in which all employees were hired in the same year, and that year is 1981.
Hint: Compare the earliest and latest hiring dates, or use a suitable date condition.
SELECT DNAME 
FROM DEPT 
WHERE DEPTNO IN (
    SELECT DEPTNO 
    FROM EMP1 
    GROUP BY DEPTNO 
    HAVING MIN(HIREDATE) >= '01-JAN-1981' 
       AND MAX(HIREDATE) <= '31-DEC-1981'
);