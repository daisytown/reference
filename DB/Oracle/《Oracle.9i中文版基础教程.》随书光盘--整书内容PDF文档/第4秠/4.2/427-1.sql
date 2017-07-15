select  empno,ename,job,sal  from  scott.emp  group  by
job,empno,ename,sal having sal<=2000