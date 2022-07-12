
package repository;

import beans.Kategorija;
import database.ConnectionManager;
import interfaces.IRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KategorijaRepository implements IRepository<Kategorija> {

    @Override
    public void dodaj(Kategorija t) {
        
    }

    @Override
    public List<Kategorija> getSve() throws SQLException{
        Connection con = ConnectionManager.getConnection();
        String sql = "SELECT `KategorijaID`, `NazivKategorije`, `Program` FROM `kategorije` WHERE 1";
        List<Kategorija> kategorije = new ArrayList<>();
        try(PreparedStatement stmt = con.prepareStatement(sql)){
            ResultSet rs = stmt.executeQuery();
             while(rs.next()){
            kategorije.add(new Kategorija(rs.getString("Program"), rs.getString("NazivKategorije"),rs.getInt("KategorijaID")));
        }
        rs.close();
        return kategorije;
        }catch(SQLException sqle){
            throw sqle;
        } finally{
            con.close();
        }  
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
