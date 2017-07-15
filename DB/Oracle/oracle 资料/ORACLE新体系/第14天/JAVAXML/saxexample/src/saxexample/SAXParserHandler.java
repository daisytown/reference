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
//SAX�����ļ�����
public class SAXParserHandler extends DefaultHandler{
  //XML�ļ��Ŀ�ʼ
  public void startDocument() throws SAXException{
    System.out.println("��ʼ�ĵ�");
  }

  //XML�ļ��Ľ���
  public void endDocument() throws SAXException{
    System.out.println("�����ĵ�");
  }

//�ı�����
  public void characters(char[] ch,int start,int length) throws SAXException{
    String charString = new String(ch,start,length);
    System.out.println("�ַ���"+charString);
  }

  //Ԫ�غ�����
  public void startElement(String namespaceURI,
                           String localName,
                           String qName,
                           Attributes atts) throws SAXException{
    System.out.println("��ʼԪ��:"+qName);
    for(int i=0;i<atts.getLength();i++){
      System.out.println("����ֵ:"+atts.getValue(i));
    }
}
}