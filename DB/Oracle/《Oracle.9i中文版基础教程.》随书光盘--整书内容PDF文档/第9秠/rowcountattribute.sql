Set  serveroutput  on
declare
  tempsal scott.emp.sal%type;
  cursor mycursor is
     select * from scott.emp
     where sal>tempsal;
  cursorrecord mycursor%rowtype;
begin
   tempsal:=800;
   open mycursor;
   fetch mycursor into cursorrecord;
   dbms_output.put_line(to_char(mycursor%rowcount));
end;  