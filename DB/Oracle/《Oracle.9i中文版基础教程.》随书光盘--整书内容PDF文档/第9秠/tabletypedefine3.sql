set serveroutput on
Declare
  type tabletype1 is table of varchar2(9) index by binary_integer;
  table1 tabletype1;
begin
  table1(1):='成都市';
  table1(2):='北京市';
  table1(3):='青岛市';
  dbms_output.put_line('总记录数：'||to_char(table1.count));
  dbms_output.put_line('第一条记录：'||table1.first);
  dbms_output.put_line('最后条记录：'||table1.last);
  dbms_output.put_line('第二条的前一条记录：'||table1.prior(2));
  dbms_output.put_line('第二条的后一条记录：'||table1.next(2));
end;
