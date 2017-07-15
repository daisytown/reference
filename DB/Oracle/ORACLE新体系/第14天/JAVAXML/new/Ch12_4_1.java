/* ������: Ch12_4_1.java */
import javax.xml.parsers.*;
import org.xml.sax.*;
import java.io.*;
import org.w3c.dom.*;

public class Ch12_4_1 {
    //����XML�ļ�
    static Document document;
    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // �趨����������
        //����ע��
        dbf.setIgnoringComments(true);
        //���Կյ��ı�
        dbf.setIgnoringElementContentWhitespace(true);

        DocumentBuilder db = dbf.newDocumentBuilder();
        //����XML�ļ�
        document = db.parse(new File("dept.xml"));
        // ��ȡ��Ԫ��
        Node root = document.getDocumentElement();
        System.out.println("��Ԫ��: " + root.getNodeName());
        NodeList nodes = root.getChildNodes();
        // ��ȡ���е��ӽڵ�
        for (int i=0; i < nodes.getLength(); i++) {
           // Ԫ�غ����ֽڵ�
           System.out.println("Ԫ��: " + nodes.item(i).getNodeName());
           if (nodes.item(i).hasChildNodes()) {
              NodeList childs = nodes.item(i).getChildNodes();
              // ��ʾ�����ӽڵ�
              for (int j=0; j < childs.getLength(); j++) {
                  int type = childs.item(j).getNodeType();
                  if (type == Node.ELEMENT_NODE) {
                     System.out.print("   +-- " + childs.item(j).getNodeName());
                     System.out.println("/" + childs.item(j).getFirstChild().getNodeValue());
                  }
              }
           }
        }
        // ��ʾָ��Ԫ�ص�����ֵ
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
