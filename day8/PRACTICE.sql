-- Question 1 — Subquery + Aggregate
-- WAQTD the employee names and salaries of employees whose salary is greater than the average salary of all employees.

SELECT ENAME,SAL FROM EMP1 WHERE SAL > ALL (SELECT AVG(SAL) FROM EMP1);

-- 🔥 Question 2 — GROUP BY + HAVING
-- WAQTD department number and average salary of each department where the average salary is greater than 2500.
SELECT DEPTNO ,AVG(SAL)
FROM EMP1 
GROUP BY DEPTNO
HAVING AVG(SAL)>2500;

-- 
-- WAQTD department name and number of employees working in each department, but display only those 
--departments having more than 3 employees.
SELECT DNAME ,COUNT(ENAME) 
FROM EMP1,DEPT
WHERE EMP1.DEPTNO=DEPT.DEPTNO
GROUP BY DNAME
HAVING COUNT(ENAME)>3;
-- WAQTD the employee name and their manager's name for all employees who have a manager.
-- Hint: EMP has to be used twice.
-- 
SELECT E.ENAME,M.ENAME
FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO;

-- WAQTD the details of employees who work in the same departments as the employees whose job is MANAGER.
SELECT * FROM EMP1 WHERE DEPTNO IN (SELECT DEPTNO FROM EMP1 WHERE JOB='MANAGER'); 

-- WAQTD the employee name and salary of the employee who earns the second-highest salary.
-- ⚠️ Try to solve this without using ORDER BY and FETCH.
SELECT ENAME,SAL FROM EMP1 WHERE SAL =(SELECT MAX(SAL)FROM EMP1 WHERE SAL<(SELECT MAX(SAL)FROM EMP1));

-- WAQTD the departments that have no employees working in them.
-- Try solving it using a subquery.
SELECT DISTINCT DNAME  FROM EMP1 RIGHT JOIN DEPT ON EMP1.DEPTNO=DEPT.DEPTNO WHERE EMP1.EMPNO IS NULL;

-- WAQTD employee name, salary, annual salary, and department number for employees whose annual salary is
-- greater than 30,000 but less than 60,000, whose department is not 10 or 30, and whose job is either MANAGER, CLERK, or SALESMAN.
SELECT ENAME ,SAL,SAL*12 ,DEPTNO FROM EMP1
WHERE SAL*12>30000 AND SAL*12<60000 AND DEPTNO NOT IN (10,30) AND JOB IN ('MANAGER','CLERK','SALESMAN'); 

-- WAQTD the employee name, department name, and salary of employees who earn more than their department's average salary.
-- 🔥 This is an important interview-level question because it tests whether you understand correlated subqueries.
SELECT ENAME ,DNAME ,SAL FROM EMP1,DEPT WHERE EMP1.DEPTNO=DEPT.DEPTNO AND SAL>(SELECT AVG(SAL) FROM EMP1 );

SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP1 E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL > (
    SELECT AVG(E2.SAL)
    FROM EMP1 E2
    WHERE E2.DEPTNO = E.DEPTNO
);
-- WAQTD the department name and employee name of the employee who has the highest salary in each department.
-- Requirements:
-- - Display DNAME
-- - Display ENAME
-- - Display SAL
-- - Highest salary department-wise
-- - If two employees have the same highest salary, both should be displayed.
SELECT D.DNAME,E.ENAME ,E.SAL
FROM EMP1 E,DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.SAL IN(SELECT MAX(EE.SAL)FROM EMP1 EE GROUP BY EE.DEPTNO  );

SELECT D.DNAME, E.ENAME, E.SAL
FROM EMP1 E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL = (
    SELECT MAX(EE.SAL)
    FROM EMP1 EE
    WHERE EE.DEPTNO = E.DEPTNO
);