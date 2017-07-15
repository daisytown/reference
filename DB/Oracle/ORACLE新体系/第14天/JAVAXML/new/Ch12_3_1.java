/* 程序范例: Ch12_3_1.java */
//导入包
import javax.xml.parsers.*;//xml解析
import org.xml.sax.*; //异常处理
import org.w3c.dom.*; //dom包
import java.io.*; //读取文件

public class Ch12_3_1 {
    // 声明XML文件
    //对象Document 整个XML文件
    static Document document;
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("使用: java Ch12_3_1 xml_file");
            return;
        }
        //1.文档处理工厂
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
           //2.建立DocumentBuilder 文档解析器
           DocumentBuilder db = dbf.newDocumentBuilder();
           // 3.导入XML文件 parse方法把一个XML文件变成内存中的树
           document = db.parse(new File(args[0]));
           // 获取文件的子节点
           Node child = (Node)document.getFirstChild();
           // 获取这一层的所有节点
           for ( ; child != null; child = child.getNextSibling()) {
               System.out.print("元素: " + child.getNodeName());
               System.out.println("/类型: " + child.getNodeType());
               printChildNode(child, 0);
           }
        } catch(SAXException se) {
           // 过程错误
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
      //判断是否有子节点
      if (temp.hasChildNodes()) {
      //得到所有子节点
           NodeList nodes = temp.getChildNodes();
           // 循环获取所有的子节点
           for (int i=0; i < nodes.getLength(); i++) {
              //得到节点类型
              int type = nodes.item(i).getNodeType();
              //是元素节点
              if (type == Node.ELEMENT_NODE) {
                 //产生一个缩进格式
                 printIndent(pos);
                 //打印元素的名字
                 System.out.println(" 元素(" + i + "):" + nodes.item(i).getNodeName());
                 //继续递归
                 printChildNode(nodes.item(i), pos+1);
              }
              //是文本节点
              if (type == Node.TEXT_NODE) {
                 printIndent(pos);
                 System.out.print(" 元素(" + i + "): " + nodes.item(i).getNodeName());
                 //打印值
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
