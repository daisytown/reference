ALTER TABLE "SCOTT"."STUDENT" 
    ADD (CONSTRAINT "研究生编号检查约束条件"
    CHECK(student_id>=20020101 and student_id<=20030909)) 