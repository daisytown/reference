/* 程序范例: Ch12_3_2.java */
import javax.xml.parsers.*;
import org.xml.sax.*;  
import java.io.*;
import org.w3c.dom.*;

public class Ch12_3_2 {
    // 声明XML文件
    static Document document; 
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("使用: java Ch12_3_2 xml_file");
            return;
        }
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
           // 设定解析的叁数
           dbf.setIgnoringComments(true);
           dbf.setIgnoringElementContentWhitespace(true);
           dbf.setCoalescing(true);
           DocumentBuilder db = dbf.newDocumentBuilder();
           // 导入XML文件
           document = db.parse(new File(args[0]));
           // 获取文件的子节点
           Node child = (Node)document.getFirstChild();
           // 获取这一层的所有节点
           for ( ; child != null; child = child.getNextSibling()) { 
               System.out.print("元素: " + child.getNodeName());
               System.out.println("/型态: " + child.getNodeType());
               printChildNode(child, 0);
           }
        } catch(SAXException se) {
           // 解析过程错误
           Exception  e = se;
           if (se.getException() != null)
               e = se.getException();
           e.printStackTrace();
        } catch(ParserConfigurationException pe) {
            // 解析器设定错误
            pe.printStackTrace();
        } catch(IOException ie) {
           // 文件处理错误
           ie.printStackTrace();
        }
    }
    // 显示子节点的返回方法
    private static void printChildNode(Node temp, int pos) {
        if (temp.hasChildNodes()) {
           NodeList nodes = temp.getChildNodes();
           // 获取所有的子节点
           for (int i=0; i < nodes.getLength(); i++) { 
              int type = nodes.item(i).getNodeType();
              if (type == Node.ELEMENT_NODE) {
                 printIndent(pos);
                 System.out.println(" 元素(" + i + "):" + nodes.item(i).getNodeName());
                 printChildNode(nodes.item(i), pos+1);
              } 
              if (type == Node.TEXT_NODE) {
                 printIndent(pos);
                 System.out.print(" 元素(" + i + "): " + nodes.item(i).getNodeName());
                 String val = nodes.item(i).getNodeValue();
                 if (val != null) {
                     System.out.print("/元素值: ");
                     if (val.trim().equals("")) 
                        System.out.println("[WS]");
                     else 
                        System.out.println(val);
                 }
              }
           }       
        }
    }
    // 显示缩排的字元
    private static void printIndent(int num) {
        System.out.print("  +");
        for (int i = 0; i <= num; i++) {
            System.out.print("--");
        }
    }
}
