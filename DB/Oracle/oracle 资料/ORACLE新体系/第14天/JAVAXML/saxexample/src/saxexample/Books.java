package saxexample;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 1999</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class Books {
  public static void main(String[] args) throws Exception {
    //1.����SAX��������
    SAXParserFactory factory = SAXParserFactory.newInstance();
    //2.���������
    SAXParser parser = factory.newSAXParser();
    //3.����XMLʹ��HANDLER
    parser.parse("books.xml",new SAXParserHandler());
  }
}