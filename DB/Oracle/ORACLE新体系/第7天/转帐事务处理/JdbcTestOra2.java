/**
 *
 * 说明：
 * （1）本例使用JDBC_ODBC桥进行数据库连接，故此需要ODBC数据源
 * （2）本例中SQL为更新语句，故此使用载体的executeUpdate方法，并且返回受影响记录数
 *  (3) 配置连接ORACLE的odbc数据源ora
 */

//导入所需类包
import java.sql.*;

public class JdbcTestOra2 {
 
 
  public static void main(String args[]) {
  	Connection con =null;
  	
    try {
      //装载驱动程序
     // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Class.forName("oracle.jdbc.driver.OracleDriver");
      
      //建立数据库连接
      //con = DriverManager.getConnection("jdbc:odbc:ora","scott","tiger");
      //thin驱动
      //con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:accp","scott","tiger");
      //胖驱动
      con = DriverManager.getConnection("jdbc:oracle:oci8:@accp_con","scott","tiger");
      //设置事务不是自动提交的
      con.setAutoCommit(false);
      
      //创建SQL语句载体
      Statement st = con.createStatement();
      
      //执行SQL语句，接收执行结果
      //-1000
       int rs = st.executeUpdate("update account set tot=tot-1000 where accname='小王'");
       int i = 1/0;
       rs = st.executeUpdate("update account set tot=tot+1000 where accname='小李'");
       
       
      //提交 
      con.commit();
      //con.rollback();  回滚    
      
            
      //处理结果
      //System.out.println("修改记录数："+rs);
      
      //释放数据库资源，注意诵�
      
      
      st.close();
      con.close();            
    }
    catch (Exception e) {
    	
      if(con != null) try{con.rollback();}catch(Exception ee){}	
      e.printStackTrace(System.out);
    }
  }
}
