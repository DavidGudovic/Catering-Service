package beans;

import java.io.Serializable;

public class Izvestaj implements Serializable{
    private String tekstIzvestaja;

    public Izvestaj() {
    }

    public Izvestaj(String tekstIzvestaja) {
        this.tekstIzvestaja = tekstIzvestaja;
    }

    public String getTekstIzvestaja() {
        return tekstIzvestaja;
    }

    public void setTekstIzvestaja(String tekstIzvestaja) {
        this.tekstIzvestaja = tekstIzvestaja;
    }
    
}
