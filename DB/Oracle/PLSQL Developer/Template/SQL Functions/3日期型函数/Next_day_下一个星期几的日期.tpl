Next_day([#]date, day)
/*
�����ܡ�����������date�����ܣ����ڼ�(����day)������
����������date������,dayΪ�ַ���(����)��dayĬ��Ϊj������ǰ����)
����������day:���ı�ʾ������һ�����ڶ�������������������
		1��7���ֱ�ʾ��������Ϊһ�ܿ�ʼ��1��ʾ�����գ�2��������һ����
                Ӣ�ı�ʾ��MONDAY/MON��SUNDAY/ SUN(ִ�С�alter   session   set   NLS_DATE_LANGUAGE   =   American; ��������� )
�����ء�������
��ʾ����
select sysdate ��ʱ����,
next_day(sysdate,'������') ��һ��������,
next_day(sysdate,'����һ') ��һ������һ,
next_day(sysdate,'������') ��һ��������
 from dual;

select sysdate ��ʱ����,
next_day(sysdate,1) ��һ��������,
next_day(sysdate,2) ��һ������һ,
next_day(sysdate,7) ��һ��������
 from dual;
*/