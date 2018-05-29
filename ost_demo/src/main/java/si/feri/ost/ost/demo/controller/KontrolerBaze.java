package si.feri.ost.ost.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import si.feri.ost.ost.demo.DAO.DogodekDAO;
import si.feri.ost.ost.demo.DAO.OsebaDAO;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.Oseba;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

@Controller
public class KontrolerBaze {
    @Autowired
    DogodekDAO dogodki;
    @Autowired

    OsebaDAO osebe;

    OsebaDAO oseba;



    @RequestMapping(value = {"/dodajanjeOsebe"}, method = RequestMethod.POST)
    public String dodajOsebo(Model model, @RequestParam(value = "ime", required = true) String ime,
                             @RequestParam(value = "priimek", required = true) String priimek,
                             @RequestParam(value = "email", required = true) String email,
                             @RequestParam(value = "geslo", required = true) String geslo,
                             @RequestParam(value = "datumRojstva", required = true) String datumRojstva,
                             @RequestParam(value = "telefonska", required = true) String telefonska) {


        osebe.addOseba(ime, priimek, email, geslo, datumRojstva, telefonska);
        boolean jeDodan = true;
        model.addAttribute("dodanaOseba", jeDodan);
        return "/registracija";
    }

    public static ArrayList<Dogodek> seznamDogodkov = new ArrayList<>();
    @RequestMapping(value = {"/dodajDogodek" }, method = RequestMethod.POST)
    public String dodajDogodek(Model model, @RequestParam(value="naziv",required=true)String naziv,
                               @RequestParam(value="kraj",required=true)String kraj,
                               @RequestParam(value="naslov",required = true)String naslov,
                               @RequestParam(value="tipDogodka",required = true)String tipD,
                               @RequestParam(value="urlDogodka",required = true)String url,
                               @RequestParam(value="datum",required = true)String datum,
                               @RequestParam(value="slika",required = false)String slika,
                               @RequestParam(value="opis",required = false)String opis,
                               @RequestParam(value="cena",required = false)String cena)  {

        dogodki.addDogodek(naziv,url,slika,tipD,opis,kraj,naslov,datum,cena);

        boolean jeDodan = true;
        model.addAttribute("dodanDogodek",jeDodan);
        return "add";
    }


    @RequestMapping(value={"/Konzola",}, method=RequestMethod.GET)
    public String konzola(Model model,@RequestParam(value="tip", required=false)String tip)
    {
        if(tip==null)
            model.addAttribute("dogodki",dogodki.getAllDogodki());
            else
        model.addAttribute("dogodki",dogodki.getByTip(tip));
        return "Konsola";
    }

    @RequestMapping(value={"/Osebice",}, method=RequestMethod.GET)
    public String bazaOseb(Model model,@RequestParam(value="osebe", required=false)String tip)
    {
            model.addAttribute("oseba",oseba.getAllOsebe());
        return "Konsola";
    }


    @RequestMapping(value={"/events",}, method=RequestMethod.GET)
    public String events(Model model,@RequestParam(value="tip", required=false)String tip)
    {


        if(tip==null)
            model.addAttribute("dogodki",dogodki.getAllDogodki());
        else
        {
            model.addAttribute("dogodki",dogodki.getByTip(tip));
            model.addAttribute("Kategorija",tip);

        }



        return "events";
    }

    @RequestMapping(value={"/parseXML"},method=RequestMethod.GET)
    public String xmlpars(Model model)
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

                    dogod.add(new Dogodek(naziv,vir,virURL,"film",opis,"Maribor","Loška ulica 13",datum,"3"));


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
        for (Dogodek d:dogod)
        {
            dogodki.addDogodek(d.getNaziv(),d.getVir(),d.getSlikaURL(),d.getTip(),d.getKraj(),d.getOpis(),d.getNaslov(),d.getDatum(),d.getCena());


        }

        return "Konsola";
    }


    @RequestMapping(value={"/prijava"},method=RequestMethod.POST)
    public String prijava(Model model,
                          @RequestParam(value="username")String email,
                          @RequestParam(value="password")String geslo){

        List<Oseba> vseOsebe = oseba.getAllOsebe();

        for(int i=0; i<vseOsebe.size(); i++){

            if(vseOsebe.get(i).getEmail().equals(email) && vseOsebe.get(i).getGeslo().equals(geslo))
                return "events";


        }
<<<<<<< HEAD

        return "prijava";
=======
        return "vpis";
>>>>>>> a5fd2e96f9f6afd796ca4331616c54089a6d4490

    }



    @RequestMapping(value = { "/addDogodek" }, method = RequestMethod.POST)
    public String dodajArtikli(@RequestParam(value="naziv",required=true)String naziv,
                               @RequestParam(value="kraj",required=true)String kraj,
                               @RequestParam(value="naslov",required = true)String naslov,
                               @RequestParam(value="tipDogodka",required = true)String tipD,
                               @RequestParam(value="urlDogodka",required = true)String url,
                               @RequestParam(value="datum",required = true)String datum,
                               @RequestParam(value="slika",required = false)String slika,
                               @RequestParam(value="opis",required = false)String opis,
                               @RequestParam(value="cena",required = false)String cena)
    {
        dogodki.addDogodek(naziv,url,slika,tipD,kraj,opis,naslov,datum,cena);
        return "/seznamDogodkov";
    }










}
