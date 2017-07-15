set  serveroutput  on
create or replace procedure tempuser.tempprocedure as
  tempdate   tempuser.testtable.currentdate%type;
begin
  select  currentdate 
  into    tempdate
  from    testtable
  where   recordnumber=88;
  dbms_output.put_line(to_char(tempdate));
end;