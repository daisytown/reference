select *  from scott.emp where job='MANAGER' and sal<>2000;

select *  from scott.emp where job!='MANAGER' or sal<>2000;

select *  from scott.emp where not job>='MANAGER';

