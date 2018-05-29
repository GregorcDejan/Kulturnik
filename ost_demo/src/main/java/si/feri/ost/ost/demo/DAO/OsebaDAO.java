package si.feri.ost.ost.demo.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.ost.ost.demo.Razredi.Dogodek;
import si.feri.ost.ost.demo.Razredi.Oseba;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class OsebaDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Oseba> getAllOsebe(){
        String sql = "SELECT * FROM UPORABNIK";

        List<Oseba> seznam = new ArrayList<Oseba>();

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql);

        for (Map<String,Object> vrstica : vrstice) {

            int id = (Integer)vrstica.get("ID");
            String ime = (String)vrstica.get("Ime");
            String priimek = (String)vrstica.get("Priimek");
            String email = (String)vrstica.get("Email");
            String geslo = (String)vrstica.get("Geslo");
            String datumRojstva = (String)vrstica.get("Datum_rojstva");
            String telefonska = (String)vrstica.get("Telefon");


            seznam.add(new Oseba(id,ime,priimek,email, geslo, datumRojstva, telefonska));
        }
        return seznam;
    }



    public int addOseba(String ime,String priimek,String geslo, String email, String telefonska,String datum_rojstva)
    {
        String sql = "INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva) VALUES(?,?,?,?,?,?)";

        return jdbcTemplate.update(sql,new Object[]{ime,priimek,email,telefonska,geslo,datum_rojstva});


    }

    public Object deleteOseba(int id)
    {
        String sql = "DELETE FROM DOGODEK WHERE id=?";

        return jdbcTemplate.update(sql,new Object[]{id});
    }

    public Oseba getByEmail(String email)
    {
        String sql = "SELECT * FROM uporabnik WHERE email=? ";

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql, new Object[]{email});


        Oseba os = new Oseba();
        for(Map vrstica: vrstice){
            int id = (Integer)vrstica.get("ID");
            String ime = (String)vrstica.get("Ime");
            String priimek = (String)vrstica.get("Priimek");
            String geslo = (String)vrstica.get("Geslo");
            String datumRojstva = (String)vrstica.get("Datum_rojstva");
            String telefonska = (String)vrstica.get("Telefon");


            Oseba o =new Oseba(id,ime,priimek,email, geslo, datumRojstva, telefonska);

            os = o;
        }

      /*  Oseba d= (Oseba) jdbcTemplate.queryForObject(sql,
                new Object[] {email},
                new BeanPropertyRowMapper(Oseba.class)); */


        return os;

    }

    public List<Oseba> getByGeslo(String geslo)
    {
        String sql = "SELECT * FROM uporabnik WHERE geslo=? ";

        List<Oseba> seznam = new ArrayList<>();

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql);

        for(Map vrstica:vrstice) {

            Oseba d = (Oseba) jdbcTemplate.queryForObject(sql,
                    new Object[]{geslo},
                    new BeanPropertyRowMapper(Oseba.class));

            seznam.add(d);

        }
        return seznam;

    }

    public Oseba getByID(int id)
    {
        String sql = "SELECT * FROM dogodek WHERE id=? ";

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql);


        Oseba o = (Oseba) jdbcTemplate.queryForObject(sql,
                new Object[]{id},
                new BeanPropertyRowMapper(Oseba.class));


        return o;
    }
}
