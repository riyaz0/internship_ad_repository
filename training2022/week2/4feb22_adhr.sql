select * from emp;

--copy data and structure but not constraints
create table emp_dummmy
as 
select * from emp;


select * from emp_dummy;

delete from emp_dummy;
rollback;
select * from emp_dummy;
--####################################################
--INSERT
--DELETE
--UPDATE
--###################################################
--(empno,ename,job,mgr,hiredate,sal,comm,deptno)
--INSERT INTO emp_dummy  values(?,?,?,?,?,?,?,?)
--use subquery to insert data into emp_dummy
INSERT INTO EMP_DUMMY (SELECT * FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP_DUMMY
WHERE DEPTNO=30
ORDER BY EMPNO;
--WHEN WE CREATE YTABLE 'AS SELECT' ON CREATE STATEMENT
--TABLE ONLY HAS INFORMATION ABOUT COLUMN :DATA TYPE OF CLUMN
--WE CAN DUPLICATE VALUES IN THIS TABLE AS THERE ARE NO CONSTRAINTS ON THE COLUMN
--WHY WE ARE CRETAING THIS TABLE: ITS USED FOR RND PURPOSE
--ONCE WORKDONE DROP THESE TABLES
--INSTEAD DELETE WE ALSO CAN USE TRUNCATE ON TABLE WHICH KEEPS STRUCTURE BUT DELETES ALL RECORDS
TRUNCATE TABLE EMP_DUMMY;

SLECT * from emp_dummy;
-- ################################################################
--  EMP WHERE EMP ARE WORKING IN NEW YORK LOCATION
-- ################################################################
-- SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK';
-- SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK');
-- SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK'))
INSERT INTO EMP_DUMMY (
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK'))
);
    
SELECT  * FROM EMP_DUMMY;