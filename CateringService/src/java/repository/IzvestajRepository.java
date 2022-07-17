package repository;

import beans.Izvestaj;
import interfaces.IRepository;
import java.sql.SQLException;
import java.util.List;

public class IzvestajRepository implements IRepository<Izvestaj> {

    @Override
    public void dodaj(Izvestaj zaDodavanje) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Izvestaj> getSve() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void izmeni(Izvestaj stariT, Izvestaj noviT) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void izbrisi(Izvestaj zaBrisanje) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Izvestaj getJedan(Izvestaj trazeni) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
