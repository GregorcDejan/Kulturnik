package si.feri.ost.ost.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.ost.ost.demo.DAO.OsebaDAO;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.Oseba;
import java.util.ArrayList;
@Controller
public class KontrolerOsebe {

    OsebaDAO osebe;
    public static ArrayList<Oseba> seznamOseb = new ArrayList<>();
    public class KontrolerDogodki {


        /**
         * Brisanje osebe
         * @param idBrisanja
         */
        @RequestMapping(value={"/brisanjeOsebe"},method=RequestMethod.POST)
        public void izbrisiDogodek(@RequestParam(value="idBrisanjaOsebe",required = true)String idBrisanja)
        {
            seznamOseb.remove(Integer.parseInt(idBrisanja));
        }
    }
}
