set serveroutput on
Declare
   result  integer; 
begin
  result:=10+3*4-20+5**2;
  dbms_output.put_line('�������ǣ�'||to_char(result));
end;
