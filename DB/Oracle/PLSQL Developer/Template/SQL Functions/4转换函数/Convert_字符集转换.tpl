Convert([#]char, dest_char_set, source_char_set)
--功能：将源字符串char从source_char_set字符集转换到dest_char_set字符集。
--参数dest_char_set：目的字符集名称。
--参数source_char_set：源字符集的名称。默认值是数据库的字符集。
--查看系统默认字符集：select userenv('language') from dual;
--查看所有系统字符集：select * from v$nls_valid_values where parameter='CHARACTERSET'