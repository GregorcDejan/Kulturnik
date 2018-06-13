package si.feri.ost.ost.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.ost.ost.demo.Razredi.Dogodek;

import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
@Controller
public class KontrolerDogodki {
    public static ArrayList<Dogodek> seznamDogodkov = new ArrayList<>();
    /*@RequestMapping(value = {"/dodajanjeDogodka" }, method = RequestMethod.POST)
    public String dodajDogodek(Model model, @RequestParam(value="naziv",required=true)String naziv,
                               @RequestParam(value="kraj",required=true)String kraj,
                               @RequestParam(value="naslov",required = true)String naslov,
                               @RequestParam(value="tipDogodka",required = true)String tipD,
                               @RequestParam(value="urlDogodka",required = true)String url,
                               @RequestParam(value="datum",required = true)String datum,
                               @RequestParam(value="slika",required = false)String slika,
                               @RequestParam(value="opis",required = false)String opis,
                               @RequestParam(value="cena",required = false)String cena)  {

        seznamDogodkov.add(new Dogodek(naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL, Integer.parseInt(idUporabnika),tip,datum,vir));

        boolean jeDodan = true;
        model.addAttribute("dodanDogodek",jeDodan);
        return "add";
    }*/

    /**
     * Brisanje dogodka
     * @param idBrisanja
     */
    @RequestMapping(value={"/brisanjeDogodka"},method=RequestMethod.POST)
    public void izbrisiDogodek(@RequestParam(value="idBrisanjaDogodka",required = true)String idBrisanja)
    {
       seznamDogodkov.remove(Integer.parseInt(idBrisanja));
    }






}
