Trim([#]Leading|Trailing|Both trim_character from trim_source)
--LTrim��RTrim��ȡֵ���������ַ���Trimֻ����һ���ַ�
/*SELECT TRIM(LEADING 'H' FROM 'HelloH') ȥ�����, --elloH
       TRIM(TRAILING 'o' FROM 'Hello') ȥ���ұ�, --Hell
       TRIM(BOTH 'H' FROM 'Hello') ȥ������, --ello
       TRIM('H' FROM 'HelloH') ȥ������, --ello
       TRIM(' HelloH ') ȥ�����߿ո� --HelloH
  FROM dual;*/
