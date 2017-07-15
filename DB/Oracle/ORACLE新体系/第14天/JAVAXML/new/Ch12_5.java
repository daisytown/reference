/* 程序范例: Ch12_5.java */
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;

public class Ch12_5 {
    // 构造函数
    public Ch12_5() {}
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
    // 主程序
    public static void main(String[] args) throws Exception {  
       if (args.length != 2) {
          System.out.println("使用: Ch12_5 xml xslt");
          return;
       }
       Ch12_5 app = new Ch12_5();
       BufferedReader br = new BufferedReader(new FileReader(args[0]));
       String strLine;
       StringBuffer strBuffer = new StringBuffer();
       // 读取XML文件的内容
       while ( (strLine = br.readLine()) != null ) {
             strBuffer.append(strLine+"\n");
       }        
       app.buildHTML(strBuffer.toString(), args[1]);
    }
}
