select  emp.empno, emp.ename, emp.deptno, dept.dname,dept.loc
from   scott.emp,scott.dept
where  scott.emp.deptno!=scott.dept.deptno and scott.emp.deptno=10;
