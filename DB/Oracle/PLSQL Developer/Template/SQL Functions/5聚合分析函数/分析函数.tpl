oracle��������--SQL*PLUS����
һ���������
12.1 ����������ι���
�﷨ FUNCTION_NAME(<����>,��) OVER (<PARTITION BY ���ʽ,��> <ORDER BY ���ʽ <ASC DESC> <NULLS FIRST NULLS LAST>> <WINDOWING�Ӿ�>) PARTITION�Ӿ� ORDER BY�Ӿ� WINDOWING�Ӿ� ȱʡʱ�൱��RANGE UNBOUNDED PRECEDING 
1. ֵ��(RANGE WINDOW) 
RANGE N PRECEDING ������ֵ������������Ч,ѡ����Ϊ�����ǰ��֮ǰ,ĳ��(��������)ֵ����/С��(��ǰ�и���ֵ �C/+ N)��������,�����ORDER BY�Ӿ��й�ϵ�� 
2. �д�(ROW WINDOW) 
ROWS N PRECEDING ѡ����Ϊ��ǰ�м�֮ǰN�С� 
�����Լ���BETWEEN AND ��ʽ,����RANGE BETWEEN m PRECEDING AND n FOLLOWING 
���� AVG(<distinct all> eXPr) 
һ���ѡ�����б��ʽ��ƽ��ֵ CORR(expr, expr) ��COVAR_POP(exp1,exp2) / (STDDEV_POP(expr1) * STDDEV_POP(expr2)),�������ʽ�Ļ����,-1(�����) ~ 1(�����),0��ʾ����� 
COUNT(<distinct> <*> <expr>) ���� 
COVAR_POP(expr, expr) ����Э���� 
COVAR_SAMP(expr, expr) ����Э���� 
CUME_DIST �ۻ��ֲ�,���������е����λ��,����0 ~ 1 
DENSE_RANK �е��������(��ORDER BY����),��ͬ��ֵ����һ��������(NULL��Ϊ��ͬ),������������ 
FIRST_VALUE һ����ĵ�һ��ֵ 
LAG(expr, <offset>, <default>) ����֮ǰ����,OFFSET��ȱʡΪ1 ������,��ʾ�������,DEFAULT�ǵ�����ѡ������Χʱ�ķ���ֵ(���һ�в�����֮ǰ��) 
LAST_VALUE һ��������һ��ֵ 
LEAD(expr, <offset>, <default>) ����֮�����,OFFSET��ȱʡΪ1 ������,��ʾ�������,DEFAULT�ǵ�����ѡ������Χʱ�ķ���ֵ(������в�����֮ǰ��) 
MAX(expr) ���ֵ 
MIN(expr) ��Сֵ 
NTILE(expr) �����ʽ��ֵ���������е�λ�ñ��,����ʽΪ4,�����4��,�ֱ�Ϊ1 ~ 4��ֵ,�����ܵȷ������Ĳ�����ֵ��С������ 
PERCENT_RANK ����CUME_DIST,1/(�е����� - 1) 
RANK �������,��Ӧ����,���ճ������� 
RATIO_TO_REPORT(expr) ���ʽֵ / SUM(���ʽֵ) 
ROW_NUMBER ����������е�ƫ�� 
STDDEV(expr) ��׼�� 
STDDEV_POP(expr) �����׼�� 
STDDEV_SAMP(expr) ������׼�� 
SUM(expr) �ϼ� 
VAR_POP(expr) ���巽�� 
VAR_SAMP(expr) �������� 
VARIANCE(expr) ���� 
REGR_ xxxx(expr, expr) ���Իع麯�� 
REGR_SLOPE������б�ʣ�����COVAR_POP(expr1, expr2) / VAR_POP(expr2)
REGR_INTERCEPT�����ػع��ߵ�y�ؾ࣬����
AVG(expr1) - REGR_SLOPE(expr1, expr2) * AVG(expr2)
REGR_COUNT�������������ع��ߵķǿ����ֶԵ���Ŀ
REGR_R2�����ػع��ߵľ���ϵ��������ʽΪ��
If VAR_POP(expr2) = 0 then return NULL
If VAR_POP(expr1) = 0 and VAR_POP(expr2) != 0 then return 1
If VAR_POP(expr1) > 0 and VAR_POP(expr2 != 0 then 
return POWER(CORR(expr1,expr),2)
REGR_AVGX������ع��ߵ��Ա���(expr2)��ƽ��ֵ��ȥ���˿ն�(expr1, expr2)�󣬵���AVG(expr2)
REGR_AVGY������ع��ߵ�Ӧ����(expr1)��ƽ��ֵ��ȥ���˿ն�(expr1, expr2)�󣬵���AVG(expr1)
REGR_SXX�� ����ֵ����REGR_COUNT(expr1, expr2) * VAR_POP(expr2)
REGR_SYY�� ����ֵ����REGR_COUNT(expr1, expr2) * VAR_POP(expr1)
REGR_SXY: ����ֵ����REGR_COUNT(expr1, expr2) * COVAR_POP(expr1, expr2)


���ȣ������������������
create table students
(id number(15,0),
area varchar2(10),
stu_type varchar2(2),
score number(20,2));
insert into students values(1, '111', 'g', 80 );
insert into students values(1, '111', 'j', 80 );
insert into students values(1, '222', 'g', 89 );
insert into students values(1, '222', 'g', 68 );
insert into students values(2, '111', 'g', 80 );
insert into students values(2, '111', 'j', 70 );
insert into students values(2, '222', 'g', 60 );
insert into students values(2, '222', 'j', 65 );
insert into students values(3, '111', 'g', 75 );
insert into students values(3, '111', 'j', 58 );
insert into students values(3, '222', 'g', 58 );
insert into students values(3, '222', 'j', 90 );
insert into students values(4, '111', 'g', 89 );
insert into students values(4, '111', 'j', 90 );
insert into students values(4, '222', 'g', 90 );
insert into students values(4, '222', 'j', 89 );
commit;


��������Ӧ�ã�
1��������ͣ�
1��GROUP BY�Ӿ� 
--A��GROUPING SETS

select id,area,stu_type,sum(score) score 
from students
group by grouping sets((id,area,stu_type),(id,area),id)
order by id,area,stu_type;

/*--------���grouping sets
select a, b, c, sum( d ) from t
group by grouping sets ( a, b, c )

��Ч��

select * from (
select a, null, null, sum( d ) from t group by a
union all
select null, b, null, sum( d ) from t group by b 
union all
select null, null, c, sum( d ) from t group by c 
)
*/

--B��ROLLUP

select id,area,stu_type,sum(score) score 
from students
group by rollup(id,area,stu_type)
order by id,area,stu_type;

/*--------���rollup
select a, b, c, sum( d )
from t
group by rollup(a, b, c);

��Ч��

select * from (
select a, b, c, sum( d ) from t group by a, b, c 
union all
select a, b, null, sum( d ) from t group by a, b
union all
select a, null, null, sum( d ) from t group by a
union all
select null, null, null, sum( d ) from t
)
*/

--C��CUBE

select id,area,stu_type,sum(score) score 
from students
group by cube(id,area,stu_type)
order by id,area,stu_type;

/*--------���cube
select a, b, c, sum( d ) from t
group by cube( a, b, c)

��Ч��

select a, b, c, sum( d ) from t
group by grouping sets( 
( a, b, c ), 
( a, b ), ( a ), ( b, c ), 
( b ), ( a, c ), ( c ), 
() )
*/

--D��GROUPING
/*������Ľ�������Ǻ����׷���,ÿ��ͳ����������Ӧ���ж������null,
��������ֵ����Ǹ����Ǹ��ֶ����Ļ�����,grouping�����ж��Ƿ�ϼ���!*/

select decode(grouping(id),1,'all id',id) id,
decode(grouping(area),1,'all area',to_char(area)) area,
decode(grouping(stu_type),1,'all_stu_type',stu_type) stu_type,
sum(score) score
from students
group by cube(id,area,stu_type)
order by id,area,stu_type; 

����OVER()������ʹ��
1��ͳ�����Ρ���DENSE_RANK(),ROW_NUMBER()
1)���������Ρ����β���ϣ�DENSE_RANK()�������122344456����
��score��ID����������dense_rank() over(partition by id order by score desc)
��score������������dense_rank() over(order by score desc)
select id,area,score,
dense_rank() over(partition by id order by score desc) ����id����,
dense_rank() over(order by score desc) ����������
from students order by id,area;

2)�����������Ρ���ֵͬ���β��ظ���ROW_NUMBER()�������123456����
��score��ID����������row_number() over(partition by id order by score desc)
��score������������row_number() over(order by score desc)
select id,area,score,
row_number() over(partition by id order by score desc) ����id����,
row_number() over(order by score desc) ����������
from students order by id,area;

3)���������Ρ����������Զ���ȱ��rank()�������12245558����
��score��ID����������rank() over(partition by id order by score desc)
��score������������rank() over(order by score desc)
select id,area,score,
rank() over(partition by id order by score desc) ����id����,
rank() over(order by score desc) ����������
from students order by id,area;

4)���η�����cume_dist()����-�������/�ܸ��� 
������cume_dist() over(order by id)
select id,area,score,
cume_dist() over(order by id) a, --��ID�������/�ܸ��� 
cume_dist() over(partition by id order by score desc) b, --ID�����У�scroe�������ֵ/�����ܸ���
row_number() over (order by id) ��¼��
from students order by id,area;


5)����cume_dist()�����������Ρ����������Զ���ȱ��ȡ���к�ϴ����Σ������22355778����
��score��ID����������cume_dist() over(partition by id order by score desc)*sum(1) over(partition by id)
��score������������cume_dist() over(order by score desc)*sum(1) over()
select id,area,score,
sum(1) over() as ����,
sum(1) over(partition by id) as �������,
(cume_dist() over(partition by id order by score desc))*(sum(1) over(partition by id)) ����id����,
(cume_dist() over(order by score desc))*(sum(1) over()) ����������
from students order by id,area

2������ͳ�ƣ���sum(),max(),avg(),RATIO_TO_REPORT()
select id,area,
sum(1) over() as �ܼ�¼��, 
sum(1) over(partition by id) as �����¼��,
sum(score) over() as �ܼ� , 
sum(score) over(partition by id) as �������,
sum(score) over(order by id) as  �����������,
sum(score) over(partition by id,area) as ����ID��area���,
sum(score) over(partition by id order by area) as ����ID��������area���,
max(score) over() as ���ֵ,
max(score) over(partition by id) as �������ֵ,
max(score) over(order by id) as �����������ֵ,
max(score) over(partition by id,area) as ����ID��area�����ֵ,
max(score) over(partition by id order by area) as ����ID��������area�����ֵ,
avg(score) over() as ����ƽ��,
avg(score) over(partition by id) as ����ƽ��,
avg(score) over(order by id) as ��������ƽ��,
avg(score) over(partition by id,area) as ����ID��areaƽ��,
avg(score) over(partition by id order by area) as ����ID��������areaƽ��,
RATIO_TO_REPORT(score) over() as "ռ����%",
RATIO_TO_REPORT(score) over(partition by id) as "ռ����%",
score from students;

3��LAG(COL,n,default)��LEAD(OL,n,default) --ȡǰ���N������
ȡǰ���¼��ֵ��lag(score,n,x) over(order by id)
ȡ�����¼��ֵ��lead(score,n,x) over(order by id) 
������n��ʾ�ƶ�N����¼��X��ʾ������ʱ���ֵ��iD��ʾ������
select id,lag(score,1,0) over(order by id) lg,score from students;
select id,lead(score,1,0) over(order by id) lg,score from students;

4��FIRST_VALUE()��LAST_VALUE()
ȡ����ʼ1��ֵ��first_value(score,n) over(order by id)
ȡ�����1��ֵ��LAST_value(score,n) over(order by id)
select id,first_value(score) over(order by id) fv,score from students;
select id,last_value(score) over(order by id) fv,score from students;

