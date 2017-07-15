Declare
  type tabletype1 is table of varchar2(4) index by binary_integer;
  type tabletype2 is table of tempuser.testtable.recordnumber%type  index by binary_integer;
  table1 tabletype1;
  table2 tabletype2;
begin
  table1(1):='大学';
  table1(2):='大专';
  table2(1):=88;
  table2(2):=55;
  dbms_output.put_line(table1(1)||table2(1));
  dbms_output.put_line(table1(2)||table2(2));
end;
