--------------------------------------------
-- Export file for user GDDQ              --
-- Created by lzs on 2010-11-15, 21:25:42 --
--------------------------------------------

spool sql_to_csv.log

prompt
prompt Creating procedure SQL_TO_CSV
prompt =============================
prompt
CREATE OR REPLACE PROCEDURE SQL_TO_CSV
    (
        P_QUERY IN VARCHAR2,                        -- PLSQL文
        P_DIR IN VARCHAR2,                          -- CSV路劲
        P_FILENAME IN VARCHAR2                      -- CSV名
    )
    IS
        L_OUTPUT UTL_FILE.FILE_TYPE;
        L_THECURSOR INTEGER DEFAULT DBMS_SQL.OPEN_CURSOR;
        L_COLUMNVALUE VARCHAR2(4000);
        L_STATUS INTEGER;
        L_COLCNT NUMBER := 0;
        L_SEPARATOR VARCHAR2(1);
        L_DESCTBL DBMS_SQL.DESC_TAB;
        P_MAX_LINESIZE NUMBER := 32000;
    BEGIN

        --OPEN FILE
        L_OUTPUT := UTL_FILE.FOPEN(P_DIR, P_FILENAME, 'W', P_MAX_LINESIZE);

        --DEFINE DATE FORMAT
        EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT=''YYYY-MM-DD HH24:MI:SS''';

        --OPEN CURSOR
        DBMS_SQL.PARSE( L_THECURSOR, P_QUERY, DBMS_SQL.NATIVE );---解析动态sql语句
        DBMS_SQL.DESCRIBE_COLUMNS( L_THECURSOR, L_COLCNT, L_DESCTBL );

        --DUMP TABLE COLUMN NAME
        FOR I IN 1 .. L_COLCNT LOOP
            UTL_FILE.PUT( L_OUTPUT, L_SEPARATOR || '"' || L_DESCTBL(I).COL_NAME || '"' );
            DBMS_SQL.DEFINE_COLUMN( L_THECURSOR, I, L_COLUMNVALUE, 4000 );
            L_SEPARATOR := ',';
        END LOOP;
        UTL_FILE.NEW_LINE( L_OUTPUT );

        --EXECUTE THE QUERY STATEMENT
        L_STATUS := DBMS_SQL.EXECUTE(L_THECURSOR);

        --DUMP TABLE COLUMN VALUE
        WHILE ( DBMS_SQL.FETCH_ROWS(L_THECURSOR) > 0 ) LOOP
            L_SEPARATOR := '';
            FOR I IN 1 .. L_COLCNT LOOP
                DBMS_SQL.COLUMN_VALUE( L_THECURSOR, I, L_COLUMNVALUE );
                UTL_FILE.PUT( L_OUTPUT, L_SEPARATOR || '"' ||
                TRIM(BOTH ' ' FROM REPLACE(L_COLUMNVALUE,'"','""')) || '"');
                L_SEPARATOR := ',';
            END LOOP;
            UTL_FILE.NEW_LINE( L_OUTPUT );
        END LOOP;

        --CLOSE CURSOR
        DBMS_SQL.CLOSE_CURSOR(L_THECURSOR);

        --CLOSE FILE
        UTL_FILE.FCLOSE( L_OUTPUT );
/*    EXCEPTION
        WHEN OTHERS THEN
        RAISE;*/
    END;
/


spool off
