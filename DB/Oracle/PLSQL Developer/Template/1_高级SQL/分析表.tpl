exec dbms_stats.gather_table_stats(ownname => 'HR',tabname => 'T',estimate_percent => 10,method_opt=> 'for all indexed columns',cascade=>TRUE) ; 

select num_rows,blocks from user_tab_statistics where table_name='T';

分析表语句：
  dbms_stats.gather_table_stats(user,'table',method_opt=>'for all indexed columns size 254',granularity=>'ALL',cascade=>TRUE);
dbms_stats.gather_index_stats(user,'index',degree=>2,granularity=>'ALL');
 
转载:作用:DBMS_STATS.GATHER_TABLE_STATS统计表,列,索引的统计信息.

DBMS_STATS.GATHER_TABLE_STATS的语法如下:

DBMS_STATS.GATHER_TABLE_STATS (   ownname          VARCHAR2,     tabname          VARCHAR2,     partname         VARCHAR2,   estimate_percent NUMBER,     block_sample     BOOLEAN,   method_opt       VARCHAR2,   degree           NUMBER,   granularity      VARCHAR2,     cascade          BOOLEAN,   stattab          VARCHAR2,     statid           VARCHAR2,   statown          VARCHAR2,   no_invalidate    BOOLEAN,   force            BOOLEAN);
参数说明:

ownname:要分析表的拥有者

tabname:要分析的表名.

partname:分区的名字,只对分区表或分区索引有用.

estimate_percent:采样行的百分比,取值范围[0.000001,100],null为全部分析,不采样. 常量:DBMS_STATS.AUTO_SAMPLE_SIZE是默认值,由oracle决定最佳取采样值.

block_sapmple:是否用块采样代替行采样.

method_opt:决定histograms信息是怎样被统计的.method_opt的取值如下:

for all columns:统计所有列的histograms.

for all indexed columns:统计所有indexed列的histograms.

for all hidden columns:统计你看不到列的histograms

for columns SIZE | REPEAT | AUTO | SKEWONLY:统计指定列的histograms.N的取值范围[1,254]; REPEAT上次统计过的histograms;AUTO由oracle决定N的大小;SKEWONLY multiple end-points with the same value which is what we define by "there is skew in the data

degree:决定并行度.默认值为null.

granularity:Granularity of statistics to collect ,only pertinent if the table is partitioned.

cascace:是收集索引的信息.默认为falase.

stattab指定要存储统计信息的表,statid假如多个表的统计信息存储在同一个stattab中用于进行区分.statown存储统计信息表的拥有者.以上三个参数若不指定,统计信息会直接更新到数据字典.

no_invalidate: Does not invalidate the dependent cursors if set to TRUE. The procedure invalidates the dependent cursors immediately if set to FALSE.

force:即使表锁住了也收集统计信息.

例子:

execute dbms_stats.gather_table_stats(ownname => 'owner',tabname => 'table_name' ,estimate_percent => null ,method_opt => 'for all indexed columns' ,cascade => true);
