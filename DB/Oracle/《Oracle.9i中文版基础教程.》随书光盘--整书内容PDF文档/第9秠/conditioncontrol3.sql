set  serveroutput on
declare
   number1 integer:=80;
   number2 integer:=90;
begin
   if number1<=number2 then
      if number1=number2 then
         dbms_output.put_line('number1等于number2');
      else
         dbms_output.put_line('number1小于number2');
      end if;   
   else
         dbms_output.put_line('number1大于number2');
   end if;      
end;   
