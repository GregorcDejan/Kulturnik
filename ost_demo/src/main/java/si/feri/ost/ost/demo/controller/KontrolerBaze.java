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

import java.util.ArrayList;

@Controller
public class KontrolerBaze {
    @Autowired
    DogodekDAO dogodki;
    @Autowired

    OsebaDAO osebe;

    OsebaDAO oseba;

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

    @RequestMapping(value={"/glasba"},method=RequestMethod.GET)
    public String vrniGlasbo()
    {
        DogodekDAO glasba=new DogodekDAO();
        return glasba.getAllDogodki().toString();
    }








}
