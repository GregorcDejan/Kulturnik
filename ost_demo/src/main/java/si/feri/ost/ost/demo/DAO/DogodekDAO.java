package si.feri.ost.ost.demo.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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

    public int addDogodek(String naziv, String vir, String SlikaURL, String Tip_Dogodka, String kraj,String opis, String naslov, String datum,int idUporabnika,String cena)
    {
     String sql = "INSERT INTO DOGODEK(naziv,vir,SlikaURL,Tip_Dogodka,kraj,opis,naslov,datum,cena,id_uporabnika) VALUES(?,?,?,?,?,?,?,?,?,?)";

     return jdbcTemplate.update(sql,new Object[]{naziv,vir,SlikaURL,Tip_Dogodka,kraj,opis,naslov,datum,cena,idUporabnika});


    }

    public int updateDogodek(int id,String naziv, String vir, String SlikaURL, String Tip_Dogodka, String kraj, String opis, String naslov, String datum,String cena){
        String sql = "UPDATE DOGODEK SET naziv=?,vir=?,SlikaURL=?,Tip_Dogodka=?,Kraj=?,Opis=?,Naslov=?,Datum=?,Cena=? WHERE id=?";

        return jdbcTemplate.update(sql,new Object[]{naziv,vir,SlikaURL,Tip_Dogodka,kraj,opis,naslov,datum,cena,id});


    }

    public Object deleteDogodek(int id)
    {
        String sql = "DELETE FROM DOGODEK WHERE id=?";

        return jdbcTemplate.update(sql,new Object[]{id});
    }

    public List<Dogodek> getByNaziv(String naziv)
    {
        String sql = "SELECT * FROM dogodek WHERE naziv=? ";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql);

        for(Map<String,Object> vrstica: vrstice){

            int id=(Integer)(vrstica.get("ID"));
            String datum=(String)vrstica.get("datum");
            String vir=(String)vrstica.get("Vir");
            String slikaURL=(String)vrstica.get("slikaURL");

            String opis=(String)vrstica.get("opis");
            String kraj=(String)vrstica.get("kraj");
            String naslov=(String)vrstica.get("naslov");
            String tip=(String)vrstica.get("tip");
            int idUporabnik=(Integer)vrstica.get("id_Uporabnika");
            String cena=(String)vrstica.get("cena");

            Dogodek d= new Dogodek(id,naziv,vir,slikaURL,tip,opis,kraj,naslov,datum,idUporabnik,cena);

            rez.add(d);

        }


        return rez;

    }
    public Dogodek getByID(String id)
    {
        String sql = "SELECT * FROM dogodek WHERE id=? ";

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql);

        List<Dogodek> rez = new ArrayList<>();

            Dogodek d = (Dogodek) jdbcTemplate.queryForObject(sql,
                    new Object[]{id},
                    new BeanPropertyRowMapper(Dogodek.class));


        return d;

    }

    public List<Dogodek> getByIdUporabnika(int id){
        String sql = "SELECT * FROM dogodek WHERE ID_UPORABNIKA=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{id});

        for(Map vrstica: vrstice){

            int ID=(Integer)(vrstica.get("ID"));
            String naziv=(String)vrstica.get("Naziv");
            String vir=(String)vrstica.get("Vir");
            String slikaURL=(String)vrstica.get("slikaURL");

            String opis=(String)vrstica.get("opis");
            String kraj=(String)vrstica.get("kraj");
            String naslov=(String)vrstica.get("naslov");
            String tip=(String)vrstica.get("tip");
            String datum=(String)vrstica.get("datum");
            String cena=(String)vrstica.get("cena");

            Dogodek d= new Dogodek(ID,naziv,vir,slikaURL,tip,opis,kraj,naslov,datum,id,cena);
            rez.add(d);

        }

        return rez;




    }

    public List<Dogodek> getByDatum(String datum)
    {
        String sql = "SELECT * FROM dogodek WHERE datum=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{datum});

        for(Map vrstica: vrstice){

            int id=(Integer)(vrstica.get("ID"));
            String naziv=(String)vrstica.get("Naziv");
            String vir=(String)vrstica.get("Vir");
            String slikaURL=(String)vrstica.get("slikaURL");

            String opis=(String)vrstica.get("opis");
            String kraj=(String)vrstica.get("kraj");
            String naslov=(String)vrstica.get("naslov");
            String tip=(String)vrstica.get("tip");
            int idUporabnik=(Integer)vrstica.get("id_Uporabnika");
            String cena=(String)vrstica.get("cena");

            Dogodek d= new Dogodek(id,naziv,vir,slikaURL,tip,opis,kraj,naslov,datum,idUporabnik,cena);
            rez.add(d);

        }

        return rez;


    }

    public List<Dogodek> getByTip(String tip)
    {
        String sql = "SELECT * FROM dogodek WHERE tip_dogodka=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{tip});

        for(Map vrstica: vrstice){


                    int id=(Integer)(vrstica.get("ID"));
                    String naziv=(String)vrstica.get("Naziv");
                    String vir=(String)vrstica.get("Vir");
                    String slikaURL=(String)vrstica.get("slikaURL");

                    String opis=(String)vrstica.get("opis");
                    String kraj=(String)vrstica.get("kraj");
                    String naslov=(String)vrstica.get("naslov");
                    String datum=(String)vrstica.get("datum");
            int idUporabnik=0;
            if((Integer)vrstica.get("id_Uporabnika")!=null) {
                        idUporabnik= (Integer) vrstica.get("id_Uporabnika");
                    }
                    String cena=(String)vrstica.get("cena");
            Dogodek d= new Dogodek(id,naziv,vir,slikaURL,tip,opis,kraj,naslov,datum,idUporabnik,cena);

            rez.add(d);

        }

        return rez;


    }

    public List<Dogodek> getByKraj(String kraj)
    {
        String sql = "SELECT * FROM dogodek WHERE kraj=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{kraj});

        for(Map vrstica: vrstice){


            int id=(Integer)(vrstica.get("ID"));
            String naziv=(String)vrstica.get("Naziv");
            String vir=(String)vrstica.get("Vir");
            String slikaURL=(String)vrstica.get("slikaURL");

            String opis=(String)vrstica.get("opis");
            String tip=(String)vrstica.get("tip");
            String naslov=(String)vrstica.get("naslov");
            String datum=(String)vrstica.get("datum");
            int idUporabnik=(Integer)vrstica.get("id_Uporabnika");
            String cena=(String)vrstica.get("cena");

            Dogodek d= new Dogodek(id,naziv,vir,slikaURL,tip,opis,kraj,naslov,datum,idUporabnik,cena);

            rez.add(d);

        }
        return rez;

    }

    public List<Dogodek> getByCena(String cenaMax){

        String sql = "SELECT * FROM dogodek WHERE cena BETWEEN ? AND ?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql,new Object[]{cenaMax});

        for(Map vrstica:vrstice){

            int id=(Integer)(vrstica.get("ID"));
            String naziv=(String)vrstica.get("Naziv");
            String vir=(String)vrstica.get("Vir");
            String slikaURL=(String)vrstica.get("slikaURL");

            String opis=(String)vrstica.get("opis");
            String tip=(String)vrstica.get("tip");
            String naslov=(String)vrstica.get("naslov");
            String datum=(String)vrstica.get("datum");
            int idUporabnik=(Integer)vrstica.get("id_Uporabnika");
            String kraj=(String)vrstica.get("kraj");

            Dogodek d= new Dogodek(id,naziv,vir,slikaURL,tip,opis,kraj,naslov,datum,idUporabnik,cenaMax);
            rez.add(d);

        }

        return rez;

    }


}
