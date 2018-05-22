package si.feri.ost.ost.demo.XMLParsing;
import java.io.File;
import java.io.IOException;

import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import si.feri.ost.ost.demo.Razredi.Dogodek;

public class XMLParser {
    public XMLParser()
    {
        ArrayList<Dogodek> dogodki=new ArrayList<Dogodek>();


        File fXmlFile = new File("C:\\Users\\Dejan Gregorc\\Documents\\GitHub\\Kulturnik\\ost_demo\\out\\production\\main\\si\\feri\\ost\\ost\\demo\\XMLParsing\\test.xml");
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder;
        try {
            dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(fXmlFile);
            doc.getDocumentElement().normalize();
            System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
            NodeList nList = doc.getElementsByTagName("movie");
            System.out.println("--------------------------------------------------------------------------------------------------------------------------");
            for (int temp = 0; temp < nList.getLength(); temp++) {

                Node nNode = nList.item(temp);

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                    Element eElement = (Element) nNode;
                    String naziv=eElement.getElementsByTagName("title").item(0).getTextContent();

                    String vir=eElement.getElementsByTagName("url").item(0).getTextContent();

                    String virURL=eElement.getElementsByTagName("poster").item(0).getTextContent().trim();

                    String opis=eElement.getElementsByTagName("plot_outline").item(0).getTextContent();
                    String datum=eElement.getElementsByTagName("date").item(0).getTextContent();
                    System.out.println("--------------------------------------------------------------------------------------------------------------------------");
                    dogodki.add(new Dogodek(naziv,vir,virURL,"Film",opis,"Maribor","Loška ulica 13",datum));


                }
                for (Dogodek dogodek : dogodki) {
                    System.out.println(dogodek);

                }
                System.out.println(dogodki.get(0).getDatum());
            }




        } catch (ParserConfigurationException | SAXException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }



    }
}
