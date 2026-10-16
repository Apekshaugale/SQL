-- Display employees who have the same manager as SMITH.
SELECT ENAME FROM EMP1
WHERE MGR IN (SELECT MGR FROM EMP1 WHERE ENAME='SMITH');

SELECT *FROM EMP1;

-- Display employees who work in the same department as their manager.

SELECT E.ENAME FROM EMP1 E,EMP1 M WHERE  E.MGR=M.EMPNO AND E.DEPTNO=M.DEPTNO;

-- Display employees who work in a different department from their manager.

SELECT E.ENAME FROM EMP1 E,EMP1 M WHERE E.MGR=M.EMPNO AND E.DEPTNO <>M.DEPTNO; 

-- Display the names of employees who earn more than their managers.

SELECT E.ENAME FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO AND E.SAL>M.SAL;

-- Display employees who were hired before their managers.

SELECT E.ENAME FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO
AND E.HIREDATE<M.HIREDATE;

-- Display each employee's name along with their manager's manager name.
SELECT E.ENAME,MM.ENAME
FROM EMP1 E ,EMP1 M,EMP1 MM
WHERE E.MGR =M.EMPNO
AND M.MGR=MM.EMPNO;


-- Display employees who report directly to KING.
SELECT ENAME FROM EMP1 WHERE MGR IN (SELECT EMPNO FROM EMP1 WHERE ENAME='KING');

-- Display employees who have the same job as their managers.
SELECT E.ENAME FROM EMP1 E,EMP1 M
WHERE E.MGR=M.EMPNO
AND E.JOB=M.JOB;


-- Display pairs of employees working in the same department, excluding an employee paired with themselves.

SELECT E.ENAME,A.ENAME
FROM EMP1 E,EMP1 A
WHERE  E.DEPTNO=A.DEPTNO
AND E.ENAME<A.ENAME;

-- Display employees who earn more than at least one employee working under the same manager.


SELECT DISTINCT E.ENAME
FROM EMP1 E, EMP1 A
WHERE E.MGR = A.MGR
  AND E.EMPNO <> A.EMPNO
  AND E.SAL > A.SAL;