package si.feri.ost.ost.demo.XMLParsing;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import si.feri.ost.ost.demo.DAO.DogodekDAO;
import si.feri.ost.ost.demo.Razredi.Dogodek;

import java.io.File;
import java.util.List;

public class exportXML

{
    @Autowired
    static DogodekDAO getDogodki;
    public static String export()
    {
        List<Dogodek> dogodki=getDogodki.getAllDogodki();

//haha
        int x;

        String zaZapisat="";



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
                    System.out.println(datum);
                    int y;
                    String ura =eElement.getElementsByTagName("time").item(0).getTextContent();
                    String lokacija = eElement.getElementsByTagName("center").item(0).getTextContent();
                    String kraj = eElement.getElementsByTagName("city").item(0).getTextContent();
                    String izvajalec=eElement.getElementsByTagName("distributor").item(0).getTextContent();
                    //dogod.add(new Dogodek(naziv,kraj,ura,"Kolosej",lokacija,6,opis,virURL,"Kino",datum,vir));
                    dogodki.add(new Dogodek(naziv, kraj, ura, izvajalec, lokacija, "6", opis, virURL,1, "Film", datum, vir));

                }

            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        }

        for (Dogodek dogodek : dogodki) {
            System.out.println(dogodek);

        }
        File file = new File("C:\\Users\\Dejan Gregorc\\Desktop\\text.xml");
        try {

            for (int i = 0; i < dogodki.size(); i++) {

                JAXBContext jaxbContext = JAXBContext.newInstance(Dogodek.class);
                Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
                jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

                jaxbMarshaller.marshal(dogodki.get(i), file);// this line create customer.xml file in specified path.

                StringWriter sw = new StringWriter();
                jaxbMarshaller.marshal(dogodki.get(i), sw);
                String xmlString = sw.toString();
                zaZapisat += xmlString;
                int z;

                System.out.println(xmlString);
            }
        } catch (JAXBException e) {

            e.printStackTrace();

        } finally {
        }


        System.out.println("_____________________________________________________________________________");
        System.out.println(zaZapisat);
        try {
            FileWriter fw = new FileWriter(file);
            //fw.write(zaZapisat);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return zaZapisat;
    }
}
