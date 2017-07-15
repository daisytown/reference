Declare
  mytable testtable%rowtype;
begin
  select * into mytable 
  from  tempuser.testtable
  where recordnumber=88;
  dbms_output.put_line(mytable.currentdate);
end;
