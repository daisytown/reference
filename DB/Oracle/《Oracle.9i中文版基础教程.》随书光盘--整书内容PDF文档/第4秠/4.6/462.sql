insert into scott.emp(empno,ename,hiredate)
     (select empno+100,ename,hiredate  from scott.emp
     where empno>=6999
     );
