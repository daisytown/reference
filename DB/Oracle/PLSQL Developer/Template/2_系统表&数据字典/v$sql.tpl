SELECT   
SQL_TEXT  ,--  当前正在执行的游标的sql文本的前1000个字符
SQL_FULLTEXT  ,--  CLOB类型 整个sql文本，不用借助于V$SQL_TEXT视图来查看整个文本
SQL_ID  ,--  库缓存中的SQL父游标的标志
SHARABLE_MEM  ,--  子游标使用的共享内存的大小,bytes
PERSISTENT_MEM  ,--  子游标生存时间中使用的固定内存的总量,bytes
RUNTIME_MEM  ,--  在子游标执行过程中需要的固定内存大小，bytes
SORTS  ,--  子游标发生的排序数量
LOADED_VERSIONS  ,--  显示上下文堆是否载入，1是，0否
OPEN_VERSIONS  ,--  
USERS_OPENING  ,--  执行这个sql的用户数
FETCHES  ,--  sql取数据的次数
EXECUTIONS  ,--  自从被载入共享池后，sql执行的次数 
PX_SERVERS_EXECUTIONS  ,--  
END_OF_FETCH_COUNT  ,--  
USERS_EXECUTING  ,--  
LOADS  ,--  
FIRST_LOAD_TIME  ,--  父游标产生的时间戳
INVALIDATIONS  ,--  该子游标的无效次数
PARSE_CALLS  ,--  解析调用的次数 
DISK_READS  ,--  读磁盘的次数
DIRECT_WRITES  ,--  直接写的次数
BUFFER_GETS  ,--  直接从buffer中得到数据的次数
APPLICATION_WAIT_TIME  ,--  应用等待时间，毫秒
CONCURRENCY_WAIT_TIME  ,--  并发等待时间，毫秒
CLUSTER_WAIT_TIME  ,--  
USER_IO_WAIT_TIME  ,--  用户IO等待时间
PLSQL_EXEC_TIME  ,--  
JAVA_EXEC_TIME  ,--  
ROWS_PROCESSED  ,--  解析sql返回的总行数
COMMAND_TYPE  ,--  
OPTIMIZER_MODE  ,--  优化器模式
OPTIMIZER_COST  ,--  优化器对于sql给出的成本
OPTIMIZER_ENV  ,--  
OPTIMIZER_ENV_HASH_VALUE  ,--  
PARSING_USER_ID  ,--  第一个创建这个子游标的用户id
PARSING_SCHEMA_ID  ,--  
PARSING_SCHEMA_NAME  ,--  
KEPT_VERSIONS  ,--  
ADDRESS  ,--  
TYPE_CHK_HEAP  ,--  (v$sql表有，v$sqlarea表没有)
HASH_VALUE  ,--  解析产生的哈希值
OLD_HASH_VALUE  ,--  
PLAN_HASH_VALUE  ,--  
CHILD_NUMBER  ,--  该子游标的数量(v$sql表有，v$sqlarea表没有)
SERVICE  ,--  服务名(v$sql表有，v$sqlarea表没有)
SERVICE_HASH  ,--  (v$sql表有，v$sqlarea表没有)
MODULE  ,--  第一次解析该语句时,通过DBMS_APPLICAITON_INFO.SET_ACTION设置的模块名
MODULE_HASH  ,--  
ACTION  ,--  第一次解析该语句时,通过DBMS_APPLICAITON_INFO.SET_ACTION设置的动作名 
ACTION_HASH  ,--  
SERIALIZABLE_ABORTS  ,--  
OUTLINE_CATEGORY  ,--  
CPU_TIME  ,--  该子游标解析，执行和获取数据使用的CPU时间，毫秒
ELAPSED_TIME  ,--  sql的执行时间，毫秒
OUTLINE_SID  ,--  
CHILD_ADDRESS  ,--  (v$sql表有，v$sqlarea表没有)
SQLTYPE  ,--  (v$sql表有，v$sqlarea表没有)
REMOTE  ,--  
OBJECT_STATUS  ,--  
LITERAL_HASH_VALUE  ,--  
LAST_LOAD_TIME  ,--  
IS_OBSOLETE  ,--  标记该子游标过期与否，当子游标过大时会发生这种情况
CHILD_LATCH  ,--  
SQL_PROFILE  ,--  
PROGRAM_ID  ,--  
PROGRAM_LINE#  ,--  
EXACT_MATCHING_SIGNATURE  ,--  
FORCE_MATCHING_SIGNATURE  ,--  
LAST_ACTIVE_TIME  ,--  
BIND_DATA  ,--  
TYPECHECK_MEM  --  
FROM v$sql  
