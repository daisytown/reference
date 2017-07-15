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
	//1.加载驱动
	  Class.forName("oracle.jdbc.driver.OracleDriver");		
	//2.create connect
	  String url = "jdbc:oracle:thin:@localhost:1521:accp";
	  
	  //String url = "jdbc:oracle:oci8:@accp";
	  String user = "scott";
	  String pass = "tiger";
	  
	  Connection conn = DriverManager.getConnection(url,user,pass);		
	//3.create 语句
	  Statement stmt = conn.createStatement();
	 //4.执行语句
	 //rows影响记录的行数
	  //insert
	  //int rows = stmt.executeUpdate("insert into dept values(50,'mike','po')");   
	  //update
	  //int rows = stmt.executeUpdate("update dept set dname='MACO' where deptno=50");   
	  //delete
	  int rows = stmt.executeUpdate("delete from dept where deptno=50"); 
	
	//
	//6.释放

	  stmt.close();
	  conn.close();
	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}
}
