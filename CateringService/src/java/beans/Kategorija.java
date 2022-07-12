package beans;

public class Kategorija {
    private String program;
    private String nazivKategorije;
    private int kategorijaID;

    public Kategorija() {
    }

    public Kategorija(String program, String nazivKategorije, int kategorijaID) {
        this.program = program;
        this.nazivKategorije = nazivKategorije;
        this.kategorijaID = kategorijaID;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
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
