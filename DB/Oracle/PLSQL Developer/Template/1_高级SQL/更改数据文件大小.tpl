--��ѯÿ����ռ����Ŀ�ռ�õĿռ�
SELECT MAX(block_id),MAX(block_id)*8/1024 as M,tablespace_name
  FROM dba_extents
 GROUP BY tablespace_name ;
 
--���ģ���ʱ���ļ����ļ���СΪ��M�ֶ��Դ�
ALTER DATABASE TEMPFILE  'D:\oracle\product\10.2.0\oradata\localdb\TEMP01.DBF' RESIZE 380M;
--�����ļ���С
ALTER DATABASE DATAFILE 'D:\oracle\product\10.2.0\oradata\localdb\SYSAUX01.DBF' RESIZE 290M;
