set serveroutput on
declare
  tempsal scott.emp.sal%type;
  cursor mycursor is
     select * from scott.emp
     where sal>tempsal;
begin
   tempsal:=800;
   open mycursor;
end;   
