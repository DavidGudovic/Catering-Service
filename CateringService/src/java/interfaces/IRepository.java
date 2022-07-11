package interfaces;

import java.sql.SQLException;
import java.util.List;

public interface IRepository<T>{   // Svaki repozitori implementira tipiziranu verziju ovog interfejsa. 
    void dodaj(T t) throws SQLException;
    T getJedan(T trazeni) throws SQLException;
    List<T> getSve() throws SQLException;
    void izmeni(T oldT, T newT) throws SQLException;
    void izbrisi(T objekat) throws SQLException;
}
