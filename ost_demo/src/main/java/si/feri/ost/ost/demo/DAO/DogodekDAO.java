package si.feri.ost.ost.demo.DAO;

import org.h2.store.fs.FilePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import si.feri.ost.ost.demo.Razredi.Dogodek;

import java.io.*;
import java.nio.file.Path;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Component
public class DogodekDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    /**
     * vračanje vseh dogodkov
     * @return
     */
    public List<Dogodek> getAllDogodki()
    {
        String sql = "SELECT * FROM DOGODEK";
        List<Dogodek>  seznam = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql);

        for(Map<String,Object> vrstica: vrstice){

            /*String naziv =
            String vir =
            String urlSlike
            String tipDogodka =
            String kraj =
            String opis =
            String naslov
            String datum
            String cena */

            String naziv = (String)vrstica.get("Naziv");
            String kraj = (String)vrstica.get("Kraj");
            Time cas = (Time) vrstica.get("Ura");
            String ura=null;
            if(cas!=null) {
                ura = cas.toString();//STRING?? ura minuta sekunda
            }
            String izvajalec = (String)vrstica.get("Izvajalec");
            String lokacija = (String)vrstica.get("Lokacija");
            String cena = (String)vrstica.get("Cena");
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");
            String tip =(String)vrstica.get("Tip");

            Date datumcek = (Date) vrstica.get("Datum");
            String datum=datumcek.toString();
            String vir = (String)vrstica.get("Vir");


            seznam.add(new Dogodek(naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,tip,datum,vir));


        }

        return seznam;

    }

    /**
     * vračanje zadnjih 5 dogodkov
     * @return
     */
    public List<Dogodek> zadnjihNeki()
    {
        List<Dogodek> vsi=getAllDogodki();
        Collections.reverse(vsi);
        ArrayList<Dogodek>five = new ArrayList<>();
        for(int i=0;i<5;i++)
        {
            five.add(vsi.get(i));
        }
        Collections.reverse(five);
        return five;

    }

    /**
     * dodajanje dogodka
     * @param naziv
     * @param kraj
     * @param ura
     * @param izvajalec
     * @param lokacija
     * @param cena
     * @param opis
     * @param slikaURL
     * @param idUporabnika
     * @param tip
     * @param datum
     * @param vir
     * @return
     * @throws ParseException
     */
    public int addDogodek(String naziv, String kraj, String ura, String izvajalec, String lokacija, String cena, String opis, String slikaURL, int idUporabnika, String tip, String datum, String vir) throws ParseException {
     String sql = "INSERT INTO DOGODEK(naziv,kraj,ura,izvajalec,lokacija,cena,opis,slika,uporabnik_id,tip,datum,vir) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

        DateFormat cas = new SimpleDateFormat("hh:mm");

        DateFormat dateFormat = new SimpleDateFormat("dd MMMM, yyyy");

        Time time = new Time(cas.parse(ura).getTime());

        Date date = dateFormat.parse(datum);


     return jdbcTemplate.update(sql,new Object[]{naziv,kraj,time,izvajalec,lokacija,cena,opis,slikaURL,idUporabnika,tip,date,vir});


    }


    /**
     * dodajanje dogodka z parametri iz XML datoteke Koloseja
     * @param naziv
     * @param kraj
     * @param ura
     * @param izvajalec
     * @param lokacija
     * @param cena
     * @param opis
     * @param slikaURL
     * @param idUporabnika
     * @param tip
     * @param datum
     * @param vir
     * @return
     * @throws ParseException
     */
    public int addXML(String naziv, String kraj, String ura, String izvajalec, String lokacija, String cena, String opis, String slikaURL, int idUporabnika, String tip, String datum, String vir) throws ParseException {
        String sql = "INSERT INTO DOGODEK(naziv,kraj,ura,izvajalec,lokacija,cena,opis,slika,uporabnik_id,tip,datum,vir) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

        DateFormat cas = new SimpleDateFormat("hh:mm");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Time time = new Time(cas.parse(ura).getTime());

        Date date = dateFormat.parse(datum);


        return jdbcTemplate.update(sql,new Object[]{naziv,kraj,time,izvajalec,lokacija,cena,opis,slikaURL,idUporabnika,tip,date,vir});


    }

    /**
     * dodajanje dogodka iz XML datoteke RSS
     * @param naziv
     * @param vir
     * @param tip
     * @param idUporabnika
     * @param datum
     * @return
     * @throws ParseException
     */

    public int addXML(String naziv,String vir,String tip,int idUporabnika,String datum) throws ParseException {
        String sql = "INSERT INTO DOGODEK(naziv,vir,tip,uporabnik_id,datum) VALUES(?,?,?,?,?)";
        datum = datum.replace(".","-");


        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");



        Date date = dateFormat.parse(datum);


        return jdbcTemplate.update(sql,new Object[]{naziv,vir,tip,idUporabnika,date});


    }

    /**
     * posodabljanje dogodka
     * @param id
     * @param naziv
     * @param kraj
     * @param ura
     * @param izvajalec
     * @param lokacija
     * @param cena
     * @param opis
     * @param slikaURL
     * @param tip
     * @param datum
     * @param vir
     * @return
     */
    public int updateDogodek(int id,String naziv, String kraj, String ura, String izvajalec, String lokacija, String cena, String opis, String slikaURL, String tip, String datum, String vir){
        String sql = "UPDATE DOGODEK SET naziv=?, kraj=?, ura=?,izvajalec=?,lokacija=?,cena=?,opis=?,slika=?, tip=?,datum=?,vir=? WHERE id=?";

        return jdbcTemplate.update(sql,new Object[]{naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,tip,datum,vir,id});


    }

    /**
     * iskanje najnižje cene
     * @return
     */
    public int vrniNajnizjoCeno(){

        String sql = "Select Min(cast(cena as double)) from dogodek";

        int cena = jdbcTemplate.queryForObject(sql,Integer.class);

        return cena;
    }

    /**
     * iskanje najvišje cene
     * @return
     */
    public int vrniNajvisjoCeno(){

        String sql = "Select Max(cast(cena as double)) from dogodek";

        int cena = jdbcTemplate.queryForObject(sql,Integer.class);

        return cena;
    }

    /**
     * brisanje dogodka
     * @param id
     * @return
     */
    public Object deleteDogodek(int id)
    {
        String sql = "DELETE FROM DOGODEK WHERE id=?";

        return jdbcTemplate.update(sql,new Object[]{id});
    }

    /**
     * filtriranje po nazivu
     * @param naziv
     * @return
     */
    public List<Dogodek> getByNaziv(String naziv)
    {
        String sql = "SELECT * FROM dogodek WHERE naziv=? ";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{naziv});

        for(Map<String,Object> vrstica: vrstice){

            int id=(Integer)(vrstica.get("ID"));

            String kraj = (String)vrstica.get("Kraj");
            String ura = (String)vrstica.get("Ura");//STRING?? ura minuta sekunda
            String izvajalec = (String)vrstica.get("Izvajalec");
            String lokacija = (String)vrstica.get("Lokacija");
            String cena = (String)vrstica.get("Cena");;
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");
            String tip =(String)vrstica.get("Tip");
            String datum = (String)vrstica.get("Datum");//leto mesec dan
            String vir = (String)vrstica.get("Vir");


            Dogodek d= new Dogodek(id,naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,tip,datum,vir);

            rez.add(d);

        }


        return rez;

    }

    /**
     * iskanje dogodka po ID-ju
     * @param id
     * @return
     */
    public Dogodek getByID(int id)
    {
        String sql = "SELECT * FROM dogodek WHERE id=? ";

        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql,new Object[]{id});

        List<Dogodek> rez = new ArrayList<>();

        Dogodek d = (Dogodek) jdbcTemplate.queryForObject(sql,
                    new Object[]{id},
                    new BeanPropertyRowMapper(Dogodek.class));


        return d;

    }

    /**
     * iskanje dogodkov po ID-ju uporabnika
     * @param idUporabnika
     * @return
     */
    public List<Dogodek> getByIdUporabnika(int idUporabnika){
        String sql = "SELECT * FROM dogodek WHERE UPORABNIK_ID=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{idUporabnika});

        for(Map vrstica: vrstice) {

            int ID = (Integer) (vrstica.get("ID"));
            String naziv = (String) vrstica.get("Naziv");
            String kraj = (String) vrstica.get("Kraj");
            Time cas = (Time) vrstica.get("Ura");
            String ura = null;
            if (ura != null) {
                ura = cas.toString();//STRING?? ura minuta sekunda
            }
            String izvajalec = (String)vrstica.get("Izvajalec");
            String lokacija = (String)vrstica.get("Lokacija");
            String cena = (String)vrstica.get("Cena");;
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");
            String tip =(String)vrstica.get("Tip");
            Date datumcek = (Date) vrstica.get("Datum");
            String datum=datumcek.toString();
            String vir = (String)vrstica.get("Vir");


            Dogodek d= new Dogodek(ID,naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,idUporabnika,tip,datum,vir);

            rez.add(d);

        }

        return rez;


    }

    /**
     * iskanje dogodka po datumu
     * @param datum
     * @return
     */
    public List<Dogodek> getByDatum(String datum)
    {
        String sql = "SELECT * FROM dogodek WHERE datum=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{datum});

        for(Map vrstica: vrstice){

            int ID=(Integer)(vrstica.get("ID"));
            String naziv = (String)vrstica.get("Naziv");
            String kraj = (String)vrstica.get("Kraj");
            String ura = (String)vrstica.get("Ura");//STRING?? ura minuta sekunda
            String izvajalec = (String)vrstica.get("Izvajalec");
            String lokacija = (String)vrstica.get("Lokacija");
            String cena = (String)vrstica.get("Cena");
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");
            String tip =(String)vrstica.get("Tip");
            String vir = (String)vrstica.get("Vir");


            Dogodek d= new Dogodek(ID,naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,tip,datum,vir);
            rez.add(d);

        }

        return rez;


    }

    /**
     * iskanje dogodka po tipu
     * @param tip
     * @return
     */
    public List<Dogodek> getByTip(String tip)
    {
        String sql = "SELECT * FROM dogodek WHERE tip=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{tip});

        for(Map vrstica: vrstice){


            int ID=(Integer)(vrstica.get("ID"));
            String naziv = (String)vrstica.get("Naziv");
            String kraj = (String)vrstica.get("Kraj");
            Time cas = (Time) vrstica.get("Ura");
            String ura=null;
            if(cas!=null) {
                 ura= cas.toString();//STRING?? ura minuta sekunda
            }

            String izvajalec = (String)vrstica.get("Izvajalec");
            String lokacija = (String)vrstica.get("Lokacija");
            String cena = (String)vrstica.get("Cena");
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");


            Date datumcek = (Date) vrstica.get("Datum");
            String datum=datumcek.toString();
            String vir = (String)vrstica.get("Vir");




            int idUporabnika=1;
            if((Integer)vrstica.get("Uporabnik_ID")!=null)
            {
                        idUporabnika= (Integer) vrstica.get("Uporabnik_ID");
            }

            Dogodek d= new Dogodek(ID,naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,idUporabnika,tip,datum,vir);

            rez.add(d);

        }

        return rez;


    }

    /**
     * iskanje dogodka po kraju
     * @param kraj
     * @return
     */
    public List<Dogodek> getByKraj(String kraj)
    {
        String sql = "SELECT * FROM dogodek WHERE kraj=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{kraj});

        for(Map vrstica: vrstice){

            int ID=(Integer)(vrstica.get("ID"));
            String naziv = (String)vrstica.get("Naziv");
            String ura = (String)vrstica.get("Ura");//STRING?? ura minuta sekunda
            String izvajalec = (String)vrstica.get("Izvajalec");
            String lokacija = (String)vrstica.get("Lokacija");
            String cena = (String)vrstica.get("Cena");
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");
            int idUporabnik= (Integer) vrstica.get("Uporabnik_ID");
            String tip =(String)vrstica.get("Tip");
            String datum = (String)vrstica.get("Datum");//leto mesec dan
            String vir = (String)vrstica.get("Vir");

            Dogodek d= new Dogodek(ID,naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,idUporabnik,tip,datum,vir);

            rez.add(d);

        }
        return rez;

    }

    /**
     * iskanje dogodka po lokaciji
     * @param lokacija
     * @return
     */
    public List<Dogodek> getByLokacija(String lokacija) {
        lokacija = lokacija.substring(1);
        String sql = "SELECT * FROM dogodek WHERE lokacija=?";

        List<Dogodek> rez = new ArrayList<>();

        List<Map<String,Object>> vrstice  = jdbcTemplate.queryForList(sql,new Object[]{lokacija});
        int p=4;
        for(Map vrstica: vrstice){


            int ID=(Integer)(vrstica.get("ID"));
            String naziv = (String)vrstica.get("Naziv");
            String kraj = (String)vrstica.get("Kraj");
            Time cas = (Time) vrstica.get("Ura");
            String ura=null;
            if(cas!=null) {
                ura= cas.toString();//STRING?? ura minuta sekunda
            }

            String izvajalec = (String)vrstica.get("Izvajalec");
            String tip = (String)vrstica.get("Tip");
            String cena = (String)vrstica.get("Cena");
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");

            int idUporabnik= (Integer) vrstica.get("Uporabnik_ID");


            Date datumcek = (Date) vrstica.get("Datum");
            String datum=datumcek.toString();
            String vir = (String)vrstica.get("Vir");




            Dogodek d= new Dogodek(ID,naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,idUporabnik,tip,datum,vir);

            rez.add(d);

        }
        return rez;

    }

    /**
     * Iskanje dogodka po ceni
     * @param cenaMax
     * @return
     */
    public List<Dogodek> getByCena(String cenaMax){

        String sql = "SELECT * FROM dogodek";

        List<Dogodek> seznamVsehDogodkov = new ArrayList<>();
        List<Dogodek> seznamUjemajocih = new ArrayList<>();


        List<Map<String,Object>> vrstice = jdbcTemplate.queryForList(sql);

        for(Map vrstica:vrstice){

            int ID=(Integer)(vrstica.get("ID"));
            String naziv = (String)vrstica.get("Naziv");
            String kraj = (String)vrstica.get("Kraj");
            String ura = (String)vrstica.get("Ura");//STRING?? ura minuta sekunda
            String izvajalec = (String)vrstica.get("Izvajalec");
            String lokacija = (String)vrstica.get("Lokacija");
            String cena = (String)vrstica.get("Cena");
            String opis = (String)vrstica.get("Opis");
            String slikaURL = (String)vrstica.get("Slika");
            int idUporabnik= (Integer) vrstica.get("Uporabnik_ID");
            String tip =(String)vrstica.get("Tip");
            String datum = (String)vrstica.get("Datum");//leto mesec dan
            String vir = (String)vrstica.get("Vir");

            Dogodek d= new Dogodek(ID,naziv,kraj,ura,izvajalec,lokacija,cena,opis,slikaURL,idUporabnik,tip,datum,vir);



            seznamVsehDogodkov.add(d);
        }

        for (int i=0; i<seznamVsehDogodkov.size(); i++)
        {
            if (Integer.parseInt(seznamVsehDogodkov.get(i).getCena())<=Integer.parseInt(cenaMax))
            {
                seznamUjemajocih.add(seznamVsehDogodkov.get(i));
            }
        }


        return seznamUjemajocih;

    }


}
