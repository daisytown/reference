/* 程序范例: Ch12_4_1.java */
import javax.xml.parsers.*;
import org.xml.sax.*;
import java.io.*;
import org.w3c.dom.*;

public class Ch12_4_1 {
    //声明XML文件
    static Document document;
    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // 设定解析的叁数
        //忽略注释
        dbf.setIgnoringComments(true);
        //忽略空的文本
        dbf.setIgnoringElementContentWhitespace(true);

        DocumentBuilder db = dbf.newDocumentBuilder();
        //导入XML文件
        document = db.parse(new File("dept.xml"));
        // 获取根元素
        Node root = document.getDocumentElement();
        System.out.println("根元素: " + root.getNodeName());
        NodeList nodes = root.getChildNodes();
        // 获取所有的子节点
        for (int i=0; i < nodes.getLength(); i++) {
           // 元素和文字节点
           System.out.println("元素: " + nodes.item(i).getNodeName());
           if (nodes.item(i).hasChildNodes()) {
              NodeList childs = nodes.item(i).getChildNodes();
              // 显示所有子节点
              for (int j=0; j < childs.getLength(); j++) {
                  int type = childs.item(j).getNodeType();
                  if (type == Node.ELEMENT_NODE) {
                     System.out.print("   +-- " + childs.item(j).getNodeName());
                     System.out.println("/" + childs.item(j).getFirstChild().getNodeValue());
                  }
              }
           }
        }
        // 显示指定元素的属性值
        NodeList tagNodes = document.getElementsByTagName("dept");
        for (int i=0; i< tagNodes.getLength(); i++) {
            System.out.println("dept(" + i + "):");
            NamedNodeMap atts = tagNodes.item(i).getAttributes();
            for (int j = 0; j < atts.getLength(); j++) {
                Node att = atts.item(j);
                System.out.print("   +-- " + att.getNodeName());
                System.out.println("/" + att.getNodeValue());
            }
        }
    }
}
