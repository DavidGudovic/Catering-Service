package repository;

import beans.Izvestaj;
import interfaces.IRepository;
import java.util.List;


public class IzvestajRepository implements IRepository<Izvestaj>{

    @Override
    public void dodaj(Izvestaj t) {
        }

    @Override
    public List<Izvestaj> getSve() {
        return null;
    }

    @Override
    public void izmeni(Izvestaj oldT, Izvestaj newT) {
        }

    @Override
    public void izbrisi(Izvestaj t) {
        }
    
}
