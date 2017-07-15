--查询每个表空间最大的块占用的空间
SELECT MAX(block_id),MAX(block_id)*8/1024 as M,tablespace_name
  FROM dba_extents
 GROUP BY tablespace_name ;
 
--更改（临时区文件）文件大小为比M字段稍大
ALTER DATABASE TEMPFILE  'D:\oracle\product\10.2.0\oradata\localdb\TEMP01.DBF' RESIZE 380M;
--更改文件大小
ALTER DATABASE DATAFILE 'D:\oracle\product\10.2.0\oradata\localdb\SYSAUX01.DBF' RESIZE 290M;
