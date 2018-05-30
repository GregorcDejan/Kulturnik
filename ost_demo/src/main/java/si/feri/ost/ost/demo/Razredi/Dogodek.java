package si.feri.ost.ost.demo.Razredi;

public class Dogodek
{
    private int id;
    private String naziv;
    private String vir;
    private String slikaURL;
    private String tip;
    private String opis;
    private String kraj;
    private String naslov;
    private String datum;
    private int idUporabnika;
    private String cena;

    public Dogodek() {}

    public Dogodek(String naziv)
    {
        this.naziv=naziv;
    }
    public Dogodek(String naziv, String vir, String slikaURL, String tip, String kraj, String opis,  String naslov, String datum,String cena)
    {

        this.naziv=naziv;
        this.vir=vir;
        this.slikaURL=slikaURL;
        this.tip=tip;
        this.opis=opis;
        this.kraj=kraj;
        this.naslov=naslov;
        this.setDatum(datum);
        this.cena=cena;

    }
    public Dogodek(int id,String naziv, String vir, String slikaURL, String tip, String opis, String kraj, String naslov, String datum,String cena)
    {
        this.id=id;
        this.naziv=naziv;
        this.vir=vir;
        this.slikaURL=slikaURL;
        this.tip=tip;
        this.opis=opis;
        this.kraj=kraj;
        this.naslov=naslov;
        this.setDatum(datum);
        this.cena=cena;

    }

    public Dogodek(int id,String naziv, String vir, String slikaURL, String tip, String opis, String kraj, String naslov, String datum,int idUporabnika,String cena)
    {
        this.id=id;
        this.naziv=naziv;
        this.vir=vir;
        this.slikaURL=slikaURL;
        this.tip=tip;
        this.opis=opis;
        this.kraj=kraj;
        this.naslov=naslov;
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
    public String getNaslov() {
        return naslov;
    }
    public void setNaslov(String naslov) {
        this.naslov = naslov;
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
}
