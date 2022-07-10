package repository;

import beans.Narudzbina;
import interfaces.IRepository;
import java.util.List;

public class NarudzbinaRepository implements IRepository<Narudzbina> {

    @Override
    public void dodaj(Narudzbina t) {
    }

    @Override
    public List<Narudzbina> getSve() {
    return null;
    }

    @Override
    public void izmeni(Narudzbina oldT, Narudzbina newT) {
    }

    @Override
    public void izbrisi(Narudzbina t) {
    }
    
}
