package beans;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import repository.IzvestajRepository;

public class Izvestaj implements Serializable {

    private HashMap<Proizvod, Integer> proizvodi;
    private HashMap<String, Integer> korisnici;
    private int ostvarene;
    private int totalOstvarene;
    private int otkazane;
    private int totalOtkazane;

    public Izvestaj() {
        proizvodi = new HashMap<>();
        korisnici = new HashMap<>();
        this.ostvarene = 0;
        this.totalOstvarene = 0;
        this.otkazane = 0;
        this.totalOtkazane = 0;
    }

    public HashMap<Proizvod, Integer> getProizvodi() {
        return proizvodi;
    }

    public void setProizvodi(HashMap<Proizvod, Integer> proizvodi) {
        this.proizvodi = proizvodi;
    }

    public HashMap<String, Integer> getKorisnici() {
        return korisnici;
    }

    public void setKorisnici(HashMap<String, Integer> korisnici) {
        this.korisnici = korisnici;
    }

    public int getOstvarene() {
        return ostvarene;
    }

    public void setOstvarene(int ostvarene) {
        this.ostvarene = ostvarene;
    }

    public int getTotalOstvarene() {
        return totalOstvarene;
    }

    public void setTotalOstvarene(int totalOstvarene) {
        this.totalOstvarene = totalOstvarene;
    }

    public int getOtkazane() {
        return otkazane;
    }

    public void setOtkazane(int otkazane) {
        this.otkazane = otkazane;
    }

    public int getTotalOtkazane() {
        return totalOtkazane;
    }

    public void setTotalOtkazane(int totalOtkazane) {
        this.totalOtkazane = totalOtkazane;
    }

    // Metode
    /*
     Prolazi kroz sve narudzbe dobijene od repositorija ( sve iz ovog meseca)
    Sabira otkazane, ostvarene, njihove totale, kao i totale kupljenih proizvoda i potrosnje korisnika.
     */
    public void formiraj() throws SQLException {
        IzvestajRepository izvestajRepository = new IzvestajRepository();
        List<Narudzbina> narudzbine = null;

        try {
            narudzbine = izvestajRepository.getSve();
        } catch (SQLException sqle) {
            throw sqle;
        }
        for (Narudzbina nar : narudzbine) {
            switch (nar.getStatus()) {
                case 1:
                    this.ostvarene++;
                    this.totalOstvarene += nar.getUkupnaCena();

                    //Put proizvode u mapu
                    for (Proizvod izNarudzbine : nar.getStavkeNarudzbine().keySet()) {
                        dodajProizvod(izNarudzbine, nar.getStavkeNarudzbine().get(izNarudzbine));
                    }

                    // put korisnika u mapu
                    this.korisnici.putIfAbsent(nar.getKorisnik().getKorisnickoIme(), 0);
                    this.korisnici.put(nar.getKorisnik().getKorisnickoIme(), korisnici.get(nar.getKorisnik().getKorisnickoIme()) + nar.getUkupnaCena());
                    break;
                case 2:
                    this.otkazane++;
                    this.totalOtkazane += nar.getUkupnaCena();
                    break;
            }
        }
    }

    //Proverava da li proizvod vec postoji u mapi i dodaje ga.
    private void dodajProizvod(Proizvod zaMapu, int kolicina) {
        for (Proizvod izMape : this.proizvodi.keySet()) {
            if (zaMapu.getProizvodID() == izMape.getProizvodID()) { // Ako je proizvod vec u mapi
                //inkrement vrednost u mapi
                this.proizvodi.put(izMape, proizvodi.get(izMape) + kolicina);
                return; // predji na sledeci proizvod u nar
            }
        }
        this.proizvodi.put(zaMapu, kolicina);
    }
}
