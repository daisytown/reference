/**
 *
 * ˵����
 * ��1������ʹ��JDBC_ODBC�Ž������ݿ����ӣ��ʴ���ҪODBC����Դ
 * ��2��������SQLΪ������䣬�ʴ�ʹ�������executeUpdate���������ҷ�����Ӱ���¼��
 *  (3) ��������ORACLE��odbc����Դora
 */

//�����������
import java.sql.*;

public class JdbcTestOra2 {
 
 
  public static void main(String args[]) {
  	Connection con =null;
  	
    try {
      //װ����������
     // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Class.forName("oracle.jdbc.driver.OracleDriver");
      
      //�������ݿ�����
      //con = DriverManager.getConnection("jdbc:odbc:ora","scott","tiger");
      //thin����
      //con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:accp","scott","tiger");
      //������
      con = DriverManager.getConnection("jdbc:oracle:oci8:@accp_con","scott","tiger");
      //�����������Զ��ύ��
      con.setAutoCommit(false);
      
      //����SQL�������
      Statement st = con.createStatement();
      
      //ִ��SQL��䣬����ִ�н��
      //-1000
       int rs = st.executeUpdate("update account set tot=tot-1000 where accname='С��'");
       int i = 1/0;
       rs = st.executeUpdate("update account set tot=tot+1000 where accname='С��'");
       
       
      //�ύ 
      con.commit();
      //con.rollback();  �ع�    
      
            
      //������
      //System.out.println("�޸ļ�¼����"+rs);
      
      //�ͷ����ݿ���Դ��ע�����
      
      
      st.close();
      con.close();            
    }
    catch (Exception e) {
    	
      if(con != null) try{con.rollback();}catch(Exception ee){}	
      e.printStackTrace(System.out);
    }
  }
}
