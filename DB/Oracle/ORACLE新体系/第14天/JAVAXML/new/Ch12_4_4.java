/* 程序范例: Ch12_4_4.java */
import javax.xml.parsers.*;
import org.xml.sax.*;  
import java.io.*;
import org.w3c.dom.*;

public class Ch12_4_4 {
    // 声明XML文件
    static Document document; 
    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // 设定解析的叁数
        dbf.setIgnoringComments(true);
        dbf.setIgnoringElementContentWhitespace(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        // 建立新XML文件
        document = db.newDocument();
        // 建立根元素
        Element root = (Element) document.createElement("book"); 
        document.appendChild(root);
        // 新增子元素code
        Element temp = (Element) document.createElement("code");
        root.appendChild(temp);
        temp.appendChild(document.createTextNode("F8915"));
        // 新增子元素title
        temp = (Element) document.createElement("title");
        root.appendChild(temp);
        temp.appendChild(document.createTextNode("ASP网页制作彻底研究"));
        // 新增author元素
        Element newNode = (Element) document.createElement("author");
        root.insertBefore(newNode, root.getFirstChild());
        Node newText = document.createTextNode("陈会安");
        root.getFirstChild().appendChild(newText);
        // 新增属性
        temp = (Element) root.getFirstChild().getNextSibling();
        temp.setAttribute("sales","Y");
        System.out.println("建立的XML文件: ");
        printXML(root);
        // 删除author元素
        root.removeChild((Element) root.getElementsByTagName("author").item(0));
        // 删除code属性sales
        Element delNode = (Element) root.getFirstChild();
        delNode.removeAttribute("sales");
        System.out.println("删除后的XML文件: ");
        printXML(root);
    }
    private static void printXML(Node root) {
        // 显示XML文件
        System.out.println("根元素: " + root.getNodeName());
        NodeList nodes = root.getChildNodes();
        // 获取所有的子节点
        for (int i=0; i < nodes.getLength(); i++) { 
            // 元素和文字节点
            System.out.print("元素: " + nodes.item(i).getNodeName());
            System.out.println("/" + nodes.item(i).getFirstChild().getNodeValue());
            // 显示指定元素的属性值
            if (nodes.item(i).hasAttributes()) {
                NamedNodeMap atts = nodes.item(i).getAttributes();
                for (int j = 0; j < atts.getLength(); j++) {
                    Node att = atts.item(j);
                    System.out.print(" +-- " + att.getNodeName()); 
                    System.out.println("/" + att.getNodeValue());
                }        
            }
        }
    }
}
