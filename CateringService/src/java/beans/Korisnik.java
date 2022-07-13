package beans;

import database.MD5;
import java.sql.SQLException;
import repository.KorisnikRepository;

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

    public Korisnik(String korisnickoIme, String password) {  // Konstruktor za pretrage
        this.korisnickoIme = korisnickoIme;
        this.password = MD5.getHash(password);
    }

    public Korisnik(String adresa, String ime, String prezime, String korisnickoIme, String password, int poeni, Rola rola) {
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

    public void setPasswordHash(String passwordHash) {
        this.password = passwordHash;
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

    //Sistemske operacije
    // proverava da li se predata sifra podudara sa korisnikom u bazi koji dodaje repozitory
    // ako se podudara, puni objekat podacima iz baze i vraca true(uspeh);
    public boolean login() throws SQLException {
        KorisnikRepository repositorij = new KorisnikRepository();
        try {
            Korisnik celi = repositorij.getJedan(this);
            if (celi != null) {
                if (this.password.equals(celi.getPassword())) {
                    this.ime = celi.ime;
                    this.prezime = celi.prezime;
                    this.adresa = celi.adresa;
                    this.rola = celi.rola;
                    this.poeni = celi.poeni;
                    return true;
                } else {
                    return false;
                }
            } else return false;
        } catch (SQLException sqle) {
            throw sqle;
        }
    }

    // Predaje sebe repozitoriju za dodavanje u bazu, u slucaju greske forwarduje exception kontroleru
    public void registruj() throws SQLException {
        KorisnikRepository repositorij = new KorisnikRepository();
        try {
            repositorij.dodaj(this);
        } catch (SQLException sqle) {
            throw sqle;
        }
    }
}
