package si.feri.ost.ost.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.w3c.dom.CharacterData;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import si.feri.ost.ost.demo.DAO.DogodekDAO;
import si.feri.ost.ost.demo.DAO.OsebaDAO;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.DogodekComparator;
import si.feri.ost.ost.demo.Razredi.Oseba;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

//
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


        String avatar = "https://api.adorable.io/avatars/111/"+email;
        osebe.addOseba(ime, priimek, email, geslo, datumRojstva, telefonska,avatar);
        boolean jeDodan = true;
        model.addAttribute("dodanaOseba", jeDodan);
        return "/vpis";
    }

    @RequestMapping(value = {"/", "/index",}, method = RequestMethod.GET)
    public String zadnjih5(Model model) {
        model.addAttribute("dogodki",dogodki.zadnjihNeki());


        return "index";
    }

    @RequestMapping(value = {"/blob"}, method = RequestMethod.GET)
    @ResponseBody
    public String blobtest(Model model) {
        model.addAttribute("dogodki",dogodki.zadnjihNeki());
        dogodki.insertBlob();

        return "index";
    }

    public static ArrayList<Dogodek> seznamDogodkov = new ArrayList<>();

    @RequestMapping(value = {"/dodajDogodek"}, method = RequestMethod.POST)
    public String dodajDogodek(Model model, @RequestParam(value = "naziv", required = false) String naziv,
                               @RequestParam(value = "idDogodka", required = false) String idDogodka,
                               @RequestParam(value = "kraj", required = false) String kraj,
                               @RequestParam(value = "ura", required = false) String ura,
                               @RequestParam(value = "izvajalec", required = false) String izvajalec,
                               @RequestParam(value = "lokacija", required = false) String lokacija,
                               @RequestParam(value = "cena", required = false) String cena,
                               @RequestParam(value = "opis", required = false) String opis,
                               @RequestParam(value = "slika", required = false) String slikaURL,
                               @RequestParam(value = "idUporabnika", required = false) String idUporabnika,
                               @RequestParam(value = "tipDogodka", required = false) String tip,
                               @RequestParam(value = "datum", required = false) String datum,
                               @RequestParam(value = "urlDogodka", required = false) String vir) throws ParseException {


        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);

        //  if(Boolean.valueOf(String.valueOf(session.getAttribute("urejanjeDogodka"))) && (Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen"))))){
        if (idDogodka != "") {

            dogodki.updateDogodek(Integer.parseInt(idDogodka), naziv, kraj, ura, izvajalec, lokacija, cena, opis, slikaURL, tip, datum, vir);
        } else {

            int id = Integer.parseInt(String.valueOf(session.getAttribute("idUporabnika")));

            dogodki.addDogodek(naziv, kraj, ura, izvajalec, lokacija, cena, opis, slikaURL, id, tip, datum, vir);

            boolean jeDodan = true;
            model.addAttribute("dodanDogodek", jeDodan);
        }
        return "index";
    }

    @RequestMapping(value = {"/uredi"}, method = RequestMethod.GET)
    public String prikaziStran(Model model,
                               @RequestParam(value = "ime", required = false) String ime) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);

        boolean uporabnikPrijavljen = (Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen"))));
        if (ime.equals("dodajanje")) {
            model.addAttribute("urejanjeDogodka", false);

            if (uporabnikPrijavljen) {

                return "add";
            } else
                return "vpis";

        } else {
            model.addAttribute("urejanjeDogodka", true);

            if (uporabnikPrijavljen) {
                Dogodek urejan = dogodki.getByID(Integer.parseInt(ime));
                model.addAttribute("urejanDogodek", urejan);
                model.addAttribute("idD", ime);
                return "add";
            } else
                return "vpis";
        }

    }


    @RequestMapping(value = {"/Konzola",}, method = RequestMethod.GET)
    public String konzola(Model model, @RequestParam(value = "event", required = false) String tip) {
        if (tip == null)
            model.addAttribute("dogodki", dogodki.getAllDogodki());
        else
            model.addAttribute("dogodki", dogodki.getByTip(tip));
        return "Konsola";
    }

    @RequestMapping(value = {"/Osebice",}, method = RequestMethod.GET)
    public String bazaOseb(Model model, @RequestParam(value = "osebe", required = false) String tip) {
        model.addAttribute("oseba", oseba.getAllOsebe());
        return "Konsola";
    }

    //dodajala
    @RequestMapping(value = {"/events",}, method = RequestMethod.GET)
    public String events(Model model, @RequestParam(value = "event", required = false) String tip)

    {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);//true will create if necessary


        model.addAttribute("najnizjaCena",dogodki.vrniNajnizjoCeno());
        model.addAttribute("najvisjaCena",dogodki.vrniNajvisjoCeno());


        int idUporabnika;
        Oseba prijavljenUporabnik;
        List<Oseba> rez = new ArrayList<>();

        if (tip.equals("Moji dogodki") && Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen")))) {
            idUporabnika = Integer.parseInt(String.valueOf(session.getAttribute("idUporabnika")));
            prijavljenUporabnik = osebe.getByID(idUporabnika);
            rez.add(prijavljenUporabnik);
            List<Dogodek> temp = dogodki.getByIdUporabnika(idUporabnika);
            model.addAttribute("dogodki", temp);
            model.addAttribute("uporabnik", rez);
            model.addAttribute("stDogodkovUporabnika", temp.size());

            return "uporabnik";

        } else {
            if (tip == null)
                model.addAttribute("dogodki", dogodki.getAllDogodki());

            else if (tip.equals("Moji dogodki"))
                return "vpis";


            else {

                model.addAttribute("dogodki", dogodki.getByTip(tip));
                model.addAttribute("Kategorija", tip);


            }
        }


        return "events";
    }
    public List<Dogodek> sortiraj(List<Dogodek> rezultat, String sort) {

        if(sort.equals("najcenejsi"))
            Collections.sort(rezultat,new DogodekComparator(true,true));

        else if(sort.equals("najdrazji"))
            Collections.sort(rezultat,new DogodekComparator(true,false));

        else if(sort.equals("poImenu1"))
            Collections.sort(rezultat, new DogodekComparator(false,false));

        else if(sort.equals("poImenu2"))
            Collections.sort(rezultat,new DogodekComparator(false,false).reversed());



        return rezultat;
    }

    @RequestMapping(value = {"/filter",}, method = RequestMethod.GET)
    public String eventsFilter(Model model,
                               @RequestParam(value = "nazivDogodka", required = false) String naziv,
                               @RequestParam(value = "krajDogodka", required = false) String kraj,
                               @RequestParam(value = "datumDogodka", required = false) String datum,
                               @RequestParam(value = "event", required = false) String kateg,
                               @RequestParam(value="inputKategorija",required=false) String sort,
                               @RequestParam(value = "cenaDogodka", required = false) String cena)throws ParseException {



        List<Dogodek> seznam = dogodki.getByTip(kateg);
        List<Dogodek> rez = new ArrayList<>();


        if (datum != null && !datum.equals("")) {
            DateFormat dateFormat = new SimpleDateFormat("dd MMMM, yyyy");
            Date date = dateFormat.parse(datum);

            DateFormat noviFormat = new SimpleDateFormat("yyyy-MM-dd");

            datum = noviFormat.format(date);
        }

        for (int i = 0; i < seznam.size(); i++) {
            if ((naziv.equals("") || seznam.get(i).getNaziv().toLowerCase().contains(naziv.toLowerCase())) &&
                    (kraj.equals("") || seznam.get(i).getKraj().equals(kraj)) &&
                    (cena == null || cena.equals("") || Double.parseDouble(seznam.get(i).getCena()) <= Double.parseDouble(cena)) &&
                    (datum == null || datum.equals("") || seznam.get(i).getDatum().equals(datum))){
                rez.add(seznam.get(i));
            }

        }

        if(sort!= null && !sort.equals(""))
            rez = sortiraj(rez,sort);


        model.addAttribute("dogodki", rez);

        model.addAttribute("Kategorija", kateg);

        return "events";
    }


    @RequestMapping(value = {"/parseXML"}, method = RequestMethod.GET)
    public String xmlpars(Model model,@RequestParam(value="event" ,required=false)String kategorija) {
        List<Dogodek> dogod;
        dogod=dogodki.getAllDogodki();
        model.addAttribute("Kategorija",kategorija);


        //<------------------------------------Kolosej---------------------------------------------------->
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = null;
            URL url = new URL("https://www.kolosej.si/spored/xml/2.0/");
            db = dbf.newDocumentBuilder();
            Document doc = db.parse(url.openStream());
            doc.getDocumentElement().normalize();
            //System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
            NodeList nList = doc.getElementsByTagName("movie");
            //System.out.println("--------------------------------------------------------------------------------------------------------------------------");
            for (int temp = 0; temp < nList.getLength(); temp++) {

                Node nNode = nList.item(temp);

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                    Element eElement = (Element) nNode;
                    String naziv = eElement.getElementsByTagName("title").item(0).getTextContent();

                    String vir = eElement.getElementsByTagName("url").item(0).getTextContent();

                    String virURL = eElement.getElementsByTagName("poster").item(0).getTextContent().trim();

                    String opis = eElement.getElementsByTagName("plot_outline").item(0).getTextContent();
                    String datum = eElement.getElementsByTagName("date").item(0).getTextContent();
                    //System.out.println(datum);

                    String ura = eElement.getElementsByTagName("time").item(0).getTextContent();
                    String lokacija = eElement.getElementsByTagName("center").item(0).getTextContent();
                    String kraj = eElement.getElementsByTagName("city").item(0).getTextContent();
                    String izvajalec = eElement.getElementsByTagName("distributor").item(0).getTextContent();

                    Dogodek dog=new Dogodek(naziv, kraj, ura, izvajalec, lokacija, "6", opis, virURL, 1, "Film", datum, vir);
                    System.out.println(dog);
                    boolean obstaja=false;
                    for(int i=0;i<dogod.size();i++) {
                        if (dogod.get(i).getNaziv().equals(dog.getNaziv()))
                        {
                            obstaja = true;
                        break;
                        }
                    }
                    if(obstaja){}
                        else {
                        dogodki.addXML(naziv, kraj, ura, izvajalec, lokacija, "6", opis, virURL, 1, "Film", datum, vir);
                    }

                }

            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //<!------------------------------RSS-gledališče--------------------------------->
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = null;
            URL url = new URL("http://www.eventim.si/si/rss/latest.xml");
            db = dbf.newDocumentBuilder();
            Document doc = db.parse(url.openStream());
            doc.getDocumentElement().normalize();
            System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
            NodeList nList = doc.getElementsByTagName("item");
            //System.out.println("--------------------------------------------------------------------------------------------------------------------------");
            for (int temp = 0; temp < nList.getLength(); temp++) {

                Node nNode = nList.item(temp);

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                    Element eElement = (Element) nNode;
                    String naziv = eElement.getElementsByTagName("title").item(0).getTextContent();
                    System.out.println(naziv);
                    String vir = eElement.getElementsByTagName("link").item(0).getTextContent();
                    System.out.println(vir);


                    String opis = eElement.getElementsByTagName("description").item(0).getTextContent();
                    String datum = eElement.getElementsByTagName("pubDate").item(0).getTextContent();
                    System.out.println(datum);



                    Dogodek dog=new Dogodek(naziv, opis, vir, "Gledališče", 666, datum);
                    System.out.println(dog);
                    boolean obstaja=false;
                    for(int i=0;i<dogod.size();i++) {
                        if (dogod.get(i).getNaziv().equals(dog.getNaziv()))
                        {
                            obstaja = true;
                            break;
                        }
                    }
                    if(obstaja){}
                    else {
                        dogodki.addXML(naziv,opis,vir,"Gledališče",666,datum);
                    }

                }

            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }






        model.addAttribute("dogodki", dogodki.getByTip(kategorija));


        return "events";
    }


    @RequestMapping(value = {"/prijava"}, method = RequestMethod.POST)
    public String prijava(Model model,
                          @RequestParam(value = "username") String email,
                          @RequestParam(value = "password") String geslo,
                          @RequestParam(value = "event") String tip) {
        List<Oseba> vseOsebe = osebe.getAllOsebe();

        boolean prijavaUspesna = false;

        for (int i = 0; i < vseOsebe.size(); i++) {

            if (vseOsebe.get(i).getEmail().equals(email) && vseOsebe.get(i).getGeslo().equals(geslo)) {
                prijavaUspesna = true;

                model.addAttribute("uspesnost",true);

                HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
                HttpSession session = request.getSession(true);

                Oseba uporabnik = osebe.getByEmail(email);
                session.setAttribute("idUporabnika", uporabnik.getId());
                session.setAttribute("uporabnikPrijavljen", prijavaUspesna);

                session.setAttribute("imeUporabnika", uporabnik.getIme());
                session.setAttribute("priimekUporabnika", uporabnik.getPriimek());

                Oseba prijavljenUporabnik ;
                int idUporabnika;
                List<Oseba> rez = new ArrayList<>();

                if (tip.equals("Moji dogodki")) {
                    idUporabnika = Integer.parseInt(String.valueOf(session.getAttribute("idUporabnika")));
                    List<Dogodek> dogodkiUporabnikaByID ;/*= dogodki.getByIdUporabnika(idUporabnika);
                    List<Dogodek> vsiDogodki = dogodki.getAllDogodki();*/
                    if(idUporabnika==666){
                        dogodkiUporabnikaByID= dogodki.getAllDogodki();

                    }else{
                         dogodkiUporabnikaByID= dogodki.getByIdUporabnika(idUporabnika);
                    }
                    prijavljenUporabnik = osebe.getByID(idUporabnika);
                    rez.add(prijavljenUporabnik);

                    model.addAttribute("dogodki", dogodkiUporabnikaByID);
                    model.addAttribute("uporabnik", rez);
                    model.addAttribute("stDogodkovUporabnika", dogodkiUporabnikaByID.size());


                }


            }


        }
        if (prijavaUspesna == false) {
            model.addAttribute("uspesnost", prijavaUspesna);
            return "vpis";

        }

        return "uporabnik";


    }


    @RequestMapping(value = {"/addDogodek"}, method = RequestMethod.POST)
    public String dodajArtikli(@RequestParam(value = "naziv", required = true) String naziv,
                               @RequestParam(value = "kraj", required = true) String kraj,
                               @RequestParam(value = "naslov", required = true) String naslov,
                               @RequestParam(value = "tipDogodka", required = true) String tipD,
                               @RequestParam(value = "urlDogodka", required = true) String url,
                               @RequestParam(value = "datum", required = true) String datum,
                               @RequestParam(value = "slika", required = false) String slika,
                               @RequestParam(value = "opis", required = false) String opis,
                               @RequestParam(value = "cena", required = false) String cena) {
        // dogodki.addDogodek(naziv,url,slika,tipD,kraj,opis,naslov,datum,cena);
        return "/seznamDogodkov";
    }


    @RequestMapping(value = {"/downXML"}, method = RequestMethod.GET)
    @ResponseBody
    public String testing123(Model model) {
        List<Dogodek> dogodk=dogodki.getAllDogodki();


        String zaZapisat="";



        /*DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
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

                    String ura =eElement.getElementsByTagName("time").item(0).getTextContent();
                    String lokacija = eElement.getElementsByTagName("center").item(0).getTextContent();
                    String kraj = eElement.getElementsByTagName("city").item(0).getTextContent();
                    String izvajalec=eElement.getElementsByTagName("distributor").item(0).getTextContent();
                    //dogod.add(new Dogodek(naziv,kraj,ura,"Kolosej",lokacija,6,opis,virURL,"Kino",datum,vir));
                    //dogodki.add(new Dogodek(naziv, kraj, ura, izvajalec, lokacija, "6", opis, virURL,1, "Film", datum, vir));

                }

            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        }
        */
        for (Dogodek dogodek : dogodk) {
            System.out.println(dogodek);

        }
        File file = new File("C:\\Users\\Uporabnik\\Desktop\\text.xml");
            try {

            for(int i=0;i<dogodk.size();i++)
            {

                JAXBContext jaxbContext = JAXBContext.newInstance(Dogodek.class);
                Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
                jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

                jaxbMarshaller.marshal(dogodk.get(i), file);// this line create customer.xml file in specified path.

                StringWriter sw = new StringWriter();
                jaxbMarshaller.marshal(dogodk.get(i), sw);
                String xmlString = sw.toString();
                zaZapisat+=xmlString;



                System.out.println(xmlString);
            }
        }
        catch(Exception e){
            e.printStackTrace();

        }
        finally {}


        System.out.println("_____________________________________________________________________________");
        System.out.println(zaZapisat);
        /*try {
            //FileWriter fw = new FileWriter(file);
            //fw.write(zaZapisat);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }*/
        return zaZapisat;
    }




}










