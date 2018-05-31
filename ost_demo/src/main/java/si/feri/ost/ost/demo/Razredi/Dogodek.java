package si.feri.ost.ost.demo.Razredi;

public class Dogodek
{
    private int id;
    private String naziv;
    private String kraj;
    private String ura;//STRING?? ura minuta sekunda
    private String izvajalec;
    private String lokacija;
    private String cena;
    private String opis;
    private String slikaURL;
    private int idUporabnika;
    private String tip;
    private String datum;//leto mesec dan
    private String vir;


    public Dogodek() {}

    public Dogodek(int id, String naziv, String kraj, String ura, String izvajalec, String lokacija, String cena, String opis, String slikaURL, int idUporabnika, String tip, String datum, String vir) {
        this.id = id;
        this.naziv = naziv;
        this.kraj = kraj;
        this.ura = ura;
        this.izvajalec = izvajalec;
        this.lokacija = lokacija;
        this.cena = cena;
        this.opis = opis;
        this.slikaURL = slikaURL;
        this.idUporabnika = idUporabnika;
        this.tip = tip;
        this.datum = datum;
        this.vir = vir;
    }

    public Dogodek(int id, String naziv, String kraj, String ura, String izvajalec, String lokacija, String cena, String opis, String slikaURL, String tip, String datum, String vir) {
        this.id = id;
        this.naziv = naziv;
        this.kraj = kraj;
        this.ura = ura;
        this.izvajalec = izvajalec;
        this.lokacija = lokacija;
        this.cena = cena;
        this.opis = opis;
        this.slikaURL = slikaURL;
        this.tip = tip;
        this.datum = datum;
        this.vir = vir;
    }

    public Dogodek(String naziv, String kraj, String ura, String izvajalec, String lokacija, String cena, String opis, String slikaURL, int idUporabnika, String tip, String datum, String vir) {
        this.naziv = naziv;
        this.kraj = kraj;
        this.ura = ura;
        this.izvajalec = izvajalec;
        this.lokacija = lokacija;
        this.cena = cena;
        this.opis = opis;
        this.slikaURL = slikaURL;
        this.idUporabnika = idUporabnika;
        this.tip = tip;
        this.datum = datum;
        this.vir = vir;
    }

    public Dogodek(String naziv)
    {
        this.naziv=naziv;
    }

    public Dogodek(String naziv, String kraj, String ura, String izvajalec, String lokacija, String cena, String opis, String slikaURL, String tip, String datum, String vir) {
        this.naziv = naziv;
        this.kraj = kraj;
        this.ura = ura;
        this.izvajalec = izvajalec;
        this.lokacija = lokacija;
        this.cena = cena;
        this.opis = opis;
        this.slikaURL = slikaURL;
        this.tip = tip;
        this.datum = datum;
        this.vir = vir;
    }

    public Dogodek(int id, String naziv, String vir, String slikaURL, String tip, String opis, String kraj, String lokacija, String datum, String cena)
    {
        this.id=id;
        this.naziv=naziv;
        this.vir=vir;
        this.slikaURL=slikaURL;
        this.tip=tip;
        this.opis=opis;
        this.kraj=kraj;
        this.lokacija = lokacija;
        this.setDatum(datum);
        this.cena=cena;

    }

    public Dogodek(int id, String naziv, String vir, String slikaURL, String tip, String opis, String kraj, String lokacija, String datum, int idUporabnika, String cena)
    {
        this.id=id;
        this.naziv=naziv;
        this.vir=vir;
        this.slikaURL=slikaURL;
        this.tip=tip;
        this.opis=opis;
        this.kraj=kraj;
        this.lokacija = lokacija;
        this.setDatum(datum);
        this.cena=cena;
        this.idUporabnika=idUporabnika;
    }

    public Dogodek(String naziv, String vir, String slikaURL, String tip, String opis, String kraj, String lokacija, String datum, int idUporabnika, String cena)
    {
        this.naziv=naziv;
        this.vir=vir;
        this.slikaURL=slikaURL;
        this.tip=tip;
        this.opis=opis;
        this.kraj=kraj;
        this.lokacija = lokacija;
        this.setDatum(datum);
        this.cena=cena;
        this.idUporabnika=idUporabnika;
    }



    public String getNaziv() {
        return naziv;
    }
    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
    public String getVir() {
        return vir;
    }
    public void setVir(String vir) {
        this.vir = vir;
    }
    public String getSlikaURL() {
        return slikaURL;
    }
    public void setSlikaURL(String slikaURL) {
        this.slikaURL = slikaURL;
    }
    public String getTip() {
        return tip;
    }
    public void setTip(String tip) {
        this.tip = tip;
    }
    public String getKraj() {
        return kraj;
    }
    public void setKraj(String kraj) {
        this.kraj = kraj;
    }
    public String getLokacija() {
        return lokacija;
    }
    public void setLokacija(String lokacija) {
        this.lokacija = lokacija;
    }
    public String getOpis() {
        return opis;
    }
    public void setOpis(String opis) {
        this.opis = opis;
    }
    public int getId() {
        return id;
    }

    @Override
    public String toString() {

        return "Naziv: "+naziv;
    }

    public String getDatum() {
        return datum;
    }

    public void setDatum(String datum) {
        this.datum = datum;
    }

    public String getCena() {
        return cena;
    }

    public void setCena(String cena) {
        this.cena = cena;
    }

    public int getIdUporabnika() {
        return idUporabnika;
    }

    public void setIdUporabnika(int idUporabnika) {
        this.idUporabnika = idUporabnika;
    }

    public String getUra() {
        return ura;
    }

    public void setUra(String ura) {
        this.ura = ura;
    }

    public String getIzvajalec() {
        return izvajalec;
    }

    public void setIzvajalec(String izvajalec) {
        this.izvajalec = izvajalec;
    }
}



