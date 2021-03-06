--**************************************************************
-- Object Access script
--
-- � 2001 by Donald K. Burleson
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Donald K. Burleson
--**************************************************************
set echo on;
--
--**********************************************
--  We must run this script as the SYS user
--**********************************************
accept syspass char prompt "Enter password for SYS user: ";

connect sys/&syspass;
set serveroutput on size 100000

set echo off;
--**************************************************************
prompt We first gather all SQL in the library cache and run EXPLAIN PLAN.
prompt This takes awhile, so be patient . . . 
--**************************************************************

--set echo on
--set feedback on

set feedback off
set echo off 
-- Drop and recreate PLAN_TABLE for EXPLAIN PLAN 
drop table plan_table; 
@$ORACLE_HOME/rdbms/admin/utlxplan

Rem Drop and recreate SQLTEMP for taking a snapshot of the SQLAREA 
drop table sys.sqltemp; 
create table sys.sqltemp 
(
   ADDR           VARCHAR2 (16)
  ,HASHVAL        INTEGER 
  ,SQL_TEXT       VARCHAR2(2000) 
  ,DISK_READS     NUMBER 
  ,EXECUTIONS     NUMBER 
  ,PARSE_CALLS    NUMBER
  ,PARSE_USER     VARCHAR2(30)
  ,BUFFER_GETS    NUMBER
  ,SORTS          NUMBER
  ,ROWS_PROCESSED NUMBER
  ,STMT_ID        VARCHAR2(100)
); 

--set echo on 
set feedback on

CREATE OR REPLACE PROCEDURE do_explain 
   (addr IN  VARCHAR2
   ,hash IN INTEGER
   ,sql_text_IN IN VARCHAR2
   ,parse_user_IN IN VARCHAR2
   ,stmt_id_IN IN VARCHAR2 )
AS 

   dummy    VARCHAR2(32767);

   dummy1   VARCHAR2(100);  

   mycursor INTEGER; 
   ret      INTEGER; 
   my_sqlerrm VARCHAR2 (85);
   signed_hash  NUMBER;

   FUNCTION get_sql(addr_IN IN VARCHAR2, hash_IN IN INTEGER)
   RETURN VARCHAR2
   IS
      temp_return  VARCHAR2(32767);
      CURSOR sql_pieces_cur
      IS
      SELECT sql_text
        FROM v$sqltext
       WHERE address = HEXTORAW(addr_IN)
         AND hash_value = hash_IN
      ORDER BY piece ASC;
   BEGIN
      FOR sql_pieces_rec IN sql_pieces_cur
      LOOP
         temp_return := temp_return||sql_pieces_rec.sql_text;
      END LOOP;

      IF temp_return IS NULL
      THEN
         RAISE_APPLICATION_ERROR(-20000,'SQL Not Found');
      END IF;

      RETURN temp_return;
   END get_sql;

   FUNCTION current_schema RETURN VARCHAR2
   IS
      temp_schema   v$session.schemaname%TYPE;
   BEGIN
      SELECT schemaname
        INTO temp_schema
        FROM v$session
       WHERE sid = (SELECT MAX(sid) FROM v$mystat);
      --
      RETURN temp_schema;
   EXCEPTION
      WHEN OTHERS THEN RETURN NULL;
   END current_schema;

BEGIN
   -- adjust signed_hash if hash > 2**31
   -- (hash type mismatch between v$sqlarea and v$sqltext)
   IF hash > POWER(2,31)
   THEN
      signed_hash := hash - POWER(2,32);
   ELSE
      signed_hash := hash;
   END IF;
   
   
   EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA='||parse_user_IN;


   dummy:='EXPLAIN PLAN SET STATEMENT_ID='''||stmt_id_IN||''' INTO plan_table FOR ' ; 
   IF LENGTH(sql_text_IN) > 1900
   THEN
      BEGIN  -- try to get using hash first, and unsigned hash if not found
         dummy:=dummy||get_sql(addr,hash);
         
      EXCEPTION
         WHEN OTHERS THEN dummy:=dummy||get_sql(addr,signed_hash);
                         
      END;
   ELSE
      dummy := dummy||sql_text_IN;
   END IF;

   -- JB: optimization = only change schema if different from current
   --IF parse_user_IN != current_schema
   --THEN
   --   dbms_output.put_line(current_schema||' '||parse_user_IN);
   --   mycursor := DBMS_SQL.OPEN_CURSOR;
   --   DBMS_SQL.PARSE(mycursor,dummy1,DBMS_SQL.NATIVE); 
   --   ret := DBMS_SQL.EXECUTE(mycursor);
   --   DBMS_SQL.CLOSE_CURSOR(mycursor);   
   --END IF;

   mycursor := DBMS_SQL.OPEN_CURSOR;
   DBMS_SQL.PARSE(mycursor,dummy,DBMS_SQL.NATIVE); 
   ret := DBMS_SQL.EXECUTE(mycursor);


   DBMS_SQL.CLOSE_CURSOR(mycursor); 


   COMMIT; 
EXCEPTION -- Insert errors into PLAN_TABLE... 
   WHEN OTHERS
   THEN 
      my_sqlerrm := SUBSTR(sqlerrm,1,80); 
      INSERT INTO plan_table(statement_id,remarks) -- change to plan_table (JB) 
      VALUES (stmt_id_IN, my_sqlerrm);
       
      -- cleanup cursor id open
      IF DBMS_SQL.IS_OPEN(mycursor)
      THEN
         DBMS_SQL.CLOSE_CURSOR(mycursor); 
      END IF;

EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA=SYS';

END; 
/


show errors

 
DECLARE

   CURSOR  c1
   IS
   SELECT 
          RAWTOHEX(SA.address) addr
         ,SA.hash_value        hash
         ,SA.sql_text          sql_text
         ,SA.DISK_READS        diskrds
         ,SA.EXECUTIONS        execs
         ,SA.PARSE_CALLS       parses
         ,SA.BUFFER_GETS       buffer_gets
         ,SA.SORTS             sorts
         ,SA.ROWS_PROCESSED    rows_processed
         ,DU.username          username
         ,SUBSTR(RAWTOHEX(SA.address)||':'||TO_CHAR(SA.hash_value) , 1,30) stmt_id
     FROM
          v$sqlarea   SA
         ,DBA_USERS   DU
    WHERE 
          command_type = 3
      AND 
          SA.parsing_schema_id != 0
      AND SA.parsing_schema_id = DU.user_id; 

   CURSOR c2
   IS 
   SELECT 
          addr
         ,hashval
         ,sql_text
         ,parse_user
         ,stmt_id
     FROM 
          sqltemp
    ORDER BY parse_user; 

BEGIN 
EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA=SYS';

   FOR c1_rec IN c1
   LOOP
      INSERT INTO
         sqltemp (ADDR
                 ,HASHVAL
                 ,SQL_TEXT
                 ,DISK_READS
                 ,EXECUTIONS
                 ,PARSE_CALLS
                 ,BUFFER_GETS
                 ,SORTS
                 ,ROWS_PROCESSED
                 ,PARSE_USER
                 ,STMT_ID
                 )
         VALUES (c1_rec.addr
                ,c1_rec.hash
                ,c1_rec.sql_text
                ,c1_rec.diskrds
                ,c1_rec.execs
                ,c1_rec.parses
                ,c1_rec.buffer_gets
                ,c1_rec.sorts
                ,c1_rec.rows_processed
                ,c1_rec.username
                ,c1_rec.stmt_id
                );
   END LOOP;
   --
   FOR c2_rec IN c2
   LOOP
      do_explain(c2_rec.addr
                ,c2_rec.hashval
                ,c2_rec.sql_text
                ,c2_rec.parse_user
                ,c2_rec.stmt_id);        
   END LOOP;
END;
/

--show errors

commit;


-- ********************************************************
-- Report section
-- ********************************************************

@access_report
--@/s001/app/oracle/home/sql/access_report

--drop procedure do_explain;
--drop table sqltemp;
--drop table plan_table;
