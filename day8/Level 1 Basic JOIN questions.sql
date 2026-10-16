-- Level 1: Basic JOIN questions
-- 1. Display employee names along with their department names.
select ENAME ,DNAME
FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO;
-- 2. Display employee names and their department locations.
SELECT ENAME,LOC
FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO;
-- 3. Display employee name, job, salary, and department name.
SELECT ENAME,SAL,JOB,DNAME
FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO;
-- 4. Display the names of employees working in DALLAS.
SELECT ENAME FROM EMP1 INNER JOIN DEPT 
ON EMP1.DEPTNO=DEPT.DEPTNO AND LOC='DALLAS';
-- 5. Display the names of employees working in the ACCOUNTING department.

SELECT ENAME FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO
AND DNAME='ACCOUNTING';
-- 6. Display employee names along with their manager names.
SELECT E.ENAME,M.ENAME
FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO;
-- 7. Display employee name, manager name, and manager's salary.
SELECT E.ENAME,M.ENAME,M.SAL
FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO ;
-- 8. Display department names along with the employees working in them, including departments that have no employees.
SELECT DNAME,ENAME
FROM EMP1 RIGHT JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO ;
-- 9. Display all employee names and their department locations, including employees who are not assigned to a department.
SELECT ENAME,LOC 
FROM EMP1 LEFT JOIN DEPT 
ON EMP1.DEPTNO=DEPT.DEPTNO;
-- 10. Display the names of employees working in departments located in NEW YORK or DALLAS
SELECT ENAME
FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO
WHERE LOC='NEW YORK' OR LOC='DALLAS';
-- 10. Display the names of employees working in departments located in NEW YORK or DALLAS
SELECT ENAME
FROM EMP1 INNER JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO
WHERE LOC IN('NEW YORK','DALLAS');