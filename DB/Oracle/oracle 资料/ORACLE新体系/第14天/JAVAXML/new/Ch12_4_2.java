/* ������: Ch12_4_2.java */
import javax.xml.parsers.*;
import org.xml.sax.*;  
import java.io.*;
import org.w3c.dom.*;

public class Ch12_4_2 {
    // ����XML�ļ�
    static Document document; 
    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // �趨����������
        dbf.setIgnoringComments(true);
        dbf.setIgnoringElementContentWhitespace(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        // ����XML�ļ�
        document = db.parse(new File("Ch12-4.xml"));
        // ��ȡ��Ԫ��
        Node root = document.getDocumentElement();
        System.out.println("��Ԫ��: " + root.getNodeName());
        // getElementByTagName����
        System.out.print("������codeԪ��: ");
        NodeList codes = document.getElementsByTagName("code");
        System.out.print("Ԫ������: " + codes.item(2).getNodeName());
        System.out.println("/" + codes.item(2).getFirstChild().getNodeValue());
        System.out.print("������bookԪ�صĵ�������Ԫ��: ");
        // getChildNodes����
        System.out.print(root.getChildNodes().item(2).getChildNodes().item(2).getNodeName());
        System.out.println("/" + root.getChildNodes().item(2).getChildNodes().item(2).getFirstChild().getNodeValue());
        System.out.print("��һ��bookԪ�صĵڶ�����Ԫ��: ");
        // ʹ��getFirstChild����
        System.out.print(root.getFirstChild().getChildNodes().item(1).getNodeName());
        System.out.println("/" + root.getFirstChild().getChildNodes().item(1).getFirstChild().getNodeValue());
        System.out.print("���һ��bookԪ�صĵ��ĸ�Ԫ��: ");
        // getLastChild����
        System.out.print(root.getLastChild().getChildNodes().item(3).getNodeName());
        System.out.println("/" + root.getLastChild().getChildNodes().item(3).getFirstChild().getNodeValue());
        System.out.println("��ǰλ�� : ���һ��bookԪ�ص�code��Ԫ��: ");
        Node temp1 = root.getLastChild().getChildNodes().item(0);
        // getNextSibling����
        System.out.println("����һ���ֵ�Ԫ������Ϊ : " + temp1.getNextSibling().getNodeName());
        System.out.println("�丸Ԫ������Ϊ : " + temp1.getParentNode().getNodeName());                   
    }
}
