package saxexample;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 1999</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
//SAX解析的监听器
public class SAXParserHandler extends DefaultHandler{
  //XML文件的开始
  public void startDocument() throws SAXException{
    System.out.println("起始文档");
  }

  //XML文件的结束
  public void endDocument() throws SAXException{
    System.out.println("结束文档");
  }

//文本对象
  public void characters(char[] ch,int start,int length) throws SAXException{
    String charString = new String(ch,start,length);
    System.out.println("字符："+charString);
  }

  //元素和属性
  public void startElement(String namespaceURI,
                           String localName,
                           String qName,
                           Attributes atts) throws SAXException{
    System.out.println("起始元素:"+qName);
    for(int i=0;i<atts.getLength();i++){
      System.out.println("属性值:"+atts.getValue(i));
    }
}
}