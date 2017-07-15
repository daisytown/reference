/* ������: Ch12_3_1.java */
//�����
import javax.xml.parsers.*;//xml����
import org.xml.sax.*; //�쳣����
import org.w3c.dom.*; //dom��
import java.io.*; //��ȡ�ļ�

public class Ch12_3_1 {
    // ����XML�ļ�
    //����Document ����XML�ļ�
    static Document document;
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("ʹ��: java Ch12_3_1 xml_file");
            return;
        }
        //1.�ĵ�������
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
           //2.����DocumentBuilder �ĵ�������
           DocumentBuilder db = dbf.newDocumentBuilder();
           // 3.����XML�ļ� parse������һ��XML�ļ�����ڴ��е���
           document = db.parse(new File(args[0]));
           // ��ȡ�ļ����ӽڵ�
           Node child = (Node)document.getFirstChild();
           // ��ȡ��һ������нڵ�
           for ( ; child != null; child = child.getNextSibling()) {
               System.out.print("Ԫ��: " + child.getNodeName());
               System.out.println("/����: " + child.getNodeType());
               printChildNode(child, 0);
           }
        } catch(SAXException se) {
           // ���̴���
           Exception  e = se;
           if (se.getException() != null)
               e = se.getException();
           e.printStackTrace();
        } catch(ParserConfigurationException pe) {
            // �������趨����
            pe.printStackTrace();
        } catch(IOException ie) {
           // �ļ��������
           ie.printStackTrace();
        }
    }
    // ��ʾ�ӽڵ�ķ��ط���
    private static void printChildNode(Node temp, int pos) {
      //�ж��Ƿ����ӽڵ�
      if (temp.hasChildNodes()) {
      //�õ������ӽڵ�
           NodeList nodes = temp.getChildNodes();
           // ѭ����ȡ���е��ӽڵ�
           for (int i=0; i < nodes.getLength(); i++) {
              //�õ��ڵ�����
              int type = nodes.item(i).getNodeType();
              //��Ԫ�ؽڵ�
              if (type == Node.ELEMENT_NODE) {
                 //����һ��������ʽ
                 printIndent(pos);
                 //��ӡԪ�ص�����
                 System.out.println(" Ԫ��(" + i + "):" + nodes.item(i).getNodeName());
                 //�����ݹ�
                 printChildNode(nodes.item(i), pos+1);
              }
              //���ı��ڵ�
              if (type == Node.TEXT_NODE) {
                 printIndent(pos);
                 System.out.print(" Ԫ��(" + i + "): " + nodes.item(i).getNodeName());
                 //��ӡֵ
                 String val = nodes.item(i).getNodeValue();
                 if (val != null) {
                     System.out.print("/Ԫ��ֵ: ");
                     if (val.trim().equals(""))
                       System.out.println("[WS]");
                     else
                        System.out.println(val);
                 }
              }
           }
        }
    }
    // ��ʾ���ŵ��ַ�
    private static void printIndent(int num) {
        System.out.print("  +");
        for (int i = 0; i <= num; i++) {
            System.out.print("--");
        }
    }
}
