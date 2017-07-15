/*定义过程参数*/
create or replace procedure scott.graduateprocess(
   tempzhengzhi  in  scott.graduate.zhengzhi%type,
   tempyingyu   in  scott.graduate.yingyu%type,
   tempzhuanye1 in  scott.graduate.zhuanye1%type,
   tempzhuanye2 in  scott.graduate.zhuanye2%type,
   tempzhuanye3 in  scott.graduate.zhuanye3%type,
   temptotalscore in  scott.result.totalscore%type) as
/*定义graduaterecord为记录型变量，临时存放通过游标从graduate数据表中提取的记录*/
   graduaterecord scott.graduate%rowtype;
/*定义graduatetotalscore为数值型变量，统计总分*/ 
  graduatetotalscore  scott.result.totalscore%type;
/*定义graduateflag为字符型变量，根据结果放入“落选”或“录取”，然后写入数据表result*/ 
   graduateflag  varchar2(4);
/*定义游标graduatecursor，存放的是所有的graduate数据表中的记录*/   
 cursor graduatecursor is 
   select * from scott.graduate;
/*定义异常处理errormessage*/   
errormessage exception;
/*开始执行*/  
begin
   /*打开游标*/  
 open  graduatecursor;
/*如果游标没有数据，激活异常处理*/  
    if graduatecursor%notfound  then
       raise errormessage;
    end if;    
/*游标有数据，指针指向第一条记录，每执行fetch命令，就自动下移，循环执行到记录提取完毕为止*/  
    loop 
      fetch graduatecursor into graduaterecord; 
/*计算总分*/  
graduatetotalscore:=graduaterecord.yingyu+graduaterecord.zhengzhi+graduaterecord.zhuanye1+graduaterecord.zhuanye2+graduaterecord.zhuanye3;
/*判断单科和总分是否满足录取要求，若满足，graduateflag变量值为“录取”，否则为“落选”*/  
if  (graduaterecord.yingyu>=tempyingyu      and   
    graduaterecord.zhengzhi>=tempzhengzhi   and
    graduaterecord.zhuanye1>=tempzhuanye1  and
    graduaterecord.zhuanye2>=tempzhuanye2   and
    graduaterecord.zhuanye3>=tempzhuanye3   and
    graduatetotalscore>=temptotalscore)        then
    graduateflag:='录取';
else
    graduateflag:='落选';
end if;
/*当游标数据提取完毕后，退出循环”*/  
exit when graduatecursor%notfound;
/*向结果数据表result中插入处理后的数据*/  
insert into scott.result(bh,xm,lb,zhengzhi,yingyu,zhuanye1,zhuanye2,zhuanye3,totalscore,flag) values(graduaterecord.bh,graduaterecord.xm,graduaterecord.lb,graduaterecord.zhengzhi,graduaterecord.yingyu,graduaterecord.zhuanye1,graduaterecord.zhuanye2,graduaterecord.zhuanye3,graduatetotalscore,graduateflag);
end loop;
/*关闭游标*/  
close graduatecursor;
/*提交结果*/  
commit;
/*异常处理，提示错误信息*/  
exception
when errormessage  then
    dbms_output.put_line('无法打开数据表');
/*程序执行结束”*/  
end;
