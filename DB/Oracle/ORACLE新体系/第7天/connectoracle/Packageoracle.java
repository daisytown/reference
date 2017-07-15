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
	//1.��������
	  Class.forName("oracle.jdbc.driver.OracleDriver");		
	//2.create connect
	  String url = "jdbc:oracle:thin:@localhost:1521:accp";
	  
	  //String url = "jdbc:oracle:oci8:@accp";
	  String user = "scott";
	  String pass = "tiger";
	  
	  Connection conn = DriverManager.getConnection(url,user,pass);		
	//3.create ���
	  CallableStatement cstmt = conn.prepareCall("{call test_pack.getname(?,?)}");
	 //4.ע���������
	  cstmt.registerOutParameter(2,java.sql.Types.CHAR);
	  cstmt.setInt(1,7900);
	  
	 //5.ִ��p1
	  cstmt.execute();
	  
	 //6.ȡ��� 
	 System.out.println("Procedure get="+cstmt.getString(2));
	
	//����
	 cstmt = conn.prepareCall("{? = call test_pack.f_get_name(?)}");
	 //4.ע���������
	  cstmt.registerOutParameter(1,java.sql.Types.CHAR);
	  cstmt.setInt(2,7900);
	  
	 //5.ִ��p1
	  cstmt.execute();
	  
	 //6.ȡ��� 
	 System.out.println("function get="+cstmt.getString(1));
	//
	
	//7.�ͷ�

	  cstmt.close();
	  conn.close();
	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}
}
