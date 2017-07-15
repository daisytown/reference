<?xml version="1.0" encoding="gb2312" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
  <xsl:template match="/">
    <html> 
      <head> 
        <title>2002年北大青鸟APTech培训中心学生成绩单</title>
      </head> 
      <body> 
        <h2 align="center">学生成绩单</h2> 
         		<table border="1" cellpadding="0" align="center">
     	    <tr><th>姓名</th><th>性别</th><th>生日</th><th>成绩</th><th colspan="4">技能</th></tr>
     	    
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
