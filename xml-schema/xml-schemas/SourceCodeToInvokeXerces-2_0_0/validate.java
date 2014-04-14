import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.SAXParseException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;
import org.xml.sax.helpers.DefaultHandler;

public class validate extends DefaultHandler {
    static final String parserName = "org.apache.xerces.parsers.SAXParser";
    StringBuffer result = new StringBuffer("");

    /** Warning. */
    public void warning(SAXParseException ex) {

        result.append("[Warning] "+
                           getLocationString(ex)+": "+
                           ex.getMessage() + " ");
    }

    /** Error. */
    public void error(SAXParseException ex) {

        result.append("[Error] "+
                           getLocationString(ex)+": "+
                           ex.getMessage() + " ");
    }

    /** Fatal error. */
    public void fatalError(SAXParseException ex) throws SAXException {

        result.append("[Fatal Error] "+
                           getLocationString(ex)+": "+
                           ex.getMessage() + " ");
    }

    /** Returns a string of the location. */
    private String getLocationString(SAXParseException ex) {
        StringBuffer str = new StringBuffer();

        String systemId = ex.getSystemId();
        if (systemId != null) {
            int index = systemId.lastIndexOf('/');
            if (index != -1)
                systemId = systemId.substring(index + 1);
            str.append(systemId);
        }
        str.append(':');
        str.append(ex.getLineNumber());
        str.append(':');
        str.append(ex.getColumnNumber());

        return str.toString();

    } // getLocationString(SAXParseException):String

    public static String process(String xmlFileURL) {
        try {
            validate validate = new validate();
            XMLReader parser = XMLReaderFactory.createXMLReader(parserName);
            parser.setContentHandler(validate);
            parser.setErrorHandler(validate);
            parser.setFeature("http://xml.org/sax/features/validation", true);
            parser.setFeature("http://apache.org/xml/features/validation/schema", true);
            parser.setFeature("http://apache.org/xml/features/validation/schema-full-checking", true);
            parser.parse(xmlFileURL);
            return validate.result.toString(); 
        }
        catch (Exception e) { e.printStackTrace(); }
        return null;
    }


    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: java validate <XML file>");
            return;
        }
        try {
            String validationResults = process(args[0]);
            System.out.println(validationResults);
        }
        catch (Exception e) { e.printStackTrace(); }
    }
}
