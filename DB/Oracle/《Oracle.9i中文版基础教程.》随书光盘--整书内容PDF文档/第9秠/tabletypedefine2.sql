Declare
  type tabletype1 is table of testtable%rowtype index by binary_integer;
  table1 tabletype1;
begin
  select * into table1(60)
  from tempuser.testtable
  where recordnumber=60;
  dbms_output.put_line(table1(60).recordnumber||table1(60).currentdate);
end;
