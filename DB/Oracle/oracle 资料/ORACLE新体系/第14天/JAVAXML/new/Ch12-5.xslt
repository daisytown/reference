<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
    <head>
        <title>循环显示图书资料</title>
    </head>
    <body>
    <center><h2>电脑图书资料</h2></center>
    <hr/>
    <table width="100%" border="1">
    <thead>
        <th>书号</th>
        <th>书名</th>
        <th>作者</th>
        <th>定价</th>
    </thead>
    <tbody>
    <xsl:for-each select="booklist/book">
        <tr>
        <td><xsl:value-of select="code"/></td>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="authorlist/author"/></td>
        <td><xsl:value-of select="price"/></td>
        </tr>
    </xsl:for-each>
    </tbody>
    </table>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>

