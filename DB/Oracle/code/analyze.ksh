#************************************
#
#   analyze script for oracle databases
#
# © 2001 by Donald K. Burleson
#
#   No part of this SQL script may be copied. Sold or distributed
#   without the express consent of Donald K. Burleson
#************************************

#!/bin/ksh

# First, we must set the environment . . . .
ORACLE_SID=$ORACLE_SID
export ORACLE_SID
# The line below is for Solaris databases.  Otherwise, use /etc/oratab 
ORACLE_HOME=`cat /var/opt/oracle/oratab|grep ^$ORACLE_SID:|cut -f2 -d':'`
export ORACLE_HOME
PATH=$ORACLE_HOME/bin:$PATH
export PATH

$ORACLE_HOME/bin/sqlplus /<<!

set pages 999
set heading off
set echo off
set feedback off

connect internal;

spool /export/home/oracle/analyze.sql;

select
'analyze table '||owner||'.'||table_name||' estimate statistics sample 5000 rows;'
from dba_tables
where owner not in (‘SYS’,’SYSTEM’);

select
'analyze index '||owner||'.'||index_name||' compute statistics;'
from dba_indexes
where owner not in (‘SYS’,’SYSTEM’);

spool off;

set echo on
set feedback on

@/export/home/oracle/analyze

exit
!
