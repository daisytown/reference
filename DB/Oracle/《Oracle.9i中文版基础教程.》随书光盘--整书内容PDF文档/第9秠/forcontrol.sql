set  serveroutput on
declare
   number1 integer:=80;
   number2 integer:=90;
   i integer:=0;
begin
   for  i  in 1..10  loop
     number1:=number1+1;
   end loop;
  dbms_output.put_line('number1µÄÖµ:'||to_char(number1)); 
end;   
