declare
  v_str          varchar(32767) := 'begin';
  v_replace_from varchar(400);
  v_replace_to   varchar(400);
  CURSOR cur IS
    select s.last_active_time,
           s.sql_text,
           s.sql_fulltext,
           s.sql_id,
           b.name,
           b.datatype,
           b.datatype_string,
           b.value_string
      from v$sql s, v$sql_bind_capture b
     where s.sql_id = b.sql_id
       AND s.sql_id = 'dfvckpz0bn00u' --SQL_ID
    --and b.VALUE_STRING like '%AT201107101029027%'
     order by b.name desc;
begin
  for i IN cur LOOP
    v_replace_from := i.NAME;
    IF i.datatype = 1 OR i.value_string IS NULL THEN
      v_replace_to := '''' || i.value_string || '''';
    ELSE
      v_replace_to := i.value_string;
    END IF;
    IF cur%Rowcount = 1 THEN
      v_str := replace(i.sql_fulltext, v_replace_from, v_replace_to);
    ELSE
      v_str := replace(v_str, v_replace_from, v_replace_to);
    END IF;
  end loop;
  dbms_output.put_line(v_str);
end;
