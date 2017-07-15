CREATE OR REPLACE VIEW "SCOTT"."STUDENT数据表视图" AS 
    select student_id,name  
    from  scott.student WITH READ ONLY