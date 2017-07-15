set serveroutput on
declare 
   myno  scott.dept.deptno%type;
   mydname  scott.dept.dname%type;
   myloc  scott.dept.loc%type;
begin
  myno:=10;
  mydname:='';
  myloc:='';
  scott.tempprocedure(myno,mydname,myloc);
  dbms_output.put_line(myno);
  dbms_output.put_line(mydname);
  dbms_output.put_line(myloc);
end;
