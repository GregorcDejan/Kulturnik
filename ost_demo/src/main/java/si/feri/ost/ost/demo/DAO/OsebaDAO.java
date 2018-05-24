package si.feri.ost.ost.demo.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import si.feri.ost.ost.demo.Razredi.Dogodek;

@Component
public class OsebaDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;


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

    public Dogodek getByEmail(String email)
    {
        String sql = "SELECT * FROM dogodek WHERE email=? ";

        Dogodek d= (Dogodek)jdbcTemplate.queryForObject(sql,
                new Object[] {email},
                new BeanPropertyRowMapper(Dogodek.class));


        return d;

    }

    public Dogodek getByGeslo(String geslo)
    {
        String sql = "SELECT * FROM dogodek WHERE geslo=? ";

        Dogodek d= (Dogodek)jdbcTemplate.queryForObject(sql,
                new Object[] {geslo},
                new BeanPropertyRowMapper(Dogodek.class));


        return d;

    }
}
