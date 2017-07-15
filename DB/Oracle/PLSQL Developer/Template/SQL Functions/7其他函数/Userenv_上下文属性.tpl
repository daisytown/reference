Userenv([#]option)
/*【功能】返回当前会话上下文属性。
【参数】Parameter是参数，可以用以下参数代替：
Isdba:若用户具有dba权限，则返回true,否则返回false.
Language:返回当前会话对应的语言、地区和字符集。
LANG:返回当前环境的语言的缩写
Terminal:返回当前会话所在终端的操作系统标识符。
Sessionid:返回正在使用的审计会话号.
Client_info:返回用户会话信息，若没有则返回null.
【返回】根据参数不同则类型不同
【示例】Select userenv('isdba'),userenv('Language'),userenv('Terminal'),userenv('Client_info') from dual;
*/