package si.feri.ost.ost.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import si.feri.ost.ost.demo.DAO.OsebaDAO;
import si.feri.ost.ost.demo.Razredi.Oseba;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class GlavniKontroler {



    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model) {

        return "index";
    }

    @RequestMapping(value = {"/dodajanjeDogodkov" }, method = RequestMethod.GET)
    public String doddog(Model model) {

        return "dodajanjeDogodkov";
    }

    //testni jsp za izpise ipd.
    @RequestMapping(value = { "/Test" }, method = RequestMethod.GET)
    public String test(Model model) {

        return "Konsola";
    }

    @RequestMapping(value = { "/vpis" }, method = RequestMethod.GET)
    public String vpis(Model model) {

        return "vpis";
    }

    @RequestMapping(value = {"/izpis"}, method=RequestMethod.GET)
    public String izpis(){

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);

        session.invalidate();

        return "index";
    }

    @RequestMapping(value = { "/add" }, method = RequestMethod.GET)
    public String dodajanjeDogodka(Model model) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(true);

        int idUporabnika= Integer.parseInt(String.valueOf(session.getAttribute("idUporabnika")));
        boolean prijavljen =Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen")));

        if(prijavljen)
            return "add";

        else
            return "vpis";
    }





    @RequestMapping(value = { "/registracija" }, method = RequestMethod.GET)
    public String registracija(Model model) {

        return "registracija";
    }
}
