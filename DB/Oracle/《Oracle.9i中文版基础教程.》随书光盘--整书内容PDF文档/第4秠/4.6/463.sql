create table  scott.test
 as
  (
   select distinct empno,ename,hiredate
   from scott.emp
   where empno>=7000
   );
