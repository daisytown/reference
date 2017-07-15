RTrim([#]char, set)
--LTrim、RTrim截取值可以设多个字符，Trim不可以
/*SELECT RTRIM('AHello_AB', 'AB_') a1, --截取右边多个字符，顺序不定
       RTRIM('AHello_AFAB', 'AB_') a2, --中间有其他间隔就停止截取
       RTRIM('     B_FAHello   ') a3 --截取右边空格
  FROM dual;*/