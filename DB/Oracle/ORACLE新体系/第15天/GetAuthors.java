import java.sql.*;
import java.io.*;

class ReadDb{//��ȡ����дXML�ļ�
  
  public ReadDb(){
  
 try{
 	//����SQL����
  Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
  //�õ�����
  String sqlstr="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=pubs";
  String user="sa";
  String pass="";
  
  Connection conn=DriverManager.getConnection(sqlstr,user,pass);
  //�õ�ִ�����
  Statement stmt = conn.createStatement()	;
  
  //�õ���ѯ�Ľ��
  ResultSet rs = stmt.executeQuery("select * from authors");
  
  //����һ���ļ�
  File ff = new File("f:\\authors.xml");
  ff.createNewFile();
  
  //д������
  FileWriter fw = new FileWriter(ff);
  fw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
  fw.write("<authors>\n");
  //ѭ��д��ÿ��author����  
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
  //�ͷ���Դ
  //�ر��ļ�����
  fw.close();
  //�ͷ����ݿ�����
  conn.close();
  //��ʾ
  System.out.println("�ļ�д��ɹ�������������");
  
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