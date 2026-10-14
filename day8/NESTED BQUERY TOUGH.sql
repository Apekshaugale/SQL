-- -- Here are 25 Oracle SQL subquery practice questions similar to the question in your notebook. These questions use the `EMP` and `DEPT` tables and focus on nested subqueries, multiple conditions, `MAX()`, `MIN()`, `IN`, `ANY`, `ALL`, and employee-manager relationships.

-- -- Try solving them yourself first. I have not included the answers so you can practice properly.

-- -
-- -- ## Level 2: Multiple subqueries

-- -- 6. Display the location of employees whose 
-- salary is greater than SMITH's salary and who were 
-- hired before SCOTT.
select LOC from DEPT WHERE DEPTNO IN(
    SELECT DEPTNO FROM EMP1 WHERE 
    SAL >(SELECT SAL FROM EMP1 WHERE ENAME='SMITH')AND HIREDATE <
    (SELECT HIREDATE FROM EMP1 WHERE ENAME='SCOTT')
); 
-- -- 7. Display the names and locations of employees 
-- earning the third-highest salary.
SELECT ENAME ,LOC FROM DEPT,EMP1 WHERE 
EMP1.DEPTNO = DEPT.DEPTNO  AND 
SAL <(SELECT MAX(SAL)FROM EMP1 WHERE SAL<(SELECT
MAX(SAL)FROM EMP1 WHERE SAL< (SELECT MAX(SAL) FROM EMP1)));
-- -- 8. Display all details of employees who earn 
-- more than the salary of the employee earning the 
-- second-highest salary.
SELECT * FROM EMP1 WHERE SAL >(SELECT maX(SAL)FROM EMP1 WHERE
SAL <(SELECT MAX(SAL)FROM EMP1));
-- -- 9. Display the names of employees working in the
--  same department as KING and earning a salary greater
--   than KING.
SELECT ENAME FROM EMP1 WHERE
DEPTNO IN (SELECT DEPTNO FROM EMP1 WHERE ENAME='KING')AND SAL >(
    SELECT SAL FROM EMP1 WHERE ENAME='KING'
) ;
-- -- 10. Display the employee name, salary,
--  and location of employees earning more than
--   the average salary of their department.
SELECT ENAME,SAL,LOC 
FROM EMP1,DEPT
WHERE EMP1.DEPTNO =DEPT.DEPTNO
AND SAL >(SELECT AVG(SAL)FROM EMP1
 WHERE DEPT.DEPTNO = EMP1.DEPTNO);
-- -- ## Level 3: Challenging questions like your notebook

-- -- 11. Display the location of employees whose salaries
--  are greater than SMITH's salary, who were hired before 
--  SCOTT, and who earn the third-highest salary.
SELECT LOC FROM DEPT WHERE DEPTNO IN
(SELECT DEPTNO FROM EMP1 WHERE SAL >(SELECT SAL FROM EMP1
WHERE ENAME='SMITH')AND HIREDATE <(SELECT HIREDATE FROM EMP1
WHERE ENAME='SCOTT')AND SAL=(SELECT MAX(SAL) FROM EMP1 WHERE SAL <(
    SELECT MAX(SAL)FROM EMP1 WHERE SAL<(
        SELECT MAX(SAL) FROM EMP1
    )
)));
-- -- 12. Display the locations of employees who earn more
--  than SMITH and are reporting to the same manager as SCOTT.
SELECT LOC FROM 
DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP1 WHERE
SAL> (SELECT SAL FROM EMP1 WHERE ENAME='SMITH')AND MGR IN 
(SELECT MGR FROM EMP1 WHERE ENAME='SCOTT'));
-- -- 13. Display the names of employees who earn the 
-- second-highest salary and are reporting to KING.
SELECT ENAME FROM EMP1 WHERE SAL=(SELECT MAX(SAL)FROM EMP1 WHERE SAL<
(SELECT MAX(SAL)FROM EMP1 )) AND MGR IN (SELECT EMPNO FROM EMP1 WHERE 
ENAME='KING');


-- -- 14. Display the locations of employees who earn 
-- more than the third-highest salary and are working 
-- in the same department as JONES.
SELECT LOC FROM DEPT
WHERE DEPTNO IN(
    SELECT DEPTNO FROM EMP1 
    WHERE SAL >(SELECT MAX(SAL)FROM EMP1
    WHERE SAL <(SELECT MAX(SAL)FROM EMP1 WHERE
    SAL<(SELECT MAX(SAL)FROM EMP1))
)AND DEPTNO =(SELECT DEPTNO FROM EMP1 WHERE ENAME='JONES'));
-- -- 15. Display the names and locations of employees
--  who were hired before SCOTT, earn more than SMITH,
--   and work in the department located in DALLAS.
SELECT ENAME ,LOC FROM DEPT,EMP1 WHERE DEPT.DEPTNO =EMP1.DEPTNO AND(
HIREDATE < (SELECT HIREDATE FROM EMP1 WHERE ENAME='SCOTT') AND 
SAL>(SELECT SAL FROM EMP1 WHERE ENAME='SMITH')AND LOC='DALLAS');
-- -- 16. Display the names of employees who earn more
--  than SMITH and report to the manager of SCOTT.
SELECT ENAME FROM EMP1 WHERE SAL>(SELECT SAL FROM EMP1
WHERE ENAME='SMITH')AND MGR = (SELECT MGR FROM EMP1 
WHERE ENAME='SCOTT');
-- -- 17. Display the locations of employees earning
--  the maximum salary among employees reporting to KING.
SELECT LOC FROM DEPT WHERE DEPTNO IN(
    SELECT DEPTNO FROM EMP1 WHERE SAL=(SELECT MAX(SAL)FROM EMP1 WHERE MGR=
    (SELECT EMPNO FROM EMP1 WHERE ENAME='KING'))
);
-- -- 18. Display the names of employees who earn more
--  than the minimum salary of employees working in DALLAS
--   and were hired before MILLER.
SELECT ENAME FROM EMP1 ,DEPT
WHERE EMP1.EMPNO=DEPT.DEPTNO AND SAL >
(SELECT MIN(SAL) FROM EMP1 WHERE DEPTNO=
(SELECT DEPTNO FROM DEPT WHERE LOC='DALAS' ))
AND HIREDATE <(SELECT HIREDATE FROM EMP1 WHERE ENAME='MILLER' );

-- -- 19. Display the employee names and locations of
--  employees who earn more than the average salary
--   of employees reporting to KING.
SELECT ENAME ,LOC FROM EMP1,DEPT
WHERE DEPT.DEPTNO=EMP1.DEPTNO AND 
SAL >(SELECT AVG(SAL)FROM EMP1 WHERE MGR =(SELECT EMPNO FROM EMP1 WHERE ENAME='KING'));
-- -- 20. Display the names and locations of employees
--  who earn the third-highest salary among employees 
--  hired before SCOTT.
SELECT ENAME,LOC FROM EMP1,DEPT
WHERE EMP1.DEPTNO=DEPT.DEPTNO AND SAL=(SELECT MAX(SAL)FROM EMP1 WHERE
SAL<(SELECT MAX(SAL)FROM EMP1 WHERE SAL<(SELECT MAX(SAL)FROM EMP1 )))
AND HIREDATE <(SELECT HIREDATE FROM EMP1 WHERE ENAME='SCOTT');

-- -- ## Level 4: Advanced subquery practice

-- -- 21. Display the names of employees earning more
--  than ALL employees working in department 30.
SELECT ENAME FROM EMP1 WHERE SAL>ALL(SELECT (SAL)FROM EMP1 WHERE DEPTNO=30 );
-- -- 22. Display the names of employees earning more
--  than ANY employee working in department 20.
SELECT ENAME FROM EMP1 WHERE SAL > ANY (SELECT SAL FROM EMP1 WHERE DEPTNO=20);
-- -- 23. Display the names and locations of employees
--  who work in the same location as KING but earn less
--   than KING.
SELECT ENAME ,LOC FROM EMP1,DEPT 
WHERE DEPT.DEPTNO=EMP1.DEPTNO AND
LOC =(SELECT LOC FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP1
WHERE ENAME='KING'))AND SAL <(SELECT SAL FROM EMP1 WHERE ENAME='KING');
-- -- 24. Display the names of employees who earn more
--  than SMITH, were hired before SCOTT, and work in 
--  the department of the employee earning the maximum salary.
SELECT ENAME FROM EMP1
WHERE SAL>(SELECT SAL FROM EMP1 WHERE ENAME='SMITH')AND HIREDATE <(SELECT HIREDATE FROM 
EMP1 WHERE ENAME='SCOTT')AND DEPTNO=(SELECT DEPTNO FROM EMP1 WHERE SAL=(SELECT MAX(SAL)FROM EMP1));
-- -- 25. Display the locations of employees who earn more 
-- than SMITH, were hired before SCOTT, earn the third-highest
--  salary in the entire company, and report to KING.

SELECT LOC FROM EMP1,DEPT 
WHERE DEPT.DEPTNO=EMP1.DEPTNO
AND SAL>(SELECT SAL FROM EMP1 WHERE ENAME='SMITH')
AND
 HIREDATE <(SELECT HIREDATE FROM EMP1 WHERE 
ENAME='SCOTT')
AND SAL=(SELECT MAX(SAL)FROM EMP1
WHERE SAL<(SELECT MAX(SAL)FROM EMP1 WHERE SAL<
(SELECT MAX(SAL)FROM EMP1 WHERE SAL<

(SELECT MAX(SAL)FROM EMP1))))
AND MGR=(SELECT EMPNO FROM EMP1 WHERE ENAME='KING');