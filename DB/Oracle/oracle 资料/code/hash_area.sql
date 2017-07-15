--**************************************************************
--   hash_area.sql
--
--   © 2001 by Donald K. Burleson
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Donald K. Burleson
--**************************************************************
set heading off;
set feedback off;
set verify off;
set pages 999;

spool run_hash.sql

select
   'alter session set hash_area_size='||trunc(sum(bytes)*1.6)||';'
from
   dba_segments
where 
   segment_name = upper('&1');

spool off;

@run_hash
