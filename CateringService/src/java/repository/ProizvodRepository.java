package repository;

import beans.Proizvod;
import interfaces.IRepository;
import java.util.List;


public class ProizvodRepository implements IRepository<Proizvod> {

    @Override
    public void dodaj(Proizvod t) {
        }

    @Override
    public List<Proizvod> getSve() {
        return null;
    }

    @Override
    public void izmeni(Proizvod oldT, Proizvod newT) {
    }

    @Override
    public void izbrisi(Proizvod t) {
    }
    
}
