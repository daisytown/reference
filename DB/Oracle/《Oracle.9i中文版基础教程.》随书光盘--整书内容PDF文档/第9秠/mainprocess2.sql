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
    score1:=65;
    score2:=64;
    score3:=62;
    score4:=70;
    score5:=65;
    scoretotal:=335;
/*调用处理过程*/
    scott.graduateprocess(score1,score2,score3,score4,score5,scoretotal);   
end;