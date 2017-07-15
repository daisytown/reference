rem plan.sql - displays contents of the explain plan table
set pages 9999;
select  lpad(' ',2*(level-1))||operation operation,
                options, 
                object_name, 
                position,
                other_tag
from plan_table
start with id=0 
and 
statement_id = 'test3'
connect by prior id = parent_id
and
statement_id = 'test3';
