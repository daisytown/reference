exec dbms_stats.gather_table_stats(ownname => 'HR',tabname => 'T',estimate_percent => 10,method_opt=> 'for all indexed columns',cascade=>TRUE) ; 

select num_rows,blocks from user_tab_statistics where table_name='T';

��������䣺
  dbms_stats.gather_table_stats(user,'table',method_opt=>'for all indexed columns size 254',granularity=>'ALL',cascade=>TRUE);
dbms_stats.gather_index_stats(user,'index',degree=>2,granularity=>'ALL');
 
ת��:����:DBMS_STATS.GATHER_TABLE_STATSͳ�Ʊ�,��,������ͳ����Ϣ.

DBMS_STATS.GATHER_TABLE_STATS���﷨����:

DBMS_STATS.GATHER_TABLE_STATS (   ownname          VARCHAR2,     tabname          VARCHAR2,     partname         VARCHAR2,   estimate_percent NUMBER,     block_sample     BOOLEAN,   method_opt       VARCHAR2,   degree           NUMBER,   granularity      VARCHAR2,     cascade          BOOLEAN,   stattab          VARCHAR2,     statid           VARCHAR2,   statown          VARCHAR2,   no_invalidate    BOOLEAN,   force            BOOLEAN);
����˵��:

ownname:Ҫ�������ӵ����

tabname:Ҫ�����ı���.

partname:����������,ֻ�Է�����������������.

estimate_percent:�����еİٷֱ�,ȡֵ��Χ[0.000001,100],nullΪȫ������,������. ����:DBMS_STATS.AUTO_SAMPLE_SIZE��Ĭ��ֵ,��oracle�������ȡ����ֵ.

block_sapmple:�Ƿ��ÿ���������в���.

method_opt:����histograms��Ϣ��������ͳ�Ƶ�.method_opt��ȡֵ����:

for all columns:ͳ�������е�histograms.

for all indexed columns:ͳ������indexed�е�histograms.

for all hidden columns:ͳ���㿴�����е�histograms

for columns SIZE | REPEAT | AUTO | SKEWONLY:ͳ��ָ���е�histograms.N��ȡֵ��Χ[1,254]; REPEAT�ϴ�ͳ�ƹ���histograms;AUTO��oracle����N�Ĵ�С;SKEWONLY multiple end-points with the same value which is what we define by "there is skew in the data

degree:�������ж�.Ĭ��ֵΪnull.

granularity:Granularity of statistics to collect ,only pertinent if the table is partitioned.

cascace:���ռ���������Ϣ.Ĭ��Ϊfalase.

stattabָ��Ҫ�洢ͳ����Ϣ�ı�,statid���������ͳ����Ϣ�洢��ͬһ��stattab�����ڽ�������.statown�洢ͳ����Ϣ���ӵ����.����������������ָ��,ͳ����Ϣ��ֱ�Ӹ��µ������ֵ�.

no_invalidate: Does not invalidate the dependent cursors if set to TRUE. The procedure invalidates the dependent cursors immediately if set to FALSE.

force:��ʹ����ס��Ҳ�ռ�ͳ����Ϣ.

����:

execute dbms_stats.gather_table_stats(ownname => 'owner',tabname => 'table_name' ,estimate_percent => null ,method_opt => 'for all indexed columns' ,cascade => true);
