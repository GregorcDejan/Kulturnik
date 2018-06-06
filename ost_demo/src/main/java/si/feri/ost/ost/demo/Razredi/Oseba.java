package si.feri.ost.ost.demo.Razredi;

public class Oseba {
    private int id;
    private String ime;
    private String priimek;
    private String email;
    private String geslo;
    private String datumRojstva;
    private String telefonska;
    private String avatar;


    public Oseba() {
    }

    public Oseba(int id, String ime, String priimek, String email, String geslo, String datumRojstva, String telefonska) {
        this.id = id;
        this.ime = ime;
        this.priimek = priimek;
        this.email = email;
        this.geslo = geslo;
        this.datumRojstva = datumRojstva;
        this.telefonska = telefonska;
    }

    public Oseba(String ime, String priimek, String email, String geslo, String datumRojstva, String telefonska) {
        this.ime = ime;
        this.priimek = priimek;
        this.email = email;
        this.geslo = geslo;
        this.datumRojstva = datumRojstva;
        this.telefonska = telefonska;
    }

    public Oseba(int id, String ime, String priimek, String email, String geslo, String datumRojstva, String telefonska, String avatar) {
        this.id = id;
        this.ime = ime;
        this.priimek = priimek;
        this.email = email;
        this.geslo = geslo;
        this.datumRojstva = datumRojstva;
        this.telefonska = telefonska;
        this.avatar = avatar;
    }

    public Oseba(String ime, String priimek, String email, String geslo, String datumRojstva, String telefonska, String avatar) {
        this.ime = ime;
        this.priimek = priimek;
        this.email = email;
        this.geslo = geslo;
        this.datumRojstva = datumRojstva;
        this.telefonska = telefonska;
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPriimek() {
        return priimek;
    }

    public void setPriimek(String priimek) {
        this.priimek = priimek;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGeslo() {
        return geslo;
    }

    public void setGeslo(String geslo) {
        this.geslo = geslo;
    }

    public String getDatumRojstva() {
        return datumRojstva;
    }

    public void setDatumRojstva(String datumRojstva) {
        this.datumRojstva = datumRojstva;
    }

    public String getTelefonska() {
        return telefonska;
    }

    public void setTelefonska(String telefonska) {
        this.telefonska = telefonska;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Ime='" + ime + '\'' +
                ", Priimek='" + priimek + '\'' +
                ", email='" + email + '\'' +
                ", geslo='" + geslo + '\'' +
                ", datumRojstva='" + datumRojstva + '\'' +
                ", telefonska='" + telefonska + '\'' +
                '}';
    }
}


