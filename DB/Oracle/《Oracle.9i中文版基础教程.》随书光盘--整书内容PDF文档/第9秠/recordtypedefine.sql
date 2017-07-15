set serveroutput on
declare
   type myrecord is record(
      myrecordnumber int,
      mycurrentdate date);
   srecord myrecord;
begin
   select  *  into  srecord   from  tempuser.testtable  where recordnumber=68;
   dbms_output.put_line(srecord.mycurrentdate);
end;
