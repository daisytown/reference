<?xml version="1.0" encoding="gb2312" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
  <xsl:template match="/">
    <html> 
      <head> 
        <title>2002�걱������APTech��ѵ����ѧ���ɼ���</title>
      </head> 
      <body> 
        <h2 align="center">ѧ���ɼ���</h2> 
         		<table border="1" cellpadding="0" align="center">
     	    <tr><th>����</th><th>�Ա�</th><th>����</th><th>�ɼ�</th><th colspan="4">����</th></tr>
     	    
     	<xsl:for-each select="/roster/student" order-by="-score">
        <tr>
         <td><xsl:value-of select="name"/></td>
         <td><xsl:value-of select="sex"/></td>
         <td><xsl:value-of select="birthday"/></td>
         <td><xsl:value-of select="score"/></td>

         <xsl:for-each select="skill">

         <td><xsl:value-of /></td>
         </xsl:for-each>

        </tr>
 		</xsl:for-each>
		</table>      
       </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
