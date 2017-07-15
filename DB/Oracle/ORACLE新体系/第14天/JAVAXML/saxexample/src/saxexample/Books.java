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
    //1.建立SAX解析工厂
    SAXParserFactory factory = SAXParserFactory.newInstance();
    //2.构造解析器
    SAXParser parser = factory.newSAXParser();
    //3.解析XML使用HANDLER
    parser.parse("books.xml",new SAXParserHandler());
  }
}