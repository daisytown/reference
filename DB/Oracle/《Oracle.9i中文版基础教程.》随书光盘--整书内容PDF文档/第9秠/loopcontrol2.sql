set  serveroutput on
declare
   number1 integer:=80;
   number2 integer:=90;
   i integer:=0;
begin
   loop
     number1:=number1+1;
     i:=i+1;
     exit when number1=number2;
   end loop;
  dbms_output.put_line('��ѭ������:'||to_char(i)); 
end;   
