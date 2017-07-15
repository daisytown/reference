/* ������: Ch12_4_4.java */
import javax.xml.parsers.*;
import org.xml.sax.*;  
import java.io.*;
import org.w3c.dom.*;

public class Ch12_4_4 {
    // ����XML�ļ�
    static Document document; 
    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // �趨����������
        dbf.setIgnoringComments(true);
        dbf.setIgnoringElementContentWhitespace(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        // ������XML�ļ�
        document = db.newDocument();
        // ������Ԫ��
        Element root = (Element) document.createElement("book"); 
        document.appendChild(root);
        // ������Ԫ��code
        Element temp = (Element) document.createElement("code");
        root.appendChild(temp);
        temp.appendChild(document.createTextNode("F8915"));
        // ������Ԫ��title
        temp = (Element) document.createElement("title");
        root.appendChild(temp);
        temp.appendChild(document.createTextNode("ASP��ҳ���������о�"));
        // ����authorԪ��
        Element newNode = (Element) document.createElement("author");
        root.insertBefore(newNode, root.getFirstChild());
        Node newText = document.createTextNode("�»ᰲ");
        root.getFirstChild().appendChild(newText);
        // ��������
        temp = (Element) root.getFirstChild().getNextSibling();
        temp.setAttribute("sales","Y");
        System.out.println("������XML�ļ�: ");
        printXML(root);
        // ɾ��authorԪ��
        root.removeChild((Element) root.getElementsByTagName("author").item(0));
        // ɾ��code����sales
        Element delNode = (Element) root.getFirstChild();
        delNode.removeAttribute("sales");
        System.out.println("ɾ�����XML�ļ�: ");
        printXML(root);
    }
    private static void printXML(Node root) {
        // ��ʾXML�ļ�
        System.out.println("��Ԫ��: " + root.getNodeName());
        NodeList nodes = root.getChildNodes();
        // ��ȡ���е��ӽڵ�
        for (int i=0; i < nodes.getLength(); i++) { 
            // Ԫ�غ����ֽڵ�
            System.out.print("Ԫ��: " + nodes.item(i).getNodeName());
            System.out.println("/" + nodes.item(i).getFirstChild().getNodeValue());
            // ��ʾָ��Ԫ�ص�����ֵ
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
