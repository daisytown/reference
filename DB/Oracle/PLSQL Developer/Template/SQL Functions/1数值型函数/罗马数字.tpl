to_char(i, 'RN')
--单个
--SELECT to_char(3, 'RN') FROM dual;
--多个
/*DECLARE
  i INT;
BEGIN
  FOR i IN 1 .. 99 LOOP
    dbms_output.put_line(i || '=' || to_char(i, 'RN'));
  END LOOP;
END;*/