--**************************************************************
--   outline.sql
--
--   © 2001 by Donald K. Burleson
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Donald K. Burleson
--**************************************************************
set echo off;
set verify off;
set feedback off;

column hint format a40;

select
   sql_text
from
   dba_outlines
where
   name = upper('&1');

select distinct
   lpad(' ',2*(level-1))||hint_text hint,
   hint#,
   table_tin,
   stage#
from
   outln.ol$hints
start with
   hint#=1
connect by prior
   hint# = hint#-1
and
   ol_name = upper('&1')
order by
   stage#,
   hint#
;
