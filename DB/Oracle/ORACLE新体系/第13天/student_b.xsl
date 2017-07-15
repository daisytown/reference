<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--模板-->
	<xsl:template match="/">
		<html>
			<head>
				<title>学生花名册</title>
			</head>
			<body>
				<table border="1">
					<tr>
					  <th>id</th>
						<th>name</th>
						<th>sex</th>
						<th>birthday</th>
						<th>score</th>
					</tr>
	       <xsl:apply-templates select="/roster/student[@ID&lt;102]"/>
								</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="/roster/student[@ID&lt;102]">
	
					<tr>
					  <td>
					  		<xsl:value-of select="@ID"/>

					    </td>
						<td>
							<xsl:value-of select="name"/>
						</td>
						<td>
							<xsl:value-of select="sex"/>
						</td>
						<td>
							<xsl:value-of select="birthday"/>
						</td>
						<td>
							<xsl:value-of select="score"/>
						</td>
					</tr>
	
	
	</xsl:template>
	
	
</xsl:stylesheet>
