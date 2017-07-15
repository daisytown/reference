<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
	<head>
		<title>authors list</title>
	</head>
	<body>
	<center>
	<h1>Authors List</h1>
	<table border="1">
	
			<tr>
				<th>au_id</th>
				<th>au_lname</th>
<th>au_fname</th>
<th>phone</th>
<th>address</th>
<th>city</th>
<th>state</th>
<th>zip</th>
<th>contract</th>
		

			</tr>
			<xsl:for-each select="/authors/author">
			<tr>
				<td><xsl:value-of select="au_id"/></td>
	
	
				<td><xsl:value-of select="au_lname"/></td>
			

				<td><xsl:value-of select="au_fname"/></td>
		


				<td><xsl:value-of select="phone"/></td>
	

				<td><xsl:value-of select="address"/></td>


				<td><xsl:value-of select="city"/></td>


				<td><xsl:value-of select="state"/></td>
	

				<td><xsl:value-of select="zip"/></td>
		

				<td><xsl:value-of select="contract"/></td>
			</tr>







			
			
			
			
			
			</xsl:for-each>
	
	</table>
	
	</center>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>
