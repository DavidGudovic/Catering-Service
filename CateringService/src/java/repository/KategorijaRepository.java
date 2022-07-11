
package repository;

import beans.Kategorija;
import interfaces.IRepository;
import java.sql.SQLException;
import java.util.List;

public class KategorijaRepository implements IRepository<Kategorija> {

    @Override
    public void dodaj(Kategorija t) {
        
    }

    @Override
    public List<Kategorija> getSve() {
        return null;
    }

    @Override
    public void izmeni(Kategorija oldT, Kategorija newT) {
        
    }

    @Override
    public void izbrisi(Kategorija objekat) {
        
    }

    @Override
    public Kategorija getJedan(Kategorija trazeni) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
