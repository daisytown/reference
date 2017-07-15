/*������̲���*/
create or replace procedure scott.graduateprocess(
   tempzhengzhi  in  scott.graduate.zhengzhi%type,
   tempyingyu   in  scott.graduate.yingyu%type,
   tempzhuanye1 in  scott.graduate.zhuanye1%type,
   tempzhuanye2 in  scott.graduate.zhuanye2%type,
   tempzhuanye3 in  scott.graduate.zhuanye3%type,
   temptotalscore in  scott.result.totalscore%type) as
/*����graduaterecordΪ��¼�ͱ�������ʱ���ͨ���α��graduate���ݱ�����ȡ�ļ�¼*/
   graduaterecord scott.graduate%rowtype;
/*����graduatetotalscoreΪ��ֵ�ͱ�����ͳ���ܷ�*/ 
  graduatetotalscore  scott.result.totalscore%type;
/*����graduateflagΪ�ַ��ͱ��������ݽ�����롰��ѡ����¼ȡ����Ȼ��д�����ݱ�result*/ 
   graduateflag  varchar2(4);
/*�����α�graduatecursor����ŵ������е�graduate���ݱ��еļ�¼*/   
 cursor graduatecursor is 
   select * from scott.graduate;
/*�����쳣����errormessage*/   
errormessage exception;
/*��ʼִ��*/  
begin
   /*���α�*/  
 open  graduatecursor;
/*����α�û�����ݣ������쳣����*/  
    if graduatecursor%notfound  then
       raise errormessage;
    end if;    
/*�α������ݣ�ָ��ָ���һ����¼��ÿִ��fetch������Զ����ƣ�ѭ��ִ�е���¼��ȡ���Ϊֹ*/  
    loop 
      fetch graduatecursor into graduaterecord; 
/*�����ܷ�*/  
graduatetotalscore:=graduaterecord.yingyu+graduaterecord.zhengzhi+graduaterecord.zhuanye1+graduaterecord.zhuanye2+graduaterecord.zhuanye3;
/*�жϵ��ƺ��ܷ��Ƿ�����¼ȡҪ�������㣬graduateflag����ֵΪ��¼ȡ��������Ϊ����ѡ��*/  
if  (graduaterecord.yingyu>=tempyingyu      and   
    graduaterecord.zhengzhi>=tempzhengzhi   and
    graduaterecord.zhuanye1>=tempzhuanye1  and
    graduaterecord.zhuanye2>=tempzhuanye2   and
    graduaterecord.zhuanye3>=tempzhuanye3   and
    graduatetotalscore>=temptotalscore)        then
    graduateflag:='¼ȡ';
else
    graduateflag:='��ѡ';
end if;
/*���α�������ȡ��Ϻ��˳�ѭ����*/  
exit when graduatecursor%notfound;
/*�������ݱ�result�в��봦��������*/  
insert into scott.result(bh,xm,lb,zhengzhi,yingyu,zhuanye1,zhuanye2,zhuanye3,totalscore,flag) values(graduaterecord.bh,graduaterecord.xm,graduaterecord.lb,graduaterecord.zhengzhi,graduaterecord.yingyu,graduaterecord.zhuanye1,graduaterecord.zhuanye2,graduaterecord.zhuanye3,graduatetotalscore,graduateflag);
end loop;
/*�ر��α�*/  
close graduatecursor;
/*�ύ���*/  
commit;
/*�쳣������ʾ������Ϣ*/  
exception
when errormessage  then
    dbms_output.put_line('�޷������ݱ�');
/*����ִ�н�����*/  
end;
