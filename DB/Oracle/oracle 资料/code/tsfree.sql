--**************************************************************
--   tsfree.sql
--
--   � 2001 by Donald K. Burleson
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Donald K. Burleson
--**************************************************************
col "Tablespace" for a13
col "Used MB" for 99,999,999
col "Free MB" for 99,999,999
col "Total MB" for 99,999,999

select fs.tablespace_name "Tablespace",
    (df.totalspace - fs.freespace) "Used MB",
    fs.freespace "Free MB",
    df.totalspace "Total MB",
    round(100 * (fs.freespace / df.totalspace)) "Pct. Free"
from
    (select tablespace_name,
        round(sum(bytes) / 1048576) TotalSpace
      from dba_data_files
      group by tablespace_name) df,
    (select tablespace_name,
        round(sum(bytes) / 1048576) FreeSpace
      from dba_free_space
      group by tablespace_name) fs
where df.tablespace_name = fs.tablespace_name
;
