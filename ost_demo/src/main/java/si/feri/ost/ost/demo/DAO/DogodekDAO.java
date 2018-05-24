package si.feri.ost.ost.demo.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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


            seznam.add(new Dogodek(naziv,vir,urlSlike,tipDogodka,opis,kraj,naslov,datum,cena));


        }

        return seznam;

    }

    public int addDogodek(String naziv, String vir, String SlikaURL, String Tip_Dogodka, String kraj,String opis, String naslov, String datum,String cena)
    {
     String sql = "INSERT INTO DOGODEK(naziv,vir,SlikaURL,Tip_Dogodka,kraj,opis,naslov,datum,cena) VALUES(?,?,?,?,?,?,?,?)";

     return jdbcTemplate.update(sql,new Object[]{naziv,vir,SlikaURL,Tip_Dogodka,kraj,opis,naslov,datum,cena});


    }

    public int updateDogodek(int id,String naziv, String vir, String SlikaURL, String Tip_Dogodka, String kraj,String opis, String naslov, String datum,String cena){
        String sql = "UPDATE DOGODEK SET naziv=?,vir=?,SlikaURL=?,Tip_Dogodka=?,Kraj=?,Opis=?,Naslov=?,Datum=?,Cena=? WHERE id=?";

        return jdbcTemplate.update(sql,new Object[]{naziv,vir,SlikaURL,Tip_Dogodka,kraj,opis,naslov,datum,cena,id});


    }

    public Object deleteDogodek(int id)
    {
        String sql = "DELETE FROM DOGODEK WHERE id=?";

        return jdbcTemplate.update(sql,new Object[]{id});
    }

    public Dogodek getByNaziv(String naziv)
    {
        String sql = "SELECT * FROM dogodek WHERE naziv=? ";

        Dogodek d= (Dogodek)jdbcTemplate.queryForObject(sql,
                new Object[] {naziv},
                new BeanPropertyRowMapper(Dogodek.class));


        return d;

    }

    public List<Dogodek> getByDatum(String datum)
    {
        String sql = "SELECT * FROM dogodek WHERE datum=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql);

        for(Map vrstica: vrstice){
            String naziv = (String)vrstica.get("Naziv");
            String vir = (String)vrstica.get("Vir");
            String urlSlike = (String)vrstica.get("SlikaURL");
            String tipDogodka = (String)vrstica.get("Tip_Dogodka");
            String kraj = (String)vrstica.get("Kraj");
            String opis = (String)vrstica.get("Opis");
            String naslov= (String)vrstica.get("Naslov");
            String cena = (String)vrstica.get("Cena");

            Dogodek d= (Dogodek)jdbcTemplate.queryForObject(sql,
                    new Object[] {datum},
                    new BeanPropertyRowMapper(Dogodek.class));
            rez.add(d);

        }

        return rez;


    }

    public List<Dogodek> getByKraj(String kraj)
    {
        String sql = "SELECT * FROM dogodek WHERE kraj=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql);

        for(Map vrstica: vrstice){
            String naziv = (String)vrstica.get("Naziv");
            String vir = (String)vrstica.get("Vir");
            String urlSlike = (String)vrstica.get("SlikaURL");
            String tipDogodka = (String)vrstica.get("Tip_Dogodka");
            String datum = (String)vrstica.get("Datum");
            String opis = (String)vrstica.get("Opis");
            String naslov= (String)vrstica.get("Naslov");
            String cena = (String)vrstica.get("Cena");

            Dogodek d= (Dogodek)jdbcTemplate.queryForObject(sql,
                    new Object[] {kraj},
                    new BeanPropertyRowMapper(Dogodek.class));

            rez.add(d);

        }
        return rez;

    }

    public List<Dogodek> getByCena(String cenaMin, String cenaMax){

        String sql = "SELECT * FROM dogodek WHERE cena BETWEEN ? AND ?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql);

        for(Map vrstica:vrstice){

            String naziv = (String)vrstica.get("Naziv");
            String vir = (String)vrstica.get("Vir");
            String urlSlike = (String)vrstica.get("SlikaURL");
            String tipDogodka = (String)vrstica.get("Tip_Dogodka");
            String kraj = (String)vrstica.get("Kraj");
            String opis = (String)vrstica.get("Opis");
            String naslov= (String)vrstica.get("Naslov");
            String datum = (String)vrstica.get("Datum");

            Dogodek d= (Dogodek)jdbcTemplate.queryForObject(sql,
                    new Object[] {cenaMin,cenaMax},
                    new BeanPropertyRowMapper(Dogodek.class));

            rez.add(d);

        }

        return rez;

    }




}
