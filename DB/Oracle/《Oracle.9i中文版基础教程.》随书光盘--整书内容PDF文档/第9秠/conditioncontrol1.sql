set  serveroutput on
declare
   number1 integer:=90;
   number2 integer:=60;
begin
   if number1>=number2 then
      dbms_output.put_line('number1大于等于number2');
   end if;   
end;   
