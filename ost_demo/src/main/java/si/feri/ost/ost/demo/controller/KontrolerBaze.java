package si.feri.ost.ost.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import si.feri.ost.ost.demo.DAO.DogodekDAO;
import si.feri.ost.ost.demo.DAO.OsebaDAO;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.Oseba;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @RequestMapping(value={"/","/index",},method=RequestMethod.GET)
    public String zadnjih5(Model model)
    {
        //model.addAttribute("dogodki",dogodki.zadnjihNeki());
        return "index";
    }

    public static ArrayList<Dogodek> seznamDogodkov = new ArrayList<>();
    @RequestMapping(value = {"/dodajDogodek" }, method = RequestMethod.POST)
    public String dodajDogodek(Model model, @RequestParam(value="naziv",required=false)String naziv,
                               @RequestParam(value="idDogodka",required = false)String idDogodka,
                               @RequestParam(value="kraj",required=false)String kraj,
                               @RequestParam(value="ura",required = false)String ura,
                               @RequestParam(value="izvajalec",required = false)String izvajalec,
                               @RequestParam(value="lokacija",required = false)String lokacija,
                               @RequestParam(value="cena",required = false)String cena,
                               @RequestParam(value="opis",required = false)String opis,
                               @RequestParam(value="slika",required = false)String slikaURL,
                               @RequestParam(value="idUporabnika",required = false)String idUporabnika,
                               @RequestParam(value="tipDogodka",required = false)String tip,
                               @RequestParam(value="datum",required = false)String datum,
                               @RequestParam(value="urlDogodka",required = false)String vir) {


            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session = request.getSession(true);

          //  if(Boolean.valueOf(String.valueOf(session.getAttribute("urejanjeDogodka"))) && (Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen"))))){
            if(idDogodka!=""){

                dogodki.updateDogodek(Integer.parseInt(idDogodka),naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,tip,datum,vir);
            }

            else {

                int id = Integer.parseInt(String.valueOf(session.getAttribute("idUporabnika")));

                dogodki.addDogodek(naziv, kraj, ura, izvajalec, lokacija, cena, opis, slikaURL, Integer.parseInt(idUporabnika), tip, datum, vir);

                boolean jeDodan = true;
                model.addAttribute("dodanDogodek", jeDodan);
            }

        return "add";
    }

    @RequestMapping(value={"/uredi"}, method=RequestMethod.GET)
    public String prikaziStran(Model model,
                               @RequestParam(value="ime",required = false)String ime){

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);

        boolean uporabnikPrijavljen =(Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen"))));
        if(ime.equals("dodajanje")){
            model.addAttribute("urejanjeDogodka",false);

            if(uporabnikPrijavljen)
            {

                return "add";
            }

            else
                return "vpis";

        }
        else {
            model.addAttribute("urejanjeDogodka",true);

            if(uporabnikPrijavljen)
            {
                Dogodek urejan = dogodki.getByID(Integer.parseInt(ime));
                int p=4;
                model.addAttribute("urejanDogodek",urejan);
                model.addAttribute("idD",ime);
                return "add";
            }

            else
                return "vpis";
        }

    }



    @RequestMapping(value={"/Konzola",}, method=RequestMethod.GET)
    public String konzola(Model model,@RequestParam(value="event", required=false)String tip)
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

//dodajala
    @RequestMapping(value={"/events",}, method=RequestMethod.GET)
    public String events(Model model,@RequestParam(value="event", required=false)String tip)

    {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);//true will create if necessary



        int idUporabnika;
        Oseba prijavljenUporabnik;
        List<Oseba> rez = new ArrayList<>();

       // model.addAttribute("Iskanje",false);

        if(tip.equals("Moji dogodki") && Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen"))))
        {
            idUporabnika=Integer.parseInt(String.valueOf(session.getAttribute("idUporabnika")) );
            prijavljenUporabnik = osebe.getByID(idUporabnika);
            rez.add(prijavljenUporabnik);
            List<Dogodek> temp =dogodki.getByIdUporabnika(idUporabnika);
            model.addAttribute("dogodki",temp);
            model.addAttribute("Kategorija", tip);
            model.addAttribute("uporabnik",rez);
            model.addAttribute("stDogodkovUporabnika",temp.size());

            return "uporabnik";

        }

        else {
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

    @RequestMapping(value={"/filter",}, method=RequestMethod.GET)
    public String eventsFilter(Model model,
                               @RequestParam(value="nazivDogodka", required=false)String naziv,
                               @RequestParam(value="krajDogodka", required=false)String kraj,
                               @RequestParam(value="datumDogodka", required=false)String datum,
                               @RequestParam(value="event", required=false)String kateg,
                               @RequestParam(value="cenaDogodka", required=false)String cena) {


        List<Dogodek> seznam = dogodki.getByTip(kateg);
        List<Dogodek> rez = new ArrayList<>();

      for(int i=0; i<seznam.size(); i++) { //tole je bolša rešitev, datum je še edino treba ugotovit
          if ((naziv.equals("") || seznam.get(i).getNaziv().equals(naziv))&&
                  (kraj.equals("") || seznam.get(i).getKraj().equals(kraj))&&
                  (cena==null || Double.parseDouble(seznam.get(i).getCena())<=Double.parseDouble(cena)))
          {
              rez.add(seznam.get(i));
          }


      }
      model.addAttribute("dogodki",rez);

      model.addAttribute("Kategorija",kateg);
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

        return "Konsola";
    }

    @RequestMapping(value={"/prijava"},method=RequestMethod.POST)
    public String prijava(Model model,
                          @RequestParam(value="username")String email,
                          @RequestParam(value="password")String geslo){

        List<Oseba> vseOsebe = osebe.getAllOsebe();

        boolean prijavaUspesna = false;

        for(int i=0; i<vseOsebe.size(); i++){

            if(vseOsebe.get(i).getEmail().equals(email) && vseOsebe.get(i).getGeslo().equals(geslo))
            {
                prijavaUspesna = true;

                model.addAttribute("uspesnost",prijavaUspesna);
                HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
                HttpSession session = request.getSession(true);

                Oseba uporabnik = osebe.getByEmail(email);
                session.setAttribute("idUporabnika",uporabnik.getId());
                session.setAttribute("uporabnikPrijavljen",prijavaUspesna);

                session.setAttribute("imeUporabnika",uporabnik.getIme());
                session.setAttribute("priimekUporabnika",uporabnik.getPriimek());


                return "index";

            }


        }
        if(prijavaUspesna==false)
        {
            model.addAttribute("uspesnost",prijavaUspesna);

        }


        return "vpis";


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
       // dogodki.addDogodek(naziv,url,slika,tipD,kraj,opis,naslov,datum,cena);
        return "/seznamDogodkov";
    }










}
