<html>
<head>
<title>ASP����ORACLE��ʾ</title>
</head>
<body>
<table border="2">
<caption>������Ϣ��</caption>
<tr><th>���</th><th>����</th><th>��ַ</th></tr>
<%
'����ACTIVEX���
Set cn=server.CreateObject ("ADODB.CONNECTION")
Set rs=server.CreateObject ("ADODB.RECORDSET")
'�������
dim strDSN,strSql,strConn
strConn = "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
'����cn��������ݿ�����
cn.Open strConn
'��ѯ��SQL
strSql="Select * from dept"
'ִ��SQL��ý����rs
rs.Open strSql,cn
'�����������ָ����������
set dno = rs("deptno")
set dname = rs("dname")
set loc = rs("loc")
'ѭ���������
do until rs.eof
'���ñ��ʽ��ʾ����
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
