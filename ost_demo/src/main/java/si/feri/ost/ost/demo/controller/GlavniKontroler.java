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




  @Autowired
    DogodekDAO dogodki ;
    //testni jsp za izpise ipd.

    /*@RequestMapping(value = { "/Test" }, method = RequestMethod.GET)
    public String test(Model model) {

        return "Konsola";


    }*/

    /**
     * Profil uporabnika
     * @param model
     * @return
     */
    @RequestMapping(value = { "/uporabnik" }, method = RequestMethod.GET)
    public String profil(Model model) {

        return "uporabnik";
    }


    /**
     * Zemljevid
     * @param model
     * @return
     */

    @RequestMapping(value = { "/karta" }, method = RequestMethod.GET)
    public String karta(Model model) {

        return "karta";
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

    /**
     * Registracija
     * @param model
     * @return
     */
    @RequestMapping(value = { "/registracija" }, method = RequestMethod.GET)
    public String registracija(Model model) {

        model.addAttribute("urejanjeUporabnika",false);
        return "registracija";
    }

    /**
     * Filtriranje po lokaciji
     * @param model
     * @param lokacija
     * @return
     */
    @RequestMapping(value = { "/dogodkiPoLokaciji" }, method = RequestMethod.GET)
    public String vrniEventePoLokaciji(Model model,
                                       @RequestParam(value="lokacija")String lokacija) {
        lokacija = lokacija.substring(1);
       List<Dogodek> dogodkiPoLokaciji = dogodki.getByLokacija(lokacija);

       model.addAttribute("dogodki",dogodkiPoLokaciji);



       model.addAttribute("lokacijaDogodka",lokacija);


       int p=4;
        return "events";
    }

    /**
     * Vpis v aplikacijo
     * @param model
     * @return
     */
    @RequestMapping(value = { "/vpis" }, method = RequestMethod.GET)
    public String vpis(Model model) {

        return "vpis";
    }

    /**
     * Izpis iz aplikacije
     * @param model
     * @return
     */
    @RequestMapping(value = {"/izpis"}, method=RequestMethod.GET)
    public String izpis(Model model){

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);
        model.addAttribute("dogodki",dogodki.zadnjihNeki());
        session.invalidate();

        return "index";
    }

    /**
     * Dodajanje dogodka
     * @param model
     * @return
     */
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
