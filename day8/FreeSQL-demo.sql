-- Level 5: Advanced and mixed JOIN challenges
-- 41. Display all employees and all departments, including employees without a matching department and departments without employees.
SELECT ENAME ,DNAME
FROM EMP1 FULL JOIN DEPT
ON EMP1.DEPTNO=DEPT.DEPTNO;
-- 42. Display the names of employees who work in the same location as their manager's department.
SELECT E.ENAME
FROM EMP1 E ,EMP1 M,DEPT EE, DEPT MM  
WHERE E.DEPTNO=EE.DEPTNO AND M.DEPTNO=MM.DEPTNO AND E.MGR=M.EMPNO
AND EE.LOC=MM.LOC; 

-- 43. Display the names of employees who earn more than their department's average salary and whose salary grade is above 3.
SELECT E1.ENAME
FROM EMP1 E1
JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
WHERE E1.SAL > (
    SELECT AVG(E2.SAL)
    FROM EMP1 E2
    WHERE E2.DEPTNO = E1.DEPTNO
);
-- 44. Display department names, employee names, manager names, and salary grades for all employees.
SELECT DNAME ,E.ENAME,M.ENAME,E.SAL,M.SAL
FROM EMP1 E,EMP1 M,DEPT 
WHERE E.DEPTNO=DEPT.DEPTNO AND E.MGR=M.EMPNO;

-- 45. Display employees who earn the highest salary in their department, along with their department locations.

SELECT E.ENAME, D.LOC
FROM EMP1 E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL = (
    SELECT MAX(E2.SAL)
    FROM EMP1 E2
    WHERE E2.DEPTNO = E.DEPTNO
);
-- 46. Display all possible employee-department combinations, regardless of whether an employee belongs to that department.
-- 47. Display the names of employees who work in departments that have more than three employees.
-- 48. Display employees whose salary is higher than their manager's salary and whose department is located in CHICAGO.
-- 49. Display department names, employee names, and the names of employees who earn more than the employee in question within the same department.
-- 50. Display each employee's name, manager name, department name, department location, and salary grade, including employees who do not have a manager.