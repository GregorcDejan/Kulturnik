package si.feri.ost.ost.demo.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.ost.ost.demo.Razredi.Dogodek;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class DogodekDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Dogodek> getAllDogodki()
    {
        String sql = "SELECT * FROM DOGODEK";
        List<Dogodek>  seznam = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql);

        for(Map<String,Object> vrstica: vrstice){

            String naziv = (String)vrstica.get("Naziv");
            String vir = (String)vrstica.get("Vir");
            String urlSlike = (String)vrstica.get("SlikaURL");
            String tipDogodka = (String)vrstica.get("Tip_Dogodka");
            String kraj = (String)vrstica.get("Kraj");
            String opis = (String)vrstica.get("Opis");
            String naslov= (String)vrstica.get("Naslov");
            String datum = (String)vrstica.get("Datum");
            String cena = (String)vrstica.get("Cena");


            seznam.add(new Dogodek(naziv,vir,urlSlike,tipDogodka,opis,kraj,naslov,datum));




        }

        return seznam;


    }



}
