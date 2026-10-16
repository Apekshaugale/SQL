-- Level 2: JOINs with conditions and calculations
-- 11. Display employee names, department names, and salaries of employees earning more than 2000.
SELECT ENAME,DNAME,SAL
FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO
WHERE SAL>2000;

-- 12. Display employee names and department locations for employees hired after 1982.
SELECT ENAME,LOC 
FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO
WHERE EMP1.HIREDATE>'31-DEC-1982';

-- 13. Display employee name, manager name, and the salary difference between the employee and manager.
SELECT E.ENAME,M.ENAME,E.SAL-M.SAL salary
FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO;

-- 14. Display employees whose salary is greater than their manager's salary.

SELECT E.ENAME
FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO AND E.SAL>M.SAL;

-- 15. Display employees working in the same department as KING.
SELECT ENAME FROM EMP1
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP1 WHERE ENAME='KING');

-- 16. Display the names of employees whose managers work in a different department.
SELECT E.ENAME FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO AND E.DEPTNO <>M.DEPTNO; 

-- 16. Display the names of employees whose managers work in a different department.
SELECT E.ENAME FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO AND E.DEPTNO NOT IN M.DEPTNO; 

-- 17. Display department name, location, and total salary paid to employees in each department.
SELECT DNAME ,LOC,SUM(SAL) AS TSAL
FROM EMP1 ,DEPT
WHERE  EMP1.DEPTNO=DEPT.DEPTNO
GROUP BY DNAME, LOC;

-- 18. Display department names and the number of employees in each department, including departments with zero employees.

SELECT DNAME,COUNT(ENAME)
FROM EMP1 RIGHT JOIN DEPT 
ON EMP1.DEPTNO=DEPT.DEPTNO
GROUP BY DNAME ;

-- 19. Display employees who earn more than the average salary of their department.
 SELECT ENAME 
 FROM EMP1,DEPT
 WHERE DEPT.DEPTNO=EMP1.DEPTNO AND SAL>AVG(SAL)
 GROUP BY DNAME ;
 
SELECT E.ENAME
FROM EMP1 E WHERE E.SAL > (SELECT AVG(M.SAL) FROM EMP1 M WHERE M.DEPTNO = E.DEPTNO);

SELECT E.ENAME
FROM EMP1 E, EMP1 M
WHERE E.DEPTNO = M.DEPTNO
GROUP BY E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
HAVING E.SAL > AVG(M.SAL);

-- 20. Display employee names, department names, and salary grades using the SALGRADE table.

SELECT  ENAME,DNAME ,SAL