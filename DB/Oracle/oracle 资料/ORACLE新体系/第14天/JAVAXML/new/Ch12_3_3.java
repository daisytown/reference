/* 程序范例: Ch12_3_3.java */
import javax.xml.parsers.*;
import org.xml.sax.*;  
import java.io.*;
import org.w3c.dom.*;

public class Ch12_3_3 {
    // 声明XML文件
    static Document document; 
    public static void main(String[] args) throws SAXException {
        if (args.length != 1) {
            System.out.println("使用: java Ch12_3_3 xml_file");
            return;
        }
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
           dbf.setValidating(true);
           // 设定解析的叁数
           dbf.setIgnoringComments(false);
           dbf.setIgnoringElementContentWhitespace(false);
           dbf.setCoalescing(false);
           DocumentBuilder db = dbf.newDocumentBuilder();
           // 指定错误处理物件
           db.setErrorHandler(new parserErrorHandler());
           // 导入XML文件
           document = db.parse(new File(args[0]));
           // 取得文件的子节点
           Node child = (Node)document.getFirstChild();
           // 取得这一层的所有节点
           for ( ; child != null; child = child.getNextSibling()) { 
               System.out.print("元素: " + child.getNodeName());
               System.out.println("/类型: " + child.getNodeType());
               printChildNode(child, 0);
           }
        } catch(ParserConfigurationException pe) {
           // 解析器设定错误
           pe.printStackTrace();
        } catch(IOException ie) {
           // 文件处理错误
           ie.printStackTrace();
        }
    }
    // 解析的错误处理物件
    private static class parserErrorHandler implements ErrorHandler {
        // 获取错误信息
        private String getMsg(SAXParseException spe) {
            String sysId = spe.getSystemId();
            if (sysId == null) {
                sysId = "NULL";
            }
            String msg = "URI=" + sysId + " 行号=" + spe.getLineNumber() +
                         ": " + spe.getMessage();
            return msg;
        }
        // 标准SAX ErrorHandler方法
        public void warning(SAXParseException spe) throws SAXException {
            System.out.println("\n警告: " + getMsg(spe));
        }
        public void error(SAXParseException spe) throws SAXException {
            String message = "\n错误: " + getMsg(spe);
            throw new SAXException(message);
        }
        public void fatalError(SAXParseException spe) throws SAXException {
            String message = "\n严重错误: " + getMsg(spe);
            throw new SAXException(message);
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
    // 显示缩排的字符
    private static void printIndent(int num) {
        System.out.print("  +");
        for (int i = 0; i <= num; i++) {
            System.out.print("--");
        }
    }
}
