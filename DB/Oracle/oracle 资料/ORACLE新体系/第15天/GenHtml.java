import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;

class gethtml{//����XML��XSL����HTML
 
  // ���캯��
    public gethtml() {}
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
   
 
 
}

public class GenHtml{
	public static void main(String[] args) throws Exception{
	
      gethtml app = new gethtml();
       BufferedReader br = new BufferedReader(new FileReader("f:\\authors.xml"));
       String strLine;
       StringBuffer strBuffer = new StringBuffer();
       // ��ȡXML�ļ�������
       while ( (strLine = br.readLine()) != null ) {
             strBuffer.append(strLine+"\n");
       }        
       app.buildHTML(strBuffer.toString(), "f:\\authors.xslt");	
	}
}