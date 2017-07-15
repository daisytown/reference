oracle分析函数--SQL*PLUS环境
一、总体介绍
12.1 分析函数如何工作
语法 FUNCTION_NAME(<参数>,…) OVER (<PARTITION BY 表达式,…> <ORDER BY 表达式 <ASC DESC> <NULLS FIRST NULLS LAST>> <WINDOWING子句>) PARTITION子句 ORDER BY子句 WINDOWING子句 缺省时相当于RANGE UNBOUNDED PRECEDING 
1. 值域窗(RANGE WINDOW) 
RANGE N PRECEDING 仅对数值或日期类型有效,选定窗为排序后当前行之前,某列(即排序列)值大于/小于(当前行该列值 –/+ N)的所有行,因此与ORDER BY子句有关系。 
2. 行窗(ROW WINDOW) 
ROWS N PRECEDING 选定窗为当前行及之前N行。 
还可以加上BETWEEN AND 形式,例如RANGE BETWEEN m PRECEDING AND n FOLLOWING 
函数 AVG(<distinct all> eXPr) 
一组或选定窗中表达式的平均值 CORR(expr, expr) 即COVAR_POP(exp1,exp2) / (STDDEV_POP(expr1) * STDDEV_POP(expr2)),两个表达式的互相关,-1(反相关) ~ 1(正相关),0表示不相关 
COUNT(<distinct> <*> <expr>) 计数 
COVAR_POP(expr, expr) 总体协方差 
COVAR_SAMP(expr, expr) 样本协方差 
CUME_DIST 累积分布,即行在组中的相对位置,返回0 ~ 1 
DENSE_RANK 行的相对排序(与ORDER BY搭配),相同的值具有一样的序数(NULL计为相同),并不留空序数 
FIRST_VALUE 一个组的第一个值 
LAG(expr, <offset>, <default>) 访问之前的行,OFFSET是缺省为1 的正数,表示相对行数,DEFAULT是当超出选定窗范围时的返回值(如第一行不存在之前行) 
LAST_VALUE 一个组的最后一个值 
LEAD(expr, <offset>, <default>) 访问之后的行,OFFSET是缺省为1 的正数,表示相对行数,DEFAULT是当超出选定窗范围时的返回值(如最后行不存在之前行) 
MAX(expr) 最大值 
MIN(expr) 最小值 
NTILE(expr) 按表达式的值和行在组中的位置编号,如表达式为4,则组分4份,分别为1 ~ 4的值,而不能等分则多出的部分在值最小的那组 
PERCENT_RANK 类似CUME_DIST,1/(行的序数 - 1) 
RANK 相对序数,答应并列,并空出随后序号 
RATIO_TO_REPORT(expr) 表达式值 / SUM(表达式值) 
ROW_NUMBER 排序的组中行的偏移 
STDDEV(expr) 标准差 
STDDEV_POP(expr) 总体标准差 
STDDEV_SAMP(expr) 样本标准差 
SUM(expr) 合计 
VAR_POP(expr) 总体方差 
VAR_SAMP(expr) 样本方差 
VARIANCE(expr) 方差 
REGR_ xxxx(expr, expr) 线性回归函数 
REGR_SLOPE：返回斜率，等于COVAR_POP(expr1, expr2) / VAR_POP(expr2)
REGR_INTERCEPT：返回回归线的y截距，等于
AVG(expr1) - REGR_SLOPE(expr1, expr2) * AVG(expr2)
REGR_COUNT：返回用于填充回归线的非空数字对的数目
REGR_R2：返回回归线的决定系数，计算式为：
If VAR_POP(expr2) = 0 then return NULL
If VAR_POP(expr1) = 0 and VAR_POP(expr2) != 0 then return 1
If VAR_POP(expr1) > 0 and VAR_POP(expr2 != 0 then 
return POWER(CORR(expr1,expr),2)
REGR_AVGX：计算回归线的自变量(expr2)的平均值，去掉了空对(expr1, expr2)后，等于AVG(expr2)
REGR_AVGY：计算回归线的应变量(expr1)的平均值，去掉了空对(expr1, expr2)后，等于AVG(expr1)
REGR_SXX： 返回值等于REGR_COUNT(expr1, expr2) * VAR_POP(expr2)
REGR_SYY： 返回值等于REGR_COUNT(expr1, expr2) * VAR_POP(expr1)
REGR_SXY: 返回值等于REGR_COUNT(expr1, expr2) * COVAR_POP(expr1, expr2)


首先：创建表及接入测试数据
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


二、具体应用：
1、分组求和：
1）GROUP BY子句 
--A、GROUPING SETS

select id,area,stu_type,sum(score) score 
from students
group by grouping sets((id,area,stu_type),(id,area),id)
order by id,area,stu_type;

/*--------理解grouping sets
select a, b, c, sum( d ) from t
group by grouping sets ( a, b, c )

等效于

select * from (
select a, null, null, sum( d ) from t group by a
union all
select null, b, null, sum( d ) from t group by b 
union all
select null, null, c, sum( d ) from t group by c 
)
*/

--B、ROLLUP

select id,area,stu_type,sum(score) score 
from students
group by rollup(id,area,stu_type)
order by id,area,stu_type;

/*--------理解rollup
select a, b, c, sum( d )
from t
group by rollup(a, b, c);

等效于

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

--C、CUBE

select id,area,stu_type,sum(score) score 
from students
group by cube(id,area,stu_type)
order by id,area,stu_type;

/*--------理解cube
select a, b, c, sum( d ) from t
group by cube( a, b, c)

等效于

select a, b, c, sum( d ) from t
group by grouping sets( 
( a, b, c ), 
( a, b ), ( a ), ( b, c ), 
( b ), ( a, c ), ( c ), 
() )
*/

--D、GROUPING
/*从上面的结果中我们很容易发现,每个统计数据所对应的行都会出现null,
如何来区分到底是根据那个字段做的汇总呢,grouping函数判断是否合计列!*/

select decode(grouping(id),1,'all id',id) id,
decode(grouping(area),1,'all area',to_char(area)) area,
decode(grouping(stu_type),1,'all_stu_type',stu_type) stu_type,
sum(score) score
from students
group by cube(id,area,stu_type)
order by id,area,stu_type; 

二、OVER()函数的使用
1、统计名次——DENSE_RANK(),ROW_NUMBER()
1)允许并列名次、名次不间断，DENSE_RANK()，结果如122344456……
将score按ID分组排名：dense_rank() over(partition by id order by score desc)
将score不分组排名：dense_rank() over(order by score desc)
select id,area,score,
dense_rank() over(partition by id order by score desc) 分组id排序,
dense_rank() over(order by score desc) 不分组排序
from students order by id,area;

2)不允许并列名次、相同值名次不重复，ROW_NUMBER()，结果如123456……
将score按ID分组排名：row_number() over(partition by id order by score desc)
将score不分组排名：row_number() over(order by score desc)
select id,area,score,
row_number() over(partition by id order by score desc) 分组id排序,
row_number() over(order by score desc) 不分组排序
from students order by id,area;

3)允许并列名次、复制名次自动空缺，rank()，结果如12245558……
将score按ID分组排名：rank() over(partition by id order by score desc)
将score不分组排名：rank() over(order by score desc)
select id,area,score,
rank() over(partition by id order by score desc) 分组id排序,
rank() over(order by score desc) 不分组排序
from students order by id,area;

4)名次分析，cume_dist()——-最大排名/总个数 
函数：cume_dist() over(order by id)
select id,area,score,
cume_dist() over(order by id) a, --按ID最大排名/总个数 
cume_dist() over(partition by id order by score desc) b, --ID分组中，scroe最大排名值/本组总个数
row_number() over (order by id) 记录号
from students order by id,area;


5)利用cume_dist()，允许并列名次、复制名次自动空缺，取并列后较大名次，结果如22355778……
将score按ID分组排名：cume_dist() over(partition by id order by score desc)*sum(1) over(partition by id)
将score不分组排名：cume_dist() over(order by score desc)*sum(1) over()
select id,area,score,
sum(1) over() as 总数,
sum(1) over(partition by id) as 分组个数,
(cume_dist() over(partition by id order by score desc))*(sum(1) over(partition by id)) 分组id排序,
(cume_dist() over(order by score desc))*(sum(1) over()) 不分组排序
from students order by id,area

2、分组统计－－sum(),max(),avg(),RATIO_TO_REPORT()
select id,area,
sum(1) over() as 总记录数, 
sum(1) over(partition by id) as 分组记录数,
sum(score) over() as 总计 , 
sum(score) over(partition by id) as 分组求和,
sum(score) over(order by id) as  分组连续求和,
sum(score) over(partition by id,area) as 分组ID和area求和,
sum(score) over(partition by id order by area) as 分组ID并连续按area求和,
max(score) over() as 最大值,
max(score) over(partition by id) as 分组最大值,
max(score) over(order by id) as 分组连续最大值,
max(score) over(partition by id,area) as 分组ID和area求最大值,
max(score) over(partition by id order by area) as 分组ID并连续按area求最大值,
avg(score) over() as 所有平均,
avg(score) over(partition by id) as 分组平均,
avg(score) over(order by id) as 分组连续平均,
avg(score) over(partition by id,area) as 分组ID和area平均,
avg(score) over(partition by id order by area) as 分组ID并连续按area平均,
RATIO_TO_REPORT(score) over() as "占所有%",
RATIO_TO_REPORT(score) over(partition by id) as "占分组%",
score from students;

3、LAG(COL,n,default)、LEAD(OL,n,default) --取前后边N条数据
取前面记录的值：lag(score,n,x) over(order by id)
取后面记录的值：lead(score,n,x) over(order by id) 
参数：n表示移动N条记录，X表示不存在时填充值，iD表示排序列
select id,lag(score,1,0) over(order by id) lg,score from students;
select id,lead(score,1,0) over(order by id) lg,score from students;

4、FIRST_VALUE()、LAST_VALUE()
取第起始1行值：first_value(score,n) over(order by id)
取第最后1行值：LAST_value(score,n) over(order by id)
select id,first_value(score) over(order by id) fv,score from students;
select id,last_value(score) over(order by id) fv,score from students;

