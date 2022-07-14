package repository;

import beans.Izvestaj;
import interfaces.IRepository;
import java.sql.SQLException;
import java.util.List;


public class IzvestajRepository implements IRepository<Izvestaj>{

    @Override
    public void dodaj(Izvestaj zaDodavanje) {
        }

    @Override
    public List<Izvestaj> getSve() {
        return null;
    }

    @Override
    public void izmeni(Izvestaj stariT, Izvestaj noviT) {
        }

    @Override
    public void izbrisi(Izvestaj zaBrisanje) {
        }

    @Override
    public Izvestaj getJedan(Izvestaj trazeni) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
