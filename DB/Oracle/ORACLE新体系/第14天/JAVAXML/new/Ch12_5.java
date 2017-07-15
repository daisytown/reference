/* ������: Ch12_5.java */
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;

public class Ch12_5 {
    // ���캯��
    public Ch12_5() {}
    // ����HTML�ļ�
    public void buildHTML(String strXMLData, String strXSLTFile) throws Exception {
        String strHTMLFile;
        // ����HTML�ļ�����
        int pos = strXSLTFile.lastIndexOf(".");
        if ( pos != -1 ) {
           strHTMLFile = strXSLTFile.substring(0, pos) + ".htm";
        } else {
           strHTMLFile = strXSLTFile + ".htm";
        }
        // ����TransformerFactory����
        TransformerFactory tff = TransformerFactory.newInstance();
	// ����Transformer����
        Transformer tf = tff.newTransformer(new StreamSource(strXSLTFile));
        // ת��XML
        tf.transform(new StreamSource(new StringReader(strXMLData)), 
                     new StreamResult(new FileOutputStream(strHTMLFile)));
    }
    // ������
    public static void main(String[] args) throws Exception {  
       if (args.length != 2) {
          System.out.println("ʹ��: Ch12_5 xml xslt");
          return;
       }
       Ch12_5 app = new Ch12_5();
       BufferedReader br = new BufferedReader(new FileReader(args[0]));
       String strLine;
       StringBuffer strBuffer = new StringBuffer();
       // ��ȡXML�ļ�������
       while ( (strLine = br.readLine()) != null ) {
             strBuffer.append(strLine+"\n");
       }        
       app.buildHTML(strBuffer.toString(), args[1]);
    }
}
