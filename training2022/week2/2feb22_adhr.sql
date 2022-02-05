select * from branch;
select * from dept;
select * from emp;
--empname,branchname,dptname
alter table emp
drop column branchno;

-- display empname,deptname and location of work printed in query
select  emp.ename,dept.dname,branch.location
from emp join dept 
ON emp.deptno = dept.deptno
join branch
on dept.branchno=branch.branchno ;

select 
emp.empname,emp.job,emp.mgr.emp.hiredate,emp.sal,dept.dname
from
emp join dept
on 
emp.deptno=dept.deptno;
--LIST BRANCHNAME,DNAME,SUM OF SAL FOR THOSE BRANCH AND DEPT WHERE THE SUM IS >5000
SELECT 
    BRANCHNAME,DNAME,SUM(sal)
FROM
    BRANCH JOIN DEPT
    ON BRANCH.BRANCHNO=DEPT.BRANCHNO
    join emp
    on emp.deptno=dept.deptno
  group by 
  dname,branchname
  having sum(sal)>5000
  
