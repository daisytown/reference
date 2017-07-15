set  serveroutput  on
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
      if mycursor%notfound then
         dbms_output.put_line(to_char(cursorrecord.deptno));
      else
         dbms_output.put_line('发现数据！');
      end if;  
end;  
