Set  serveroutput on
create or replace procedure scott.tempprocedure(
   tempdeptno in scott.dept.deptno%type,
   tempdname out scott.dept.dname%type,
   temploc in out scott.dept.loc%type)as
   loc1   scott.dept.loc%type;
   dname1 scott.dept.dname%type;
begin
   select loc  into loc1
   from  scott.dept
   where  deptno=tempdeptno;
   select dname  into dname1
   from  scott.dept
   where  deptno=tempdeptno;
   temploc:='µÿ÷∑:'||loc1;
   tempdname:='–’√˚'||dname1;
end;