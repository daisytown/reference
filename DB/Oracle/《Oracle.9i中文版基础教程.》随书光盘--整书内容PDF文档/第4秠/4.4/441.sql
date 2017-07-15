select  emp.empno,emp.ename,emp.job,emp.sal  
from scott.emp
where sal>=(select sal from scott.emp where ename='WARD');
