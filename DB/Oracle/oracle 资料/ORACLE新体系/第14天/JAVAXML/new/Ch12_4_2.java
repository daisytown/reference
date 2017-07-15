/* 程序范例: Ch12_4_2.java */
import javax.xml.parsers.*;
import org.xml.sax.*;  
import java.io.*;
import org.w3c.dom.*;

public class Ch12_4_2 {
    // 声明XML文件
    static Document document; 
    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // 设定解析的叁数
        dbf.setIgnoringComments(true);
        dbf.setIgnoringElementContentWhitespace(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        // 导入XML文件
        document = db.parse(new File("Ch12-4.xml"));
        // 获取根元素
        Node root = document.getDocumentElement();
        System.out.println("根元素: " + root.getNodeName());
        // getElementByTagName方法
        System.out.print("第三个code元素: ");
        NodeList codes = document.getElementsByTagName("code");
        System.out.print("元素名称: " + codes.item(2).getNodeName());
        System.out.println("/" + codes.item(2).getFirstChild().getNodeValue());
        System.out.print("第三个book元素的第三个字元素: ");
        // getChildNodes方法
        System.out.print(root.getChildNodes().item(2).getChildNodes().item(2).getNodeName());
        System.out.println("/" + root.getChildNodes().item(2).getChildNodes().item(2).getFirstChild().getNodeValue());
        System.out.print("第一个book元素的第二个字元素: ");
        // 使用getFirstChild方法
        System.out.print(root.getFirstChild().getChildNodes().item(1).getNodeName());
        System.out.println("/" + root.getFirstChild().getChildNodes().item(1).getFirstChild().getNodeValue());
        System.out.print("最后一个book元素的第四个元素: ");
        // getLastChild方法
        System.out.print(root.getLastChild().getChildNodes().item(3).getNodeName());
        System.out.println("/" + root.getLastChild().getChildNodes().item(3).getFirstChild().getNodeValue());
        System.out.println("当前位置 : 最后一个book元素的code子元素: ");
        Node temp1 = root.getLastChild().getChildNodes().item(0);
        // getNextSibling方法
        System.out.println("其下一个兄弟元素名称为 : " + temp1.getNextSibling().getNodeName());
        System.out.println("其父元素名称为 : " + temp1.getParentNode().getNodeName());                   
    }
}
