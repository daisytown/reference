(select deptno from scott.emp)
intersect
(select deptno from scott.dept);
