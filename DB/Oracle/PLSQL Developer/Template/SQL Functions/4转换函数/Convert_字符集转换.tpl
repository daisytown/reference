Convert([#]char, dest_char_set, source_char_set)
--���ܣ���Դ�ַ���char��source_char_set�ַ���ת����dest_char_set�ַ�����
--����dest_char_set��Ŀ���ַ������ơ�
--����source_char_set��Դ�ַ��������ơ�Ĭ��ֵ�����ݿ���ַ�����
--�鿴ϵͳĬ���ַ�����select userenv('language') from dual;
--�鿴����ϵͳ�ַ�����select * from v$nls_valid_values where parameter='CHARACTERSET'