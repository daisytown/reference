set  serveroutput on
declare
  tempsal scott.emp.sal%type;
  cursor mycursor is
     select * from scott.emp
     where sal>tempsal;
  cursorrecord mycursor%rowtype;
begin
   tempsal:=800;
   if  mycursor%isopen  then
      fetch mycursor into cursorrecord;
      dbms_output.put_line(to_char(cursorrecord.deptno));
   else
     dbms_output.put_line('游标没有打开！');
   end if;  
end;  
