package beans;

import java.util.ArrayList;
import java.util.List;

public class Proizvod {

    private int proizvodID;
    private int cenaPoPorciji;
    private Kategorija kategorija;
    private String nazivProizvoda;
    private String opis;
    private String slika;  // relative path do slike.

    public Proizvod() {
    }

    public Proizvod(int proizvodID, int cenaPoPorciji, Kategorija kategorija, String nazivProizvoda, String opis, String slika) {
        this.proizvodID = proizvodID;
        this.cenaPoPorciji = cenaPoPorciji;
        this.kategorija = kategorija;
        this.nazivProizvoda = nazivProizvoda;
        this.opis = opis;
        this.slika = "./img/" + slika + ".jpg";
    }

    public int getProizvodID() {
        return proizvodID;
    }

    public void setProizvodID(int proizvodID) {
        this.proizvodID = proizvodID;
    }

    public int getCenaPoPorciji() {
        return cenaPoPorciji;
    }

    public void setCenaPoPorciji(int cenaPoPorciji) {
        this.cenaPoPorciji = cenaPoPorciji;
    }

    public Kategorija getKategorija() {
        return kategorija;
    }

    public void setKategorija(Kategorija kategorija) {
        this.kategorija = kategorija;
    }

    public String getNazivProizvoda() {
        return nazivProizvoda;
    }

    public void setNazivProizvoda(String nazivProizvoda) {
        this.nazivProizvoda = nazivProizvoda;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getSlika() {
        return slika;
    }

    public void setSlika(String slika) {
        this.slika = "./img/" + slika + ".jpg";
    }

    //STATIC metode
    // Vraca listu proizvoda filtriranih po kategoriji ili po programu (in 'slani' 'slatki')
    // Ako se pretrazuje po programu( != null ) kategorija ce biti ignorisana, u pozivima sam stavljao vrednost -1 simbolicno
    public static List<Proizvod> filtrirajPonudu(List<Proizvod> proizvodi, String trazeniProgram, int trazenaKategorija) {

        List<Proizvod> filtriraniProizvodi = new ArrayList<>();
        if (trazeniProgram == null) {   // filtriranje je po kategoriji
            for (Proizvod p : proizvodi) {
                if (p.getKategorija().getKategorijaID() == trazenaKategorija) {
                    filtriraniProizvodi.add(p);
                }
            }
        } else // filtriranje je po programu
        {
            for (Proizvod p : proizvodi) {
                if (p.getKategorija().getProgram().equals(trazeniProgram)) {
                    filtriraniProizvodi.add(p);
                }
            }
        }
        return filtriraniProizvodi;
    }
}
