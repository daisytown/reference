(select deptno from scott.emp)
union
(select deptno from scott.dept);
