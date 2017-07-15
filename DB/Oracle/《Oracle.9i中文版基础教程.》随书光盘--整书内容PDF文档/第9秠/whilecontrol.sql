set  serveroutput on
declare
   number1 integer:=80;
   number2 integer:=90;
   i integer:=0;
begin
   while number1<number2 loop
     number1:=number1+1;
     i:=i+1;
   end loop;
  dbms_output.put_line('共循环次数:'||to_char(i)); 
end;   
