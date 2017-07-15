<html>
<head>
<title>ASP连接ORACLE演示</title>
</head>
<body>
<table border="2">
<caption>部门信息表</caption>
<tr><th>编号</th><th>名称</th><th>地址</th></tr>
<%
'加载ACTIVEX组件
Set cn=server.CreateObject ("ADODB.CONNECTION")
Set rs=server.CreateObject ("ADODB.RECORDSET")
'定义变量
dim strDSN,strSql,strConn
strConn = "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
'利用cn对象打开数据库连接
cn.Open strConn
'查询的SQL
strSql="Select * from dept"
'执行SQL获得结果集rs
rs.Open strSql,cn
'结果集的内容指定到变量中
set dno = rs("deptno")
set dname = rs("dname")
set loc = rs("loc")
'循环遍历结果
do until rs.eof
'利用表达式显示内容
%>
<tr><td><%=dno%></td><td><%=dname%></td><td><%=loc%></td></tr>
<%
rs.movenext
loop
rs.close
cn.close
%>
</table>
</body>
</html>
