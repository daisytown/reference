REM remote_plan.sql

set long 2000
set arraysize 1

col operation format a22
col options format a8
col object_name format a10
col object_node format a5
col other format a20
col position format 99999
col optimizer format a10

select lpad(' ',2*(level-1))||operation operation,options,object_name,
optimizer,object_node,other
from plan_table
start with id=0 and statement_id='A'
connect by prior id=parent_id and statement_id='A';
set echo on


