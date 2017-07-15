/* ������: Ch12_3_3.java */
import javax.xml.parsers.*;
import org.xml.sax.*;  
import java.io.*;
import org.w3c.dom.*;

public class Ch12_3_3 {
    // ����XML�ļ�
    static Document document; 
    public static void main(String[] args) throws SAXException {
        if (args.length != 1) {
            System.out.println("ʹ��: java Ch12_3_3 xml_file");
            return;
        }
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
           dbf.setValidating(true);
           // �趨����������
           dbf.setIgnoringComments(false);
           dbf.setIgnoringElementContentWhitespace(false);
           dbf.setCoalescing(false);
           DocumentBuilder db = dbf.newDocumentBuilder();
           // ָ�����������
           db.setErrorHandler(new parserErrorHandler());
           // ����XML�ļ�
           document = db.parse(new File(args[0]));
           // ȡ���ļ����ӽڵ�
           Node child = (Node)document.getFirstChild();
           // ȡ����һ������нڵ�
           for ( ; child != null; child = child.getNextSibling()) { 
               System.out.print("Ԫ��: " + child.getNodeName());
               System.out.println("/����: " + child.getNodeType());
               printChildNode(child, 0);
           }
        } catch(ParserConfigurationException pe) {
           // �������趨����
           pe.printStackTrace();
        } catch(IOException ie) {
           // �ļ��������
           ie.printStackTrace();
        }
    }
    // �����Ĵ��������
    private static class parserErrorHandler implements ErrorHandler {
        // ��ȡ������Ϣ
        private String getMsg(SAXParseException spe) {
            String sysId = spe.getSystemId();
            if (sysId == null) {
                sysId = "NULL";
            }
            String msg = "URI=" + sysId + " �к�=" + spe.getLineNumber() +
                         ": " + spe.getMessage();
            return msg;
        }
        // ��׼SAX ErrorHandler����
        public void warning(SAXParseException spe) throws SAXException {
            System.out.println("\n����: " + getMsg(spe));
        }
        public void error(SAXParseException spe) throws SAXException {
            String message = "\n����: " + getMsg(spe);
            throw new SAXException(message);
        }
        public void fatalError(SAXParseException spe) throws SAXException {
            String message = "\n���ش���: " + getMsg(spe);
            throw new SAXException(message);
        }
    }
    // ��ʾ�ӽڵ�ķ��ط���
    private static void printChildNode(Node temp, int pos) {
        if (temp.hasChildNodes()) {
           NodeList nodes = temp.getChildNodes();
           // ��ȡ���е��ӽڵ�
           for (int i=0; i < nodes.getLength(); i++) { 
              int type = nodes.item(i).getNodeType();
              if (type == Node.ELEMENT_NODE) {
                 printIndent(pos);
                 System.out.println(" Ԫ��(" + i + "):" + nodes.item(i).getNodeName());
                 printChildNode(nodes.item(i), pos+1);
              } 
              if (type == Node.TEXT_NODE) {
                 printIndent(pos);
                 System.out.print(" Ԫ��(" + i + "): " + nodes.item(i).getNodeName());
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
