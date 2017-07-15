package student_details;

import java.sql.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 1999</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class Students {
  public static void main(String[] args) throws Exception{
    String headerstring = "<?xml version=\"1.0\"?>";
    String root = "<students>";
    String rootend = "</students>";
    File ff = new File("students.xml");
    ff.createNewFile();
    FileWriter fw = new FileWriter(ff);
    fw.write(headerstring);
    fw.write(root);
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection conn = DriverManager.getConnection("jdbc:odbc:sqlodbc","sa","123");
    Statement stmt = conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from students");
    while(rs.next()) {
      fw.write("<student>");
      fw.write("<stud_id>");
      String stud_id = rs.getString("stud_id");
      fw.write(stud_id);
      fw.write("</stud_id>");
      fw.write("<stud_name>");
      String stud_name = rs.getString("stud_name");
      fw.write(stud_name);
      fw.write("</stud_name>");
      fw.write("</student>");
    }
    fw.write(rootend);
    fw.close();
  }
}