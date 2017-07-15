LTrim([#]char, set)
--LTrim、RTrim截取值可以设多个字符，Trim不可以
/*SELECT LTRIM('B_AHello', 'AB_') a1, --截取左边多个字符，顺序不定
       LTRIM('B_FAHello', 'AB_') a2, --中间有其他间隔就停止截取
       LTRIM('     B_FAHello   ') a3 --截取左边空格
  FROM dual;*/