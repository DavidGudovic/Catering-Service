package beans;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;
import java.util.List;
import repository.NarudzbinaRepository;
import repository.ProizvodRepository;

public class Narudzbina implements Serializable {

    private String datumKreiranja;
    private String datumOstvarivanja;
    private Korisnik korisnik;
    private int narudzbinaID;
    private int popust;
    private int ukupnaCena;
    private HashMap<Proizvod, Integer> stavkeNarudzbine; // cuva kolicinu proizvoda 

    //constructors
    public Narudzbina() {
        stavkeNarudzbine = new HashMap<>();
    }

    public Narudzbina(String datumKreiranja, String datumOstvarivanja, Korisnik korisnik, int narudzbinaID, int popust, int UkupnaCena, HashMap<Proizvod, Integer> stavkeNarudzbine) {
        if (datumKreiranja.equals("sada")) {
            Date d = new Date();
            this.datumKreiranja = d.toString();
        } else {
            this.datumKreiranja = datumKreiranja;
        }
        this.datumOstvarivanja = datumOstvarivanja;
        this.korisnik = korisnik;
        this.narudzbinaID = narudzbinaID;
        this.popust = popust;
        this.ukupnaCena = UkupnaCena;
        this.stavkeNarudzbine = stavkeNarudzbine;
    }

    //getters and setters
    public String getDatumKreiranja() {
        return datumKreiranja;
    }

    public void setDatumKreiranja(String datumKreiranja) {
        this.datumKreiranja = datumKreiranja;
    }

    public String getDatumOstvarivanja() {
        return datumOstvarivanja;
    }

    public void setDatumOstvarivanja(String datumOstvarivanja) {
        this.datumOstvarivanja = datumOstvarivanja;
    }

    public Korisnik getKorisnik() {
        return korisnik;
    }

    public void setKorisnik(Korisnik korisnik) {
        this.korisnik = korisnik;
    }

    public int getNarudzbinaID() {
        return narudzbinaID;
    }

    public void setNarudzbinaID(int narudzbinaID) {
        this.narudzbinaID = narudzbinaID;
    }

    public int getPopust() {
        return popust;
    }

    public void setPopust(int popust) {
        this.popust = popust;
    }

    public int getUkupnaCena() {
        return ukupnaCena;
    }

    public void setUkupnaCena(int UkupnaCena) {
        this.ukupnaCena = UkupnaCena;
    }

    public HashMap<Proizvod, Integer> getStavkeNarudzbine() {
        return stavkeNarudzbine;
    }

    public void setStavkeNarudzbine(HashMap<Proizvod, Integer> stavkeNarudzbine) {
        this.stavkeNarudzbine = stavkeNarudzbine;
    }

    // Sistemske operacije
    
    //STATIC metode
    
    public static List<Narudzbina> prikazNarudzbiKorisnika(Korisnik korisnik) throws SQLException{
        NarudzbinaRepository narudzbinaRepository = new NarudzbinaRepository();
        List<Narudzbina> rezultat = new ArrayList<>();
        try{
            rezultat = narudzbinaRepository.getSveOdKorisnika(korisnik);                        
        }catch(SQLException sqle){
            throw sqle;
        }
        return rezultat;
    }
    
    // Dodaje proizvod u hashmapu
    public void dodajProizvod(Proizvod p, int kolicina) throws SQLException {
        for (Proizvod prod : stavkeNarudzbine.keySet()) {
            if (prod.getProizvodID() == p.getProizvodID()) {
                stavkeNarudzbine.put(prod, stavkeNarudzbine.get(prod) + kolicina);
                return;
            }
        }
        // Ako je novi proizvod puni ga relevantnim podacima iz baze
        ProizvodRepository repository = new ProizvodRepository();
        try {
            stavkeNarudzbine.put(repository.getJedan(p), kolicina);
        } catch (SQLException sqle) {
            throw sqle;
        }
    }

    // Menja kolicinu zadatog proizvoda  po ID-u
    public void izmeniKolicinu(int proizvodID, int novaKolicina) {
        for (Proizvod prod : stavkeNarudzbine.keySet()) {
            if (prod.getProizvodID() == proizvodID) {
                stavkeNarudzbine.put(prod, novaKolicina);
                break;
            }
        }
    }

    //ukljanja zadati proizvod iz hashmape po ID-u
    public void ukloniProizvod(int proizvodID) {
        for (Proizvod prod : stavkeNarudzbine.keySet()) {
            if (prod.getProizvodID() == proizvodID) {
                stavkeNarudzbine.remove(prod);
                break;
            }
        }
    }

    //vraca total pre racunanja popusta
    public int getTotalBezPopusta() {
        int ukupno = 0;
        for (Proizvod stavka : stavkeNarudzbine.keySet()) {
            ukupno += (stavka.getCenaPoPorciji() * stavkeNarudzbine.get(stavka));
        }
        return ukupno;
    }

    //Predaje this repositoriju za dodavanje narudzbe u bazu i poziva dodavanje ostvarenih poena nad korisnikom koji je narucio 
    public void naruci() throws SQLException {
        NarudzbinaRepository repository = new NarudzbinaRepository();
        try {
            repository.dodaj(this);
            this.korisnik.dodajPoene(Math.round(this.ukupnaCena) / 2000);
        } catch (SQLException sqle) {
            throw sqle;
        }
    }

    //Racuna popust od poena 
    public void izracunajPopust(int poeni) {
        if (poeni > 0) {
            this.setPopust(poeni * 10);
            this.setUkupnaCena(this.getTotalBezPopusta() - ((this.getTotalBezPopusta() / 100) * this.popust));
        } else {
            this.setPopust(0);
            this.setUkupnaCena(this.getTotalBezPopusta());
        }
    }

}
