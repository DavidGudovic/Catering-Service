package repository;

import beans.Narudzbina;
import beans.Proizvod;
import database.ConnectionManager;
import interfaces.IRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class NarudzbinaRepository implements IRepository<Narudzbina> {

    @Override
    public void dodaj(Narudzbina zaDodavanje) throws SQLException{
        Connection con = ConnectionManager.getConnection();
        String sqlNarudzbina = "INSERT INTO `narudzbine`( `KorisnickoIme`, `DatumKreiranja`, `DatumOstvarivanja`, `Ostvarena`, `UkupnaCena`, `Popust`) "
                + "VALUES (?,?,?,?,?,?)";
        String sqlStavke = "INSERT INTO `stavkenarudzbine`(`ProizvodID`, `NarudzbinaID`, `KorisnickoIme`, `Kolicina`)"
                + " VALUES (?,?,?,?)";
        Date trenutniDatum = new Date();
        java.sql.Date sqlDate = new java.sql.Date(trenutniDatum.getTime());
        //Dodavanje narudzbe
        try(PreparedStatement stmt = con.prepareStatement(sqlNarudzbina,Statement.RETURN_GENERATED_KEYS)){
            stmt.setString(1, zaDodavanje.getKorisnik().getKorisnickoIme());
            stmt.setDate(2, sqlDate);
            stmt.setDate(3, null);
            stmt.setInt(4, 0);
            stmt.setFloat(5, zaDodavanje.getUkupnaCena());
            stmt.setInt(6, zaDodavanje.getPopust());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next())
                zaDodavanje.setNarudzbinaID(rs.getInt(1));
        }catch(SQLException sqle){
            con.close();
            throw sqle;
        }
        //Dodavanje stavki batch
        try(PreparedStatement stmt = con.prepareStatement(sqlStavke)){          
        for(HashMap.Entry<Proizvod, Integer> stavka : zaDodavanje.getStavkeNarudzbine().entrySet()){
            stmt.setInt(1, stavka.getKey().getProizvodID());
            stmt.setInt(2, zaDodavanje.getNarudzbinaID());
            stmt.setString(3, zaDodavanje.getKorisnik().getKorisnickoIme());
            stmt.setInt(4, stavka.getValue());
            stmt.addBatch();
        }
        stmt.executeBatch();
        }catch(SQLException sqle){
            throw sqle;
        }finally{
            con.close();
        }
        
    }

    @Override
    public List<Narudzbina> getSve() {
    return null;
    }

    @Override
    public void izmeni(Narudzbina stariT, Narudzbina noviT) {
    }

    @Override
    public void izbrisi(Narudzbina zaBrisanje) {
    }

    @Override
    public Narudzbina getJedan(Narudzbina trazeni) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
