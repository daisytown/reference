set  serveroutput  on 
/*定义6个入口变量，分别对应graduate数据表中的专业课和总分分数线*/
declare 		
    score1 number(4,1);
    score2 number(4,1);
    score3 number(4,1);
    score4 number(4,1);
    score5 number(4,1);
    scoretotal number(5,1);
/*将分数线赋值，在这里修改各值就代表不同的分数线*/
begin
    score1:=60;
    score2:=65;
    score3:=66;
    score4:=62;
    score5:=64;
    scoretotal:=325;
/*调用处理过程*/
    scott.graduateprocess(score1,score2,score3,score4,score5,scoretotal);   
end;