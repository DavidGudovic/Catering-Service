package beans;

import database.MD5;

public class Korisnik {

  
    private String adresa;
    private String ime;
    private String prezime;
    private String korisnickoIme;
    private String password;  //MD5 hash
    private int poeni;
    private Rola rola;

    public Korisnik() {
    }

    public Korisnik(String adresa, String ime, String prezime, String korisnickoIme,String password, int poeni, Rola rola) {
        this.adresa = adresa;
        this.ime = ime;
        this.prezime = prezime;
        this.korisnickoIme = korisnickoIme;
        this.password = MD5.getHash(password);
        this.poeni = poeni;
        this.rola = rola;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = MD5.getHash(password);
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

    public String getKorisnickoIme() {
        return korisnickoIme;
    }

    public void setKorisnickoIme(String korisnickoIme) {
        this.korisnickoIme = korisnickoIme;
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
