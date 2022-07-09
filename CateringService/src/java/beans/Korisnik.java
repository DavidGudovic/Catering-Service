package beans;

public class Korisnik {

  
    private String adresa;
    private String ime;
    private String prezime;
    private int korisnikID;
    private int poeni;
    private Rola rola;

    public Korisnik() {
    }

    public Korisnik(String adresa, String ime, String prezime, int korisnikID, int poeni, Rola rola) {
        this.adresa = adresa;
        this.ime = ime;
        this.prezime = prezime;
        this.korisnikID = korisnikID;
        this.poeni = poeni;
        this.rola = rola;
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

    public Rola getRola() {
        return rola;
    }

    public void setRola(Rola rola) {
        this.rola = rola;
    }
    
}
