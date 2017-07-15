import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;

class gethtml{//利用XML和XSL生成HTML
 
  // 构造函数
    public gethtml() {}
    // 建立HTML文件
    public void buildHTML(String strXMLData, String strXSLTFile) throws Exception {
        String strHTMLFile;
        // 建立HTML文件名称
        int pos = strXSLTFile.lastIndexOf(".");
        if ( pos != -1 ) {
           strHTMLFile = strXSLTFile.substring(0, pos) + ".htm";
        } else {
           strHTMLFile = strXSLTFile + ".htm";
        }
        // 建立TransformerFactory对象
        TransformerFactory tff = TransformerFactory.newInstance();
	// 建立Transformer对象
        Transformer tf = tff.newTransformer(new StreamSource(strXSLTFile));
        // 转换XML
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
       // 读取XML文件的内容
       while ( (strLine = br.readLine()) != null ) {
             strBuffer.append(strLine+"\n");
       }        
       app.buildHTML(strBuffer.toString(), "f:\\authors.xslt");	
	}
}