package repository;

import beans.Kategorija;
import beans.Proizvod;
import database.ConnectionManager;
import interfaces.IRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProizvodRepository implements IRepository<Proizvod> {

    @Override
    public void dodaj(Proizvod t) {
        }

    
    // Vraca ArrayList svih proizvoda iz baze i odgovarajuce kategorije inner join-om
    @Override    
    public List<Proizvod> getSve() throws SQLException{
        Connection con = ConnectionManager.getConnection();
        List<Proizvod> svi = new ArrayList<>();
        String sql = "SELECT `ProizvodID`, `NazivProizvoda`, `Opis`, `Slika`, `CenaPoPorciji`, proizvodi.`KategorijaID`, `NazivKategorije`, `Program`"
                     + " FROM `proizvodi` INNER JOIN `kategorije` ON proizvodi.KategorijaID = kategorije.KategorijaID"
                     + " WHERE 1";
        
        try(PreparedStatement stmt = con.prepareStatement(sql)){
        ResultSet rs = stmt.executeQuery();       
        while(rs.next()){
            svi.add(new Proizvod(rs.getInt("ProizvodID"),
                                rs.getInt("CenaPoPorciji"),
                                new Kategorija(rs.getString("Program"),rs.getString("NazivKategorije"),rs.getInt("KategorijaID")),
                                rs.getString("NazivProizvoda"),
                                rs.getString("Opis"),
                                rs.getString("Slika")));
        }        
        rs.close();
        return svi;
        }catch(SQLException sqle){
            throw sqle;
        }finally{
            con.close();
        }
    }

    @Override
    public void izmeni(Proizvod oldT, Proizvod newT) {
    }

    @Override
    public void izbrisi(Proizvod t) {
    }

    @Override
    public Proizvod getJedan(Proizvod trazeni) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
