set serveroutput on
Declare
  type tabletype1 is table of varchar2(9) index by binary_integer;
  table1 tabletype1;
begin
  table1(1):='�ɶ���';
  table1(2):='������';
  table1(3):='�ൺ��';
  dbms_output.put_line('�ܼ�¼����'||to_char(table1.count));
  dbms_output.put_line('��һ����¼��'||table1.first);
  dbms_output.put_line('�������¼��'||table1.last);
  dbms_output.put_line('�ڶ�����ǰһ����¼��'||table1.prior(2));
  dbms_output.put_line('�ڶ����ĺ�һ����¼��'||table1.next(2));
end;
