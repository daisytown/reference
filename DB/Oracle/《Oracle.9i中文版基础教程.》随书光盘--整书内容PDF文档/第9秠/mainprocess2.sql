set  serveroutput  on 
/*����6����ڱ������ֱ��Ӧgraduate���ݱ��е�רҵ�κ��ַܷ�����*/
declare 		
    score1 number(4,1);
    score2 number(4,1);
    score3 number(4,1);
    score4 number(4,1);
    score5 number(4,1);
    scoretotal number(5,1);
/*�������߸�ֵ���������޸ĸ�ֵ�ʹ���ͬ�ķ�����*/
begin
    score1:=65;
    score2:=64;
    score3:=62;
    score4:=70;
    score5:=65;
    scoretotal:=335;
/*���ô������*/
    scott.graduateprocess(score1,score2,score3,score4,score5,scoretotal);   
end;