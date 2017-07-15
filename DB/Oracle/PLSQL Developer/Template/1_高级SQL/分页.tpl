--方式1：根据ROWID来分
select * from t_xiaoxi where rowid in(select rid from (select rownum rn,rid from(select rowid rid,cid from
t_xiaoxi  order by cid desc) where rownum<10000) where rn>9980) order by cid desc;
 
--方式2:按分析函数来分
select * from (select t.*,row_number() over(order by cid desc) rk from t_xiaoxi t) where rk<10000 and rk>9980;

--方式3：按ROWNUM来分
select * from(select t.*,rownum rn from(select * from t_xiaoxi order by cid desc) t where rownum<10000) where
rn>9980;

--其中t_xiaoxi为表名称，cid为表的关键字段，取按CID降序排序后的第9981-9999条记录，t_xiaoxi表有70000多条记录
--效率1>3>2
