package beans;

import java.util.HashMap;

public class Narudzbina {
    private String datumKreiranja;
    private String datumOstvarivanja;
    private String nacinPlacanja;
    private Korisnik korisnik;
    private int narudzbinaID;
    private int popust;
    private float UkupnaCena;
    private HashMap<Proizvod, Integer> stavkeNarudzbine; // cuva kolicinu proizvoda 

    //constructors
    public Narudzbina() {
        stavkeNarudzbine = new HashMap<>();
    }

    public Narudzbina(String datumKreiranja, String datumOstvarivanja,String nacinPlacanja, Korisnik korisnik, int narudzbinaID, int popust, float UkupnaCena, HashMap<Proizvod, Integer> stavkeNarudzbine) {
        this.datumKreiranja = datumKreiranja;
        this.datumOstvarivanja = datumOstvarivanja;
        this.nacinPlacanja = nacinPlacanja;
        this.korisnik = korisnik;
        this.narudzbinaID = narudzbinaID;
        this.popust = popust;
        this.UkupnaCena = UkupnaCena;
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
    public String getNacinPlacanja(){
        return nacinPlacanja;
    }
    public void setNacinPlacanja(String nacinPlacanja){
        this.nacinPlacanja = nacinPlacanja;
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

    public float getUkupnaCena() {
        return UkupnaCena;
    }

    public void setUkupnaCena(float UkupnaCena) {
        this.UkupnaCena = UkupnaCena;
    }

    public HashMap<Proizvod, Integer> getStavkeNarudzbine() {
        return stavkeNarudzbine;
    }

    public void setStavkeNarudzbine(HashMap<Proizvod, Integer> stavkeNarudzbine) {
        this.stavkeNarudzbine = stavkeNarudzbine;
    }
    
    //methods
    public void dodajProizvod(Proizvod p, int kolicina){
        stavkeNarudzbine.put(p, popust);
    }
}
