--**************************************************************
--   pq_plan.sql
--
--   © 2001 by Donald K. Burleson
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Donald K. Burleson
--**************************************************************
set echo off
set long 2000
set pagesize 10000

column query       heading "Query Plan" format a80 
column other       heading "PQO/Remote Query" format a60 word_wrap
column x           heading " " format a18 
 
select distinct 
   object_node "TQs / Remote DBs" 
from 
   plan_table 
where 
   object_node is not null
order by 
   object_node;

select lpad(' ',2*(level-1))||operation||' '||options||' '
       ||object_name||' '
       ||decode(optimizer,'','','['||optimizer||'] ')
       ||decode(other_tag,'',decode(object_node,'','','['||object_node||']')
        ,'['||other_tag||' -> '||object_node||']')
       ||decode(id,0,'Cost = '||position) query
	,null  x
	,other
from   
   plan_table
start with id = 0
connect by prior id = parent_id;

