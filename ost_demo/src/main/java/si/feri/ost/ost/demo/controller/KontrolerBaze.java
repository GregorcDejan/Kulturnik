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
import si.feri.ost.ost.demo.DAO.DogodekDAO;
import si.feri.ost.ost.demo.DAO.OsebaDAO;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.Oseba;

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

    @RequestMapping(value={"/filter",}, method=RequestMethod.GET)
    public String eventsFilter(Model model,
                               @RequestParam(value="nazivDogodka", required=false)String naziv,
                               @RequestParam(value="krajDogodka", required=false)String kraj,
                               @RequestParam(value="datumDogodka", required=false)String datum,
                               @RequestParam(value="cenaDogodka", required=false)String cena)
    {
        List<Dogodek> vsiDogodki =  dogodki.getAllDogodki();

        for(int i=0; i<vsiDogodki.size(); i++)
        {
            if(vsiDogodki.get(i).getNaziv().equalsIgnoreCase(naziv))
                model.addAttribute("dogodki",dogodki.getByNaziv(naziv));

        }


        return "events";
    }

    @RequestMapping(value={"/prijava"},method=RequestMethod.POST)
    public String prijava(Model model,
                          @RequestParam(value="user")String email,
                          @RequestParam(value="password")String geslo){

        List<Oseba> vseOsebe = oseba.getAllOsebe();

        for(int i=0; i<vseOsebe.size(); i++){

            if(vseOsebe.get(i).getEmail().equals(email) && vseOsebe.get(i).getGeslo().equals(geslo))
                return "profilUporabnika";


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
        dogodki.addDogodek(naziv,url,slika,tipD,kraj,opis,naslov,datum,cena);
        return "/seznamDogodkov";
    }










}
