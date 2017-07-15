set  serveroutput on
declare
   number1 integer:=80;
   number2 integer:=90;
   i integer:=0;
begin
   loop
     number1:=number1+1;
     if number1=number2  then
       exit;
     else
       i:=i+1;
     end if;  
   end loop;
  dbms_output.put_line('共循环次数:'||to_char(i)); 
end;   
