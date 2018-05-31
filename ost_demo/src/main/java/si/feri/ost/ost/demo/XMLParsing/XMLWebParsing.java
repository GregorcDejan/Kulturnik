package si.feri.ost.ost.demo.XMLParsing;


import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.DocumentBuilder;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import si.feri.ost.ost.demo.Razredi.Dogodek;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class XMLWebParsing
{
    public XMLWebParsing()
    {
        ArrayList<Dogodek> dogod = new ArrayList<Dogodek>();


        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = null;

        try {
            URL url=new URL("https://www.kolosej.si/spored/xml/2.0/");
            db = dbf.newDocumentBuilder();
            Document doc = db.parse(url.openStream());
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
                    String ura =eElement.getElementsByTagName("time").item(0).getTextContent();
                    String lokacija = eElement.getElementsByTagName("center").item(0).getTextContent();
                    String kraj = eElement.getElementsByTagName("city").item(0).getTextContent();
                    String izvajalec=eElement.getElementsByTagName("distributor").item(0).getTextContent();
                    //dogod.add(new Dogodek(naziv,kraj,ura,"Kolosej",lokacija,6,opis,virURL,"Kino",datum,vir));


                }

            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        }

        for (Dogodek dogodek : dogod) {
            System.out.println(dogodek);

        }
        System.out.println(dogod.get(0).getDatum());

    }
}
