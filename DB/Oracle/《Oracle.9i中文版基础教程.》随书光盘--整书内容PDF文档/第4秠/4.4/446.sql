select  emp.empno,emp.ename,emp.job,emp.sal  
from scott.emp,scott.dept
where exists
(select * from scott.emp where scott.emp.deptno=scott.dept.deptno);
