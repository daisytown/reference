/**
 *
 * ËµÃ÷£º
 * £¨1£©±¾ÀıÊ¹ÓÃJDBC_ODBCÇÅ½øĞĞÊı¾İ¿âÁ¬½Ó£¬¹Ê´ËĞèÒªODBCÊı¾İÔ´
 * £¨2£©±¾ÀıÖĞSQLÎª¸üĞÂÓï¾ä£¬¹Ê´ËÊ¹ÓÃÔØÌåµÄexecuteUpdate·½·¨£¬²¢ÇÒ·µ»ØÊÜÓ°Ïì¼ÇÂ¼Êı
 *  (3) ÅäÖÃÁ¬½ÓORACLEµÄodbcÊı¾İÔ´ora
 */

//µ¼ÈëËùĞèÀà°ü
import java.sql.*;

public class JdbcTestOra2 {
 
 
  public static void main(String args[]) {
  	Connection con =null;
  	
    try {
      //×°ÔØÇı¶¯³ÌĞò
     // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Class.forName("oracle.jdbc.driver.OracleDriver");
      
      //½¨Á¢Êı¾İ¿âÁ¬½Ó
      //con = DriverManager.getConnection("jdbc:odbc:ora","scott","tiger");
      //thinÇı¶¯
      //con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:accp","scott","tiger");
      //ÅÖÇı¶¯
      con = DriverManager.getConnection("jdbc:oracle:oci8:@accp_con","scott","tiger");
      //ÉèÖÃÊÂÎñ²»ÊÇ×Ô¶¯Ìá½»µÄ
      con.setAutoCommit(false);
      
      //´´½¨SQLÓï¾äÔØÌå
      Statement st = con.createStatement();
      
      //Ö´ĞĞSQLÓï¾ä£¬½ÓÊÕÖ´ĞĞ½á¹û
      //-1000
       int rs = st.executeUpdate("update account set tot=tot-1000 where accname='Ğ¡Íõ'");
       int i = 1/0;
       rs = st.executeUpdate("update account set tot=tot+1000 where accname='Ğ¡Àî'");
       
       
      //Ìá½» 
      con.commit();
      //con.rollback();  »Ø¹ö    
      
            
      //´¦Àí½á¹û
      //System.out.println("ĞŞ¸Ä¼ÇÂ¼Êı£º"+rs);
      
      //ÊÍ·ÅÊı¾İ¿â×ÊÔ´£¬×¢ÒâËĞò
      
      
      st.close();
      con.close();            
    }
    catch (Exception e) {
    	
      if(con != null) try{con.rollback();}catch(Exception ee){}	
      e.printStackTrace(System.out);
    }
  }
}
