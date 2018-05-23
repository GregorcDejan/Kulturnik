package si.feri.ost.ost.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.Oseba;

import java.util.ArrayList;
@Controller
public class KontrolerOsebe {

    public static ArrayList<Oseba> seznamOseb = new ArrayList<>();
    public class KontrolerDogodki {

        @RequestMapping(value = {"/dodajanjeOseb"}, method = RequestMethod.POST)
        public String dodajOsebo(Model model, @RequestParam(value = "ime", required = true) String ime,
                                 @RequestParam(value = "priimek", required = true) String priimek,
                                 @RequestParam(value = "email", required = true) String email,
                                 @RequestParam(value = "geslo", required = true) String geslo,
                                 @RequestParam(value = "datumRojstva", required = true) String datumRojstva,
                                 @RequestParam(value = "telefonska", required = true) String telefonska) {

            seznamOseb.add(new Oseba(ime, priimek, email, geslo, datumRojstva, telefonska));

            boolean jeDodan = true;
            model.addAttribute("dodanaOseba", jeDodan);
            return "dodajanjeOseb";
        }


        @RequestMapping(value={"/brisanjeOsebe"},method=RequestMethod.POST)
        public void izbrisiDogodek(@RequestParam(value="idBrisanjaOsebe",required = true)String idBrisanja)
        {
            seznamOseb.remove(Integer.parseInt(idBrisanja));
        }
    }
}
