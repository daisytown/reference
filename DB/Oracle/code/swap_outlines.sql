--**************************************************************
--   swap_outlines.sql
--
--   © 2001 by Donald K. Burleson
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Donald K. Burleson
--**************************************************************
set echo off;
set feedback off;

prompt Enter the old outline name:
accept old

prompt Enter the new outline name:
accept new

update
   outln.ol$hints
set
   ol_name=decode(ol_name,upper('&new'),upper('&old'),upper('&old'),upper('&new'))
where
   ol_name IN (upper('&new'),upper('&old'));
commit;

prompt Here is the new outline for &old
@outline &old@outline &old

