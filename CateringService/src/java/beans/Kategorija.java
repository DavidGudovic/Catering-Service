package beans;

public class Kategorija {
    private String opisKategorije;
    private String nazivKategorije;
    private int kategorijaID;

    public Kategorija() {
    }

    public Kategorija(String opisKategorije, String nazivKategorije, int kategorijaID) {
        this.opisKategorije = opisKategorije;
        this.nazivKategorije = nazivKategorije;
        this.kategorijaID = kategorijaID;
    }

    public String getOpisKategorije() {
        return opisKategorije;
    }

    public void setOpisKategorije(String opisKategorije) {
        this.opisKategorije = opisKategorije;
    }

    public String getNazivKategorije() {
        return nazivKategorije;
    }

    public void setNazivKategorije(String nazivKategorije) {
        this.nazivKategorije = nazivKategorije;
    }

    public int getKategorijaID() {
        return kategorijaID;
    }

    public void setKategorijaID(int kategorijaID) {
        this.kategorijaID = kategorijaID;
    }
    
}
