Next_day([#]date, day)
/*
【功能】：返回日期date在下周，星期几(参数day)的日期
【参数】：date日期型,day为字符型(参数)，day默认为j（即当前日期)
【参数表】：day:中文表示：星期一，星期二，星期三……星期日
		1～7数字表示：星期日为一周开始，1表示星期日，2代表星期一……
                英文表示：MONDAY/MON～SUNDAY/ SUN(执行“alter   session   set   NLS_DATE_LANGUAGE   =   American; ”后才能用 )
【返回】：日期
【示例】
select sysdate 当时日期,
next_day(sysdate,'星期日') 下一个星期日,
next_day(sysdate,'星期一') 下一个星期一,
next_day(sysdate,'星期六') 下一个星期六
 from dual;

select sysdate 当时日期,
next_day(sysdate,1) 下一个星期日,
next_day(sysdate,2) 下一个星期一,
next_day(sysdate,7) 下一个星期六
 from dual;
*/