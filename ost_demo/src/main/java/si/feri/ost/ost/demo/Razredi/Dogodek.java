package si.feri.ost.ost.demo.Razredi;

public class Dogodek
{
    private String naziv;
    private String vir;
    private String slikaURL;
    private String tip;
    private String opis;
    private String kraj;
    private String naslov;
    private String datum;

    public Dogodek() {}

    public Dogodek(String naziv, String vir, String slikaURL, String tip,String opis,String kraj,String naslov,String datum)
    {

        this.naziv=naziv;
        this.vir=vir;
        this.slikaURL=slikaURL;
        this.tip=tip;
        this.opis=opis;
        this.kraj=kraj;
        this.naslov=naslov;
        this.setDatum(datum);

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
}
