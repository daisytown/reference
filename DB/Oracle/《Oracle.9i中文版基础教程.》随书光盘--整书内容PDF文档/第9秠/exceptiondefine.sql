set serveroutput on
declare
   salaryerror  exception;
   tempsal scott.emp.sal%type;
begin
   select sal into tempsal 
   from scott.emp 
   where empno=7566;
   
   if tempsal<900 or tempsal>2600  then
      raise salaryerror;
   end if;    
   
   exception
   when salaryerror  then
     dbms_output.put_line('Ð½Ë®³¬³ö·¶Î§');
end; 