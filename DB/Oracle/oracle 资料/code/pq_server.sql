--**************************************************************
--   pq_server.sql
--
--   © 2001 by Donald K. Burleson
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Donald K. Burleson
--**************************************************************
select
   tq_id,
   server_type,
   process,
   num_rows
from
   v$pq_tqstat
where
   dfo_number = 
   (select max(dfo_number)
    from
       v$pq_tqstat)
order by
   tq_id,
   decode (substr(server_type,1,4),
     'Prod', 0, 'Cons', 1, 3)
;
