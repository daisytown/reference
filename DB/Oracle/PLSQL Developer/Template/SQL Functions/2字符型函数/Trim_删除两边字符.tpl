Trim([#]Leading|Trailing|Both trim_character from trim_source)
--LTrim、RTrim截取值可以设多个字符，Trim只能设一个字符
/*SELECT TRIM(LEADING 'H' FROM 'HelloH') 去掉左边, --elloH
       TRIM(TRAILING 'o' FROM 'Hello') 去掉右边, --Hell
       TRIM(BOTH 'H' FROM 'Hello') 去掉两边, --ello
       TRIM('H' FROM 'HelloH') 去掉两边, --ello
       TRIM(' HelloH ') 去掉两边空格 --HelloH
  FROM dual;*/
