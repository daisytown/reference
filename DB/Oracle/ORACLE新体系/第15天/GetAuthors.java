import java.sql.*;
import java.io.*;

class ReadDb{//读取数据写XML文件
  
  public ReadDb(){
  
 try{
 	//加载SQL驱动
  Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
  //得到连接
  String sqlstr="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=pubs";
  String user="sa";
  String pass="";
  
  Connection conn=DriverManager.getConnection(sqlstr,user,pass);
  //得到执行语句
  Statement stmt = conn.createStatement()	;
  
  //得到查询的结果
  ResultSet rs = stmt.executeQuery("select * from authors");
  
  //建立一个文件
  File ff = new File("f:\\authors.xml");
  ff.createNewFile();
  
  //写入内容
  FileWriter fw = new FileWriter(ff);
  fw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
  fw.write("<authors>\n");
  //循环写入每个author数据  
  while(rs.next()){
    fw.write("<author>\n");
    //au_id
    fw.write("<au_id>");
    fw.write(rs.getString("au_id"));
    fw.write("</au_id>\n");
    //au_lname
    fw.write("<au_lname>");
    fw.write(rs.getString("au_lname"));
    fw.write("</au_lname>\n");
    //au_fname
    fw.write("<au_fname>");
    fw.write(rs.getString("au_fname"));
    fw.write("</au_fname>\n");
    //phone
    fw.write("<phone>");
    fw.write(rs.getString("phone"));
    fw.write("</phone>\n");
    //address
    fw.write("<address>");
    fw.write(rs.getString("address"));
    fw.write("</address>\n");
    //city
    fw.write("<city>");
    fw.write(rs.getString("city"));
    fw.write("</city>\n");
    //state
    fw.write("<state>");
    fw.write(rs.getString("state"));
    fw.write("</state>\n");
    //zip
    fw.write("<zip>");
    fw.write(rs.getString("zip"));
    fw.write("</zip>\n");
    //contract
    fw.write("<contract>");
    fw.write(String.valueOf(rs.getInt("contract")));
    fw.write("</contract>\n");
    
    
    
    
    fw.write("</author>\n");
  }
   fw.write("</authors>");
  //释放资源
  //关闭文件操作
  fw.close();
  //释放数据库连接
  conn.close();
  //提示
  System.out.println("文件写入成功！！！！！！");
  
 }catch(Exception ee)
 {
 	System.out.println(ee.getMessage());
 }
  
}	
}

public class GetAuthors{
	public static void main(String[] args){
	   ReadDb rd = new ReadDb();	
	}
}