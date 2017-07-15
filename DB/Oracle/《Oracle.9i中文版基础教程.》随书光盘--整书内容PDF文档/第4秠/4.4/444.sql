select  emp.empno,emp.ename,emp.job,emp.sal  
from scott.emp
where sal =some(select sal from scott.emp where job='MANAGER');
