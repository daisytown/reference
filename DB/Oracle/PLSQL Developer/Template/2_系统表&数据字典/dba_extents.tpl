视图dba_extents包含了数据库中所有分区的信息。  
查看视图结构如下：
  sys@PDB1> desc dba_extents  Name             Null? Type   
  ----------------------------------------------------- -------- ------------------------------------  
  OWNER        VARCHAR2(128)  
  SEGMENT_NAME       VARCHAR2(128)  
  PARTITION_NAME       VARCHAR2(128)  
  SEGMENT_TYPE       VARCHAR2(18)  
  TABLESPACE_NAME      VARCHAR2(30)  
  EXTENT_ID       NUMBER  
  FILE_ID       NUMBER  
  BLOCK_ID       NUMBER  
  BYTES        NUMBER  
  BLOCKS        NUMBER  
  RELATIVE_FNO       NUMBER 
  
  其中：  注意：段是由区组成的。 
  OWNER 表示拥有者  
  SEGMENT_NAME：表示段名字  
  PARTITION_NAME：表示分区名字，如果没有分区则为空 
  SEGMENT_TYPE：表示段类型  
  TABLESPACE_NAME：表示表空间名字 
  EXTENT_ID: 区 的ID。  
  FILE_ID:  区所在文件ID  
  BLOCK_ID: 区所在块的ID  
  BYTES: 该区的字节  
  BLOCKS : 该区的块数量  
  RELATIVE_FNO:相对文件ID