package si.feri.ost.ost.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import si.feri.ost.ost.demo.DAO.DogodekDAO;
import si.feri.ost.ost.demo.DAO.OsebaDAO;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.Oseba;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

@Controller
public class GlavniKontroler {



    /*@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model) {

        return "index";
    }*/

  /*  @RequestMapping(value = {"/dodajanjeDogodkov" }, method = RequestMethod.GET)
    public String doddog(Model model) {

        return "dodajanjeDogodkov";
    }*/
  @Autowired
    DogodekDAO dogodki ;
    //testni jsp za izpise ipd.
    @RequestMapping(value = { "/Test" }, method = RequestMethod.GET)
    public String test(Model model) {

        return "Konsola";


    }

    @RequestMapping(value = { "/uporabnik" }, method = RequestMethod.GET)
    public String profil(Model model) {

        return "uporabnik";
    }

    @RequestMapping(value = { "/map" }, method = RequestMethod.GET)
    public String map(Model model) {

        List<Dogodek> vsiDogodki = dogodki.getAllDogodki();

        HashSet<String> naslovi = new HashSet<>();

        for(int i=0; i<vsiDogodki.size();i++){
            naslovi.add(vsiDogodki.get(i).getLokacija());
        }

        String[] poljeNaslovov =naslovi.toArray(new String[naslovi.size()]);
        int p=4;
        model.addAttribute("lokacijeDogodkov",naslovi);

        model.addAttribute("celZemljevid",true);





        return "map";
    }

    @RequestMapping(value = { "/registracija" }, method = RequestMethod.GET)
    public String registracija(Model model) {

        model.addAttribute("urejanjeUporabnika",false);
        return "registracija";
    }

    @RequestMapping(value = { "/dogodkiPoLokaciji" }, method = RequestMethod.GET)
    public String vrniEventePoLokaciji(Model model,
                                       @RequestParam(value="lokacija")String lokacija) {

       List<Dogodek> dogodkiPoLokaciji = dogodki.getByLokacija(lokacija);

       model.addAttribute("dogodki",dogodkiPoLokaciji);

       lokacija = lokacija.substring(1);

       model.addAttribute("lokacijaDogodka",lokacija);


       int p=4;
        return "events";
    }

    @RequestMapping(value = { "/vpis" }, method = RequestMethod.GET)
    public String vpis(Model model) {

        return "vpis";
    }

    @RequestMapping(value = {"/izpis"}, method=RequestMethod.GET)
    public String izpis(Model model){

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);
        model.addAttribute("dogodki",dogodki.zadnjihNeki());
        session.invalidate();

        return "index";
    }

    @RequestMapping(value = { "/add" }, method = RequestMethod.GET)
    public String dodajanjeDogodka(Model model) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);

        int idUporabnika;
        boolean prijavljen=false;


        if(session.getAttribute("idUporabnika")!=null)
        {
            idUporabnika=Integer.parseInt(String.valueOf(session.getAttribute("idUporabnika")) );
            prijavljen =Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen")));
        }


        if(prijavljen)
            return "add";

        else
            return "vpis";
    }




}
