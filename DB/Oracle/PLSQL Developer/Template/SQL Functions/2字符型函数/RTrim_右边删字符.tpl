RTrim([#]char, set)
--LTrim��RTrim��ȡֵ���������ַ���Trim������
/*SELECT RTRIM('AHello_AB', 'AB_') a1, --��ȡ�ұ߶���ַ���˳�򲻶�
       RTRIM('AHello_AFAB', 'AB_') a2, --�м������������ֹͣ��ȡ
       RTRIM('     B_FAHello   ') a3 --��ȡ�ұ߿ո�
  FROM dual;*/