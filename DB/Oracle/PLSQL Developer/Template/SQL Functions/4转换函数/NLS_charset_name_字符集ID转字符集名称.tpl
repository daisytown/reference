NLS_charset_name([#]n)
--查看所有字符集：
/*DECLARE
  i INT;
BEGIN
  FOR i IN 1 .. 999 LOOP
    dbms_output.put_line(i||'='||NLS_CHARSET_NAME(i));
  END LOOP;
END;*/
--常用字符集：871=UTF8、852=ZHS16GBK
