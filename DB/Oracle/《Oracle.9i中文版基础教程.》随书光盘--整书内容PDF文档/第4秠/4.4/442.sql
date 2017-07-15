select  emp.empno,emp.ename,emp.job,emp.sal  
from scott.emp
where sal in (select sal from scott.emp where ename='WARD');
