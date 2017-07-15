set serveroutput on
declare
  maxrecords constant int:=100;
  i int :=1;
begin
  for i in 1..maxrecords loop
    insert  into tempuser.testtable(recordnumber,currentdate)
    values(i,sysdate);
  end loop;
dbms_output.put_line('成功录入数据！');
commit;
end;