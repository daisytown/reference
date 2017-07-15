/*
 * @(#)Connectoracle.java 1.0 05/04/12
 *
 * You can modify the template of this file in the
 * directory ..\JCreator\Templates\Template_1\Project_Name.java
 *
 * You can also create your own project template by making a new
 * folder in the directory ..\JCreator\Template\. Use the other
 * templates as examples.
 *
 */
package myprojects.connectoracle;

import java.sql.*;

class Connectoracle  {
	
	public static void main(String args[]) {
		try{
	//1.¼ÓÔØÇý¶¯
	  Class.forName("oracle.jdbc.driver.OracleDriver");		
	//2.create connect
	  //String url = "jdbc:oracle:thin:@localhost:1521:accp";
	  
	  String url = "jdbc:oracle:oci8:@accp";
	  String user = "scott";
	  String pass = "tiger";
	  
	  Connection conn = DriverManager.getConnection(url,user,pass);		
	//3.create Óï¾ä
	  Statement stmt = conn.createStatement();
	 //4.Ö´ÐÐÓï¾ä
	  ResultSet rs = stmt.executeQuery("select empno,ename,hiredate,sal from emp where rownum <= 2");   
	//5.Ñ­»·
	  while(rs.next()){
	  	System.out.println("empno="+rs.getInt("empno"));
	  	System.out.println("ename="+rs.getString("ename"));
	  	System.out.println("hiredate="+rs.getDate("hiredate"));
	  	System.out.println("sal="+rs.getDouble("sal"));
	  	System.out.println("-----------------------");
	  	
	  		
	}
	
	//6.ÊÍ·Å
	  rs.close();
	  stmt.close();
	  conn.close();
	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}
}
