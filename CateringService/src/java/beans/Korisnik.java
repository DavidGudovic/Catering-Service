package beans;

public class Korisnik {

  
    private String adresa;
    private String ime;
    private String prezime;
    private int korisnikID;
    private int poeni;
    private int rolaID;

    public Korisnik() {
    }

    public Korisnik(String adresa, String ime, String prezime, int korisnikID, int poeni, int rolaID) {
        this.adresa = adresa;
        this.ime = ime;
        this.prezime = prezime;
        this.korisnikID = korisnikID;
        this.poeni = poeni;
        this.rolaID = rolaID;
    }
    
    
      public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public int getKorisnikID() {
        return korisnikID;
    }

    public void setKorisnikID(int korisnikID) {
        this.korisnikID = korisnikID;
    }

    public int getPoeni() {
        return poeni;
    }

    public void setPoeni(int poeni) {
        this.poeni = poeni;
    }

    public int getRolaID() {
        return rolaID;
    }

    public void setRolaID(int rolaID) {
        this.rolaID = rolaID;
    }
    
}
