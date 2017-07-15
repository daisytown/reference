(select deptno from scott.dept)
minus
(select deptno from scott.emp);
